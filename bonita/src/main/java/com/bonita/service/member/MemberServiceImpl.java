package com.bonita.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bonita.domain.MemberDTO;
import com.bonita.persistence.MemberDAO;

@Service
/*@Service 자바가 읽을수 있게 하는거*/
public class MemberServiceImpl implements MemberService{
	
		@Autowired
		PasswordEncoder passwordEncoder;
		
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
		@Override
		public MemberDTO userView(String id) {
			return mDao.userView(id);
		}
		@Override
		public void memUpdate(MemberDTO mDto, HttpSession session) {
			int result = mDao.memUpdate(mDto);
			
			
			// session.name = '체리'
			//  -----------> login 정보 '체리'
			// 회원정보 수정 name = '체리'
			if(result > 0) { // 수정성공
				// 세션에 로그인유저 정보를 수정된 정보로 변경
				session.removeAttribute("name");
				session.setAttribute("name", mDto.getName());
			}
			
		}
		@Override
		public int pwCheck(String id, String pw) {
			
			String encPw = mDao.pwCheck(id);
			int result = 0;
			if(passwordEncoder.matches(pw, encPw)) {
				result = 1;
			}
			
			return result;
		}
		@Override
		public void pwUpdate(MemberDTO mDto) {
			mDao.pwUpdate(mDto);
		}
		@Override
		public void memDrop(HttpSession session, String id) {
			// 비즈니스 로직(회원탈퇴)
			// 1) 해당회원의 useyn=n 으로 Update(DB)
			int result = mDao.memDrop(id);
			// 로그인 => session('초롱') : session 값이 있으면 로그인 OK
			// '초롱' => 회원탈퇴 session도 초기화
			
			// 2) 로그인 정보를 삭제(session 초기화)
			if(result > 0) {
				session.invalidate();
			}
		}
}


