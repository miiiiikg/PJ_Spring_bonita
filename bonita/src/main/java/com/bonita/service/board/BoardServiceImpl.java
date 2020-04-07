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
	public BoardDTO view(int bno) {
		
		return bDao.view(bno);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		// now_time : 현재시간 
		// plus_time : 조회수 + 1 시간
		// now_time - plus_time = ?? = 조회수 + 1증가후 지난시간
		
		long update_time = 0; // 조회수 +1 증가한 시간
		
		if(session.getAttribute("update_time_" + bno)!=null) {
			// 최근에 조회수를 올린시간
			update_time = (long)session.getAttribute("update_time_" + bno);
			
		}
		
		// 현재시간
		long current_time = System.currentTimeMillis();
		
		// 일정시간이(5000 = 5초) 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) {
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_" + bno, current_time);
		}
	
	}

	@Override
	public void delBoard(int bno) {
		bDao.delBoard(bno);
		
		
	}

	@Override
	public void write(BoardDTO bDto) {
		bDao.write(bDto);
		
	}

	@Override
	public void updateBoard(BoardDTO bDto) {
		bDao.updateBoard(bDto);
		
	}

	@Override
	public void answer(BoardDTO bDto) {
		// 답글 알고리즘
		// Current Status bDto:
		// answer: title, writer, type, content
		// main: bno, ref, re_level, re_step
		
		// 1) re_step을 수정
		//  : ref가 같은 row중에 메인 게시글의 re_step보다 크기가 큰 값을 찾아
		// 	  전부 + 1 => updateStep()_
		bDao.updateStep(bDto);
		
		// 2) 답글 DB에 INSERT 
		bDto.setRe_level(bDto.getRe_level()+1);
		bDto.setRe_step(bDto.getRe_step()+1);
		bDao.answer(bDto);
		
	}

}
