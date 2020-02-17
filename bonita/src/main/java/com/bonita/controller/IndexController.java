package com.bonita.controller;

import java.util.List;

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
	
	@GetMapping("/index")
	public String indexView(Model model) {
		log.info(">>>>>>>>> INDEX PAGE 출력");
		
		// 1. view단에 출력할 데이터
		// List<ProductDTO> list = iService.bestPdList();
		model.addAttribute("BestPdt", iService.bestPdList());
		
		// 2. 출력할 화면을 결정 
		// 1,2 dispatcher servlet 보내줌
		return "index";
	}

}
