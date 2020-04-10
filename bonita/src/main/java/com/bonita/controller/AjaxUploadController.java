package com.bonita.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bonita.service.board.BoardService;
import com.bonita.utill.MediaUtils;
import com.bonita.utill.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	//업로드 디렉토리 servlet-context.xml에 설정되어 있는 
	//의존성 주입 resource는 이름으로
	@Resource(name="uploadPath")
	String uploadPath;
	
	// Upload File 멀티파트파일에 save
	// 받은 파일을 utf-8로 받자
	// ResponseEntity 기본을 사용 안하고, 세밀한 제어를 하기위해 사용
	// Response 전송
	// <> 제네릭 : 들어오는 값을 체크한다. 타입강하게 체크한다. 유효성체크랑 비슷하다 
	// file.getOriginalFilename() 파일이름
	// file.getBytes() 파일 크기
	// HttpStatus.OK 200번대로
	// ajax 끝나고 view단 1.uploadpath:d:/developer/upload 2.파일이름  3.파일크기(byte) 4.httpstatus 성공
	
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		// 업로드한 파일 정보와 http 상태 코드를 함께 리턴
		// c:developer/upload/2020/04/08/s_1klj3123123_ddsun.png", 200 이 들어간다. 
		log.info("POST  : uploadAjax");
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	// 이미지 표시 기능
	@ResponseBody // view가 아닌 data리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		// 서버의 파일을 다운로드 하기 위한 스트럼
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		 
		try {
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 해더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			//Inputstream 생성
			in = new FileInputStream(uploadPath + fileName);
			//if (mType != null){//이미지 파일이면
			// headers.setContentType(mType);
			//}else{// 이미지가 아니면
			fileName = fileName.substring(fileName.indexOf("_")+1);
			//다운로드용 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			//큰 다옴표 내부에 "\"
			//바이트배열을 스트링으로
			//iso-8859-1 서유럽언어
			//new String(fileName.getBytes("utf-8"), "iso-8859-1")
			headers.add("Content-Disposition", "attachment; filename=\"" +new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
			//headers.add("Content-Disposition"
			//,"attachment; filename='"+fileName+"'");
			//}
			//바이트 배열, 헤더
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			} finally {
				if (in != null)
					in.close();// 스트림 닫기
			}
			return entity;
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {
		log.info("fileName:" + fileName);
		// 로컬드라이브에 있는 파일을 지운다 (디자인은x)
		// fileName : /2020/04/10/s_650cf3f6-9e66-44a5-805e-2090abc72b36_31715582100_68edad2706_h.jpg
		// formatName : jpg 확장자를 알아야 파일을 삭제
		// mType : JPG
		// 확장자 검사 
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		if(mType != null) { // 이미지 파일이면 원본이미지 삭제 if는 이미지일때 탄다
			String front = fileName.substring(0, 12);
			// front : /2020/04/10/ 끝값은 포함이 안된다
			String end = fileName.substring(14);
			// end : 650cf3f6-9e66-44a5-805e-2090abc72b36_31715582100_68edad2706_h.jpg 원본이미지
			// File.separatorChar : 유닉스/ 원도우즈 \
			// replace : (c:\\developer\ upload\2020\04\10650cf3f6-9e66-44a5-805e-2090abc72b36_31715582100_68edad2706_h.jpg)
			// 세팅값 file
			// delect(원본이미지 삭제) : c:\\developer\ upload\2020\04\10650cf3f6-9e66-44a5-805e-2090abc72b36_31715582100_68edad2706_h.jpg
			new File(uploadPath +(front+end).replace('/', File.separatorChar)).delete();
			// uploadPath (c://developer/upload/2020/04/10650cf3f6-9e66-44a5-805e-2090abc72b36_31715582100_68edad2706_h.jpg) 원본이미지 (썸네일x)
		}
		// 이미지 아닌것은 여기서부터 시작된다, 이미지인것은 if문을 타고 여기도 지워진다 2번 삭제
		// 원본파일 삭제(이미지면 썸네일 삭제)
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		// new File(C://developr\ upload\2020\04\10650cf3f6-9e66-44a5-805e-2090abc72b36_31715582100_68edad2706_h.jpg (썸네일 이미지)
		// 레코드 삭제
		// bService.deleteFile(fileName);
		// ResponseEntity 설정값을 디테일하게 주고싶을때 HttpStatus.OK 성공 200번
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}