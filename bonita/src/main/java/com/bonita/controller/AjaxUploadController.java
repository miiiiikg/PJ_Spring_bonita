package com.bonita.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bonita.service.board.BoardService;
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
	
	// 파일첨부 페이지로 이동
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		return "/upload/uploadAjax";
	}
	
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
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
}
