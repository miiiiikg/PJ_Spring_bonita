package com.bonita.utill;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;


import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// uuid 발급
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		// 업로드할 디렉토리 생성
		// calcPath 내장함수x 캘린더 날짜 폴더를 만들어서 넣어준다. 
		String savedPath = calcPath(uploadPath);
		// 업로드 d드라이브에 디렉토리에 uploadpath + 20200408
		File target = new File(uploadPath + savedPath, savedName);
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		// 어디에 어떤이름으로 첨부파일(fileData) 여기에 데이터를 넣어준다
		FileCopyUtils.copy(fileData, target);
		// 파일의 확장자 검사
		// a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		String uploadedFileName = null;
		// 이미지 파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	public static String calcPath(String uploadPath) {
		// 오늘 달력
		Calendar cal = Calendar.getInstance(); 
		// yearPath = /2020 separator 구분자/    
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// monthPath = /2020/04 0부터 12로 인식해서 month+1을 해줘야한다. 
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		// datePath = /2020/04/08
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// 
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		return datePath;
	}
	
	// 동일한 타입의 매개변수를 여러개 받을때 ...을 사용한다. list 
	// 사용이유: 동적으로 매개변수가 바뀌어야할때
	private static void makeDir(String uploadPath, String... paths) {
		// 디렉토리가 존재하면 skip
		// 마지막값을 꺼내오는 
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		} 
		for (String path: paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}
	
	// uploadPath : C:\developer\//upload savedPath : /2020/04/08 fileName : djfkjlsajl_abc.txt
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		// 아이콘의 이름  File.separator \
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴 
		// File.separatorChar : 디렉토리 구분자
		// 윈도우 \, 유닉스(리눅스) / replace 치환
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		// iconName = C:/developer/upload/2020/04/08
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를  읽기 위한 버퍼
		// sourceImg가 원본이미지 
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 100픽셀 단위의 썸네일 생성 scalr가 썸네일을 생성 새로길이를 100픽셀에 맞게 줄여준다.
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일 이름
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		// 썸네일 생성 toUpperCase(): 대문자로 바꿔준다.
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}

