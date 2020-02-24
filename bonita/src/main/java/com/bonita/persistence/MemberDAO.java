package com.bonita.persistence;

import com.bonita.domain.MemberDTO;

public interface MemberDAO {
	
	// 회원가입 ID중복 체크(+Ajax)
	public int idOverLap(String id);
	
	// 회원가입 DB에 회원가입 등록

	public int memInsert(MemberDTO mDto);

}
