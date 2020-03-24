package com.bonita.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bonita.domain.BoardDTO;

public interface BoardService {
	
	// 게시글 갯수 계산
	public int countArticle(String search_option, String keyword);
	
	// 목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> listAll(String search_option, String keyword, String sort_option, int start, int end);
	
	public BoardDTO view(int bno);
	
	// 조회수 +1증가
	public void increaseViewCnt(int bno, HttpSession sesssion);
	
	

}
