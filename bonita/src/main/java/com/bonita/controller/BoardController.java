package com.bonita.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bonita.domain.BoardDTO;
import com.bonita.service.board.BoardService;
import com.bonita.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	// 항상 들고다녀야 하는것
	public String list(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="new") String sort_option,
			@RequestParam(defaultValue ="all") String search_option,
			@RequestParam(defaultValue ="") String keyword,
			Model model, HttpSession session) {
		log.info(">>>>> POST : board list list");
		
		// 게시글 갯수 계산 
		int count = bService.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> list = bService.listAll(search_option, keyword, sort_option, start, end); // 게시물 목록
		
		// list만 쓰면 되는데 hashmap을 쓰는 이유는 넣을게 많기 떄문이다. 
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map",map);
		//model.addAttribute("map", bService.listAll());
		
		return "board/list";
	}

}
