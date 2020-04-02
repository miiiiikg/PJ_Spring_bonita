package com.bonita.service.reply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bonita.domain.ReplyDTO;
import com.bonita.persistence.BoardDAO;
import com.bonita.persistence.ReplyDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ReplyDAO rDao;
	@Autowired
	public void newReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
	}
	
	public BoardDAO bDao;
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	@Override
	public List<ReplyDTO> list(int bno) {
		
		return rDao.list(bno);
	}
	@Transactional
	@Override
	public void insert(ReplyDTO rDto) {
		
		rDao.insert(rDto);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", rDto.getBno());
		map.put("type", "minus");
		
		rDao.replyCntUpdate(map);
	}
	
	@Transactional
	@Override
	public void delete(int rno, int bno) {
		// 1. 댓글 삭제
		rDao.delete(rno);
		
		// 2. 게시글 댓글 수 -1
		HashMap<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("type", "minus");
		rDao.replyCntUpdate(map);
		
	}

	


}
