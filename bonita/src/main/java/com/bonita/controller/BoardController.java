package com.bonita.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bonita.domain.BoardDTO;
import com.bonita.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		log.info(">>>>> POST : board list list");
		
		List<BoardDTO> list = bService.listAll(); // 게시물 목록
		// list만 쓰면 되는데 hashmap을 쓰는 이유는 넣을게 많기 떄문이다. 
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		
		model.addAttribute("map",map);
		//model.addAttribute("map", bService.listAll());
		
		return "board/list";
	}

}
