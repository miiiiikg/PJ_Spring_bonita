package com.bonita.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bonita.domain.ReplyDTO;
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
	
	@ResponseBody
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info(">>>> POST : Reply Insert DB");
		
		log.info(rDto.toString());
		
		// 비즈니스 로직
		// 해당 게시글에 댓글을 등록하고, 해당 게시글의 reply_cnt를 +1함
		// 1. 댓글등록 
		
		rService.insert(rDto);
	
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public void delete(int rno, int bno) {
		log.info(">>>> POST : Reply Delete DB");
		
		rService.delete(rno,bno);
		
		
	}
}
