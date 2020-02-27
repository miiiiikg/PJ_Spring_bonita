package com.bonita.service.login;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import com.bonita.domain.MemberDTO;
import com.bonita.persistence.LoginDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private SqlSession sqlSession;
	
	private LoginDAO lDao;
	@Autowired
	public void newMemberDAO() {
		lDao = sqlSession.getMapper(LoginDAO.class);
	}
	
	@Override
	public int login(MemberDTO mDto, HttpSession session) { 
		// 비즈니스로직 처리
		// 1. DB에 가서 회원인지 아닌지 유무 체크
		MemberDTO loginDto= lDao.loginUser(mDto);
		log.info("************************* 로그인 결과");
		
		// 로그인 결과값
		int result = 0;
		
		// result 결과
		// 0 : 등록된 회원이 아닙니다. 회원가입을 진행해주세요.
		// 2 : 이메일 인증을 하셔야만 로그인할 수 있습니다.
		// 1 : 로그인 성공
		// 3 : 아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해주세요.
		
		
		// 회원 정보가 없는 경우
		if(loginDto == null) {
			result = 0;
			return result;
		} 
		
		// 인증 안 했을 경우
		if(!(loginDto.getUseyn().equals("y"))) {
			result = 2;
			return result;
		}
		
		
		// 회원정보가 잇고 인증을 안한 경우
		if(loginDto != null) {
			// 아이디와 패스워드가 같은지 체크
			if(passwordEncoder.matches(mDto.getPw(), loginDto.getPw())){
				// 로그인 진행
				result = 1;
				// 세선에 로그인 유저 정보를 저장
				session.removeAttribute("userid");
				session.removeAttribute("name");
				session.setAttribute("userid", loginDto.getId());
				session.setAttribute("name", loginDto.getName());
			} else {
				result = 3;
			}
		}
		return result;
	}
	@Override
	public void logout() {
		
	}
	
}
