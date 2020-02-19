package com.bonita.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bonita.domain.ProductDTO;
import com.bonita.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexServiceImpl implements IndexService {
	
	// 기존에는 DAO => Mybatis => DB(Oracle) 순차적으로
	// 동작해서 비효율적이던 실행방법을 다음과 같이
	// DAO + Mapper를 결합해서 사용하는 방식을 사용
	
	// sqlSession을 사용하기 위한 의존성 주입
	// : root-context.xml에서 생성된 sqlSession 빈즈를 주입 받음!
	@Autowired
	private SqlSession sqlSession;
	
	ProductDAO pDao; // 전역변수 
	@Autowired
	public void newProductDAO() {
		// mapper -> sql문 getmapper -> sql문을 가져온다.
		
		pDao = sqlSession.getMapper(ProductDAO.class);
	}

	@Override
	public List<ProductDTO> bestPdList() {
 
		// 비즈니스로직 : best상품 5건을 조회해서 view(메인)단에 출력
		// log.info("@d응 사용한 방법:" +pDao.getCount());
		// List<ProductDTO> list = pDao.bestPdtList();
		
//		for (ProductDTO productDTO : list) {
//			log.info(productDTO.toString());
//		}
		
		return pDao.bestPdtList();
	}

	@Override
	public List<ProductDTO> newPdtList() {
		// 3. 비즈니스 로직을 처리 : 신상품 4건을 출력 => DB작업
		// 					 : DB작업은 Model단 시킴
		
		// DB작업을 위해 Model단으로 이동
		// MOdel(ProductDAO+Mapper) 인터페이스의 newPdtList() 메서드를 실행하고 return 받음!
		// List<ProductDTO> list = pDao.newPdtList(); // 5건 신상품;
		return pDao.newPdtList();
	}
	
	

}
