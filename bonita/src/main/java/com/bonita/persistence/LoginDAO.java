package com.bonita.persistence;

import com.bonita.domain.MemberDTO;

public interface LoginDAO {
	
	// 로그인
	public MemberDTO loginUser(MemberDTO mDto);
	
	

}
