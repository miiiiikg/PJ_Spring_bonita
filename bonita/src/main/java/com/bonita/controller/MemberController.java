package com.bonita.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bonita.domain.MemberDTO;
import com.bonita.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired
	MemberService mService;
	
	@GetMapping("/constract")
	public String viewConstract() {
		
		log.info(">>>>>>>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
	
//	@GetMapping("/join")
//	public String viewjoin() {
//		
//		log.info(">>>>>>>>>> MEMBER/JOIN PAGE 출력");
//		return "member/join";
//	}
	
	@GetMapping("/join")
	public String getJoin(MemberDTO mDto) {
		log.info(">>>>>>> MEMBER/JOIN PAGE GET 출력");
		log.info(mDto.toString());
		
		return "member/join";
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public int idOverlap(String id) {
		log.info(">>>>>>>>> ID OVERLAP CHECK");
		log.info("아이디:"+id);
		return mService.idOverlap(id);
	}



}
