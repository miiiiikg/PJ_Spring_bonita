package com.bonita.service.index;

import java.util.List;

import com.bonita.domain.ProductDTO;

public interface IndexService {
	
	// 베스트 상품을 5건 출력
	public List<ProductDTO> bestPdList();
	
	// 신상품을 5건 출력
	public List<ProductDTO> newPdtList();
	

}
