package com.bonita.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@GetMapping("/list")
	public String list() {
		log.info(">>>>> POST : board list list");
		
		return "board/list";
	}

}
