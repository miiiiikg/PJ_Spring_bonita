package com.bonita.service.reply;

import java.util.List;


import com.bonita.domain.ReplyDTO;

public interface ReplyService {
	
	public List<ReplyDTO> list(int bno);

	public void insert(ReplyDTO rDto);
	
	public void delete(int rno, int bno);
	
}
