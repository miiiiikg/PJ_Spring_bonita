package com.bonita.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bonita.domain.MemberDTO;
import com.bonita.persistence.MemberDAO;

@Service
/*@Service 자바가 읽을수 있게 하는거*/
public class MemberServiceImpl implements MemberService{
		@Autowired
		public SqlSession sqlSession;
		
		public MemberDAO mDao;
		@Autowired
		public void newMemberDAO() {
			mDao= sqlSession.getMapper(MemberDAO.class);
		}
		@Override
		public int idOverlap(String id) {
			return mDao.idOverLap(id);
		}
		@Override
		public int memInsert(MemberDTO mDto) {
			return mDao.memInsert(mDto);
		}
}


