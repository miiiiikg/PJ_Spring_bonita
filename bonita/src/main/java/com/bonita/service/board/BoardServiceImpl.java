package com.bonita.service.board;

import java.util.List;

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
	public List<BoardDTO> listAll() {
		return bDao.listAll();
	}
	
	

}
