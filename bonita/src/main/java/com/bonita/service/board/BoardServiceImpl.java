package com.bonita.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bonita.domain.BoardDTO;
import com.bonita.persistence.BoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	BoardDAO bDao;
	
	@Autowired
	public void freePdDAO() {
		
		bDao = sqlSession.getMapper(BoardDAO.class);
	}

	@Override
	// list 15건
	public List<BoardDTO> listAll(String search_option, String keyword, String sort_option, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("start" , start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword" , "%"+keyword+"%");
		
		return bDao.listAll(map);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword" , "%"+keyword+"%");
		
		return bDao.countArticle(map);
	}

	@Override
	public void view(BoardDAO bDao) {
		
		return bDao.view();
		
	}
	
	

}
