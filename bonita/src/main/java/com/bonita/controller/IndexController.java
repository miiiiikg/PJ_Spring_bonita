package com.bonita.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bonita.domain.ProductDTO;
import com.bonita.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {
	// @Inject, @Autowired, @Resource중 1개라도 붙어있으면 의존성 주입
	
	// @Inject와 @Autowire는 타입(변수)으로 의존성 주입
	@Autowired
	IndexService iService;
	
	@RequestMapping("/")
	public String indexView(Model model, HttpSession session) {
		log.info(">>>>>>>>> INDEX PAGE 출력");
		
		// 1. view단에 출력할 데이터
		// 1. view단 출력할 베스트상품 5건
		// List<ProductDTO> list = iService.bestPdList();
		model.addAttribute("BestPdt", iService.bestPdList());
		
		// 2.view단에 출력할 신상품 5건
		// : 신상품5건을 출력하는 비즈니스 로직을 처리하는 서비스단으로 이동
		// iService.newPdtList();
		model.addAttribute("newPdt", iService.newPdtList());
		
		// 개발 종료시 삭제할 것!
		session.removeAttribute("userid");
		session.removeAttribute("name");
		session.setAttribute("userid", "gpfhdzlxl");
		session.setAttribute("name", "미경");
		// 2. 출력할 화면을 결정 
		// 1,2 dispatcher servlet 보내줌
		return "index";
	}

}
