package com.bonita.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping("/view/{bno}") 
	public String view (@PathVariable(value="bno") int bno, 
						Model model,
						HttpSession session) {
		log.info(">>>>> POST : board Detail Page");
		
		// 1. 해당 bno의 조회수 +1 증가
		bService.increaseViewCnt(bno, session);
		
		// 2. DB에서 해당 bno정보를 get해서 view단으로 전송
		model.addAttribute("one", bService.view(bno));
		model.addAttribute("key", "dropBoard");
		
		return "board/view";
	}
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info(">>>>> GET : board Delete Action");
		bService.delBoard(bno);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/write")
	public String write() {
		
		log.info(">>>>> POST : board write write");
		
		return "board/writer";
	}
	
	// 게시글 등록
	@PostMapping("/write")
	public String write(BoardDTO bDto) {
		log.info(">>>>> POST : board write Action");
		log.info(bDto.toString());
		
		if(bDto.getFiles() == null) { // 첨부파일 no
			bDto.setFileCnt(0);
		} else { // 첨부파일 yes
			log.info("첨부파일 수:" + bDto.getFiles().length);
			bDto.setFileCnt(bDto.getFiles().length);
		}
		
		bService.write(bDto);
		//log.info("currval:" + bDto.getBno());
		
		return "redirect:/board/view/" + bDto.getBno();
	}
	
	@GetMapping("/update")
	public String updateBoard(int bno, Model model) {
		log.info(">>>>> GET : Board update view Page");
		log.info("bno:" + bno);
		
		// 수정을 원하는 게시글의 정보를(1줄) 원함
		
		model.addAttribute("one", bService.view(bno));
		model.addAttribute("flag", "update");
		return "/board/writer";
	}
	
	@PostMapping("/update")
	public String updateBoard(BoardDTO bDto) {
		
		log.info(bDto.toString());
		bService.updateBoard(bDto);
		
		return "redirect:/board/view/"+bDto.getBno();
	}
	
	@GetMapping("/answer")
	// 객체생성 해준다 controller 
	public String answerBoard(BoardDTO bDto, Model model) {
		log.info(">>>>>> GET: Board answer view Page");
		bDto = bService.view(bDto.getBno());
		
		String newContent = "<p style='font-size:20px; font-weight:bold;'>이전게시글내용</p>" +
							 bDto.getView_content() +
							 "<br> ============================= ";
		bDto.setView_content(newContent);
		
		model.addAttribute("one", bDto);
		model.addAttribute("flag", "answer");
		return "/board/writer";
		
	}
	@PostMapping("/answer")
	public String answerBoard(BoardDTO bDto) {
		log.info(">>>>>>> POST : Board answer Action");
		// 현재상태  : 답글(bno(메인게시글), 타입, 제목, 내용, 작성자)
		log.info("답글DTO:" + bDto.toString());
		
		// 현재상태 : 메인(ALL, ref, re_level, re_step)
		BoardDTO prevDto = bService.view(bDto.getBno());
		log.info("메인DTO :" + prevDto.toString());
		
		if(bDto.getFiles() == null) { // 첨부파일 no
			bDto.setFileCnt(0);
		} else { // 첨부파일 yes
			log.info("첨부파일 수:" + bDto.getFiles().length);
			bDto.setFileCnt(bDto.getFiles().length);
		}
		
		// 현재 상태 : 답글(bno(메인게시글), 타입, 제목, 내용, 작성자
		//			ref(메인), re_level(메인), re_step(메인))
		bDto.setRef(prevDto.getRef());
		bDto.setRe_level(prevDto.getRe_level());
		bDto.setRe_step(prevDto.getRe_step());
		// ref, re_step, re_level
		// ref = 그래도 메인게시글 ref c&p
		// re_step = 메인게시글 re_step + 1
		// re_level = 메인게시글 re_level + 1
		
		bService.answer(bDto);
		
		return "redirect:/board/view/"+ bDto.getBno();
	}
	
	@PostMapping("/getAttach")
	@ResponseBody
	public List<String> getAttach(int bno) {
		log.info(">>>>>> POST : Board getAttach Action");
		log.info(">>>> bno: " + bno);
		return bService.getAttach(bno);
	}

}
