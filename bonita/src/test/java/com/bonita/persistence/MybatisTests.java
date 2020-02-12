package com.bonita.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

//JUnit 4 버전으로 테스트
@RunWith(SpringJUnit4ClassRunner.class)
//스프링 설정 파일의 위치를 지정
@ContextConfiguration(locations=
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTests {
	//로킹을 위한 변수
	private static final Logger logger =
			LoggerFactory.getLogger(MybatisTests.class);
	//의존관계 주입코드
	@Inject
	private SqlSessionFactory sqlFactory;

	@Test
	public void testFactory() {
		logger.info("sqlFactory:"+sqlFactory);
	}
	
	@Test
	public void textSession() {
		try(SqlSession sqlSession=sqlFactory.openSession()) {
			System.out.println("SqlSession"+sqlSession);
			System.out.println("Mybatis 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
