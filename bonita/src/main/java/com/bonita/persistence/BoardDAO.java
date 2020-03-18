package com.bonita.persistence;

import java.util.List;

import com.bonita.domain.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> listAll();
}
