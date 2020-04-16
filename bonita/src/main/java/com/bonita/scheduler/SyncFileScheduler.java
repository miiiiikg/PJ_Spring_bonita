package com.bonita.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.bonita.domain.AttachDTO;
import com.bonita.persistence.BoardDAO;
import com.bonita.utill.MediaUtils;

import lombok.extern.slf4j.Slf4j;

// 게시글 첨부파일 사용시 로컬에 저장된 첨부파일과
// DB에 저장된 첨부파일 이름이 매칭이 안되는 경우 아무도 사용하지 않는 파일
// 고로 로컬에서 삭제 ! 하루에 한번씩 새벽시간에 전날 로컬첨부파일 폴더를 대상으로

@Slf4j
@Component
public class SyncFileScheduler {
	
	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao;
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	// @Resource(name = "uploadPath")
	String uploadPath = "C:/developer/upload";
	
	// 하루 전날 파일 목록 가져오기
	private String getFolderYesterday() {
		// fomat 형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		// 오늘 날짜 가져오기 ex) 2020-04-16
		Calendar cal = Calendar.getInstance();
		// 오늘 날짜에서 -1해서 어재로 설정
		cal.add(Calendar.DATE, -1);
		// 어제날짜 yyyy-MM-dd로 설정 ex) 2020-04-15
		String str =sf.format(cal.getTime());
		// File.separator은 \ 또는 /로 파일 경로를 분리
		// 2020-04-15을 2020\04\15으로 변경
		return str.replace("-", File.separator);
	}
	
	// 매일 새벽 2시에 첨부파일 목록과 DB를 비교해서
	// DB에 없는 첨부파일을 로컬 디렉토리에서 삭제
	@Scheduled(cron = "0 0 2 * * *")
	public void CheckFile() throws Exception {
		log.warn("File Check Task run ..............");
		log.warn("" + new Date());
		
		// DB에 등록되어 있는 첨부파일 목록 불러오기
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		log.info("어제날짜:" + sf.format(cal.getTime()));
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		
//		for(AttachDTO one : fileList) {
//			log.info(one.toString());
//		}
		
		// 람다식
		// stream : 배열에서 하나씩 값을 꺼내준다. import
		// map : 꺼내오는 데이터를 전처리를 한다 (stream이 없으면 사용x) 
		// collect : 전처리까지 되는 작업을 collect로 넣어준다. save
		// 매개변수 왼쪽 -> 함수(실행하는 코드)
		
		// 예) fileList[0] = ab.txt	
		// 	   stream(ab.txt)		
		//     map(c:/upload/ab.txt)		
		//     collect()
		//     fileListPaths[0] = c:upload/ab.txt
		List<Path> fileListPaths = fileList.stream()
					.map(dto -> Paths.get(uploadPath+dto.getFullname()))
					.collect(Collectors.toList());
		// 파일목록 : 파일, 썸네일 이미지
		
		// 이미지 파일이면 DB에 썸네일 이미지파일이 등록되어있기 때문에
		// 파일목록에 원본이미지 파일도 등록
		for (AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType != null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				// File.separatorChar : 유닉스 / 원도우즈 \
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
			}
		}
		
		// 파일목록 : 파일, 원본이미지, 썸네일 이미지
		fileListPaths.forEach(p -> log.info("" + p));
		
		// 하루 전날 첨부파일 저장 폴더 지정
		// tofile : 모든 목록
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile();

		// 디렉토리의 파일목록(디렉토리 포함)을 File배열로 반환
		// DB 첨부파일 목록과 하루전폴더의 첨부파일과 매칭!
		// => DB에 없는 첨부파일 목록 = 삭제목록 생성
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		
		// DB에 등록되지 않은 첨부파일 삭제 시작
		log.warn("=================================================");
		for(File file : removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
}
