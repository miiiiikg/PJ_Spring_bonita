package com.bonita.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bonita.domain.ReplyDTO;

public interface ReplyDAO {
	// 이름이 없으면 @param1 @param2로 정해진다.
	// replydao = mapper 맨위에 이름이 같아야한다. 
	// package com.bonita.persistence; = <mapper namespace="com.bonita.persistence.ReplyDAO">
	public List<ReplyDTO> list(@Param("bno") int bno);
	
	public int insert(ReplyDTO rDto);
	
	public void replyCntPlus(@Param("bno") int bno);
	

}
