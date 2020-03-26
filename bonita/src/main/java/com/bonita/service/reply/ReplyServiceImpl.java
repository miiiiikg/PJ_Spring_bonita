package com.bonita.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bonita.domain.ReplyDTO;
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
	
	@Override
	public List<ReplyDTO> list(int bno) {
		
		return rDao.list(bno);
	}

	@Override
	public void insert(ReplyDTO rDto) {
		
		rDao.insert(rDto);
		
		rDao.replyCntPlus(rDto.getBno());
	}

	


}
