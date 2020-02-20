package com.bonita.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bonita.persistence.MemberDAO;

@Service
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
			// TODO Auto-generated method stub
			return 0;
		}
}


