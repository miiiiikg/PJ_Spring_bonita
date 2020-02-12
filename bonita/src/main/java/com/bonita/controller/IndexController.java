package com.bonita.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class IndexController {

	@GetMapping("/")
	public String indexView(Model model) {
		log.info(">>>>>>>>> INDEX PAGE 출력");
		
		return "index";
	}

}
