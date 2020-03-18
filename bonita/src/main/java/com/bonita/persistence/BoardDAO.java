package com.bonita.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.bonita.domain.BoardDTO;

public interface BoardDAO {
	
	// 게시글 갯수 계산
	public int countArticle();
	
	// 목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> listAll(@Param("map") Map<String, Object> map);
	
}