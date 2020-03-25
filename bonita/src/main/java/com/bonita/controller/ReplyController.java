package com.bonita.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bonita.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public String list(int bno, Model model) {
		//log가 안뜨면 view에서 function에서 못가져오는것
		log.info(">>>> GET : Reply list page");
		
		// 앞에가 이름(list)이고 뒤에가 실제데이터 return이 꼭 있어야한다. 없으면 null값이 들어간다.
		// model은 화면이동
		model.addAttribute("list", rService.list(bno));
		
		// type 
		return "/board/commentlist";
	}
}
