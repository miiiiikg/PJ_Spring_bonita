package com.bonita.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bonita.domain.BoardDTO;

public interface BoardDAO {
	
	// 게시글 갯수 계산
	public int countArticle(@Param("map") Map<String, String> map);
	
	// 목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> listAll(@Param("map") Map<String, Object> map);
	
	public BoardDTO view(int bno);
	
	// 조회수 +1 증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	// 게시글삭제
	public void delBoard(int bno); 
	
}
