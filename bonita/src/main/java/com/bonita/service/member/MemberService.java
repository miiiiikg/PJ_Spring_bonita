package com.bonita.service.member;

import javax.servlet.http.HttpSession;

import com.bonita.domain.MemberDTO;

public interface MemberService {
	
	// 회원가입 id중복체크(AJAX)
	public int idOverlap(String id);
	
	// 회원가입 (DB에 등록)
	public int memInsert(MemberDTO mDto);
	
	// 1명의 회원정보
	public MemberDTO userView(String id);
	
	// 회원수정 (DB에 수정)
	public void memUpdate(MemberDTO mDto, HttpSession session);

	// 비밀번호 수정 : 현재비밀번호 체크 
	public int pwCheck(String id, String pw);
	
	// 비밀번호 수정 : DB에 수정
	public void pwUpdate(MemberDTO mDto);
	
	// 회원탈퇴 : useyn = n
	public void memDrop(HttpSession session, String id);
	

}
