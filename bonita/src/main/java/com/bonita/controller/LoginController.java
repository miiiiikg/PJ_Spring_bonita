package com.bonita.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bonita.domain.MemberDTO;
import com.bonita.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/login")
@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	LoginService lService;
	
	@ResponseBody
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {
		log.info(">>>>>>>>>>> POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		 
		// 로그인
		int result = lService.login(mDto, session);
		
		return result;
	}
	@ResponseBody
	@PostMapping("/out")
	public void logOut(HttpSession session) {
		log.info(">>>>>>> POST : LOGOUT/LOGOUT ACTION");
		
		lService.logout(session);
		
	}
}
