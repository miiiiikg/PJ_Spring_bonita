package com.bonita.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bonita.persistence.MemberDAO;


@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	// 이메일 난수 생성 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer(); // String을 써도 작업은 된다. StringBuffer 문자열처리 효율성
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48; // 난수를 만드는 것 
			if((num >= 48 && num <= 75) || (num >=65 && num <= 90) || (num >= 97 && num <= 122 )) {
				sb.append((char)num);
		} else {
			continue;
		}
	} while (sb.length() < size);
	if(lowerCheck) {
		return sb.toString().toLowerCase();
	 }
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// 회원가입 발송 이메일(인증키 발송)
	@Override
	public void mailSendUser(String email, String id, HttpServletRequest request) {
		String key = getKey(false, 20); // 길이가 20인 난수 생성
		// String : 불변의 값 , 값을 바꿀수가 없다. 값을 새로 만들면 번지도 달라지고 기존에 만들었던 것은 버려진다
		// StringBuffer : Buffer(임시저장소 ,속도차이)
		mDao.getKey(id, key);
		// Mime타입 : 사진, 동영상 , 첨부파일을 사용할려면 사용
		MimeMessage mail = mailSender.createMimeMessage();
		// model1방식
		String htmlTxt = "<h2>안녕하세요 bonita입니다 :) <h2><br><br>"
				+ "<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 bonita 사이트 활동이 가능합니다. "
				+ "<a href='http://localhost:8081"+ request.getContextPath() + "/member/keyauth?id=" 
				+ id + "&key=" + key + "'>인증하기</a></p>"
				+ "(bonita에 가입한적이 없다면 무시하셔도 됩니다)"; 
				
		try {
			mail.setSubject("[본인인증] bonita님의 인증메일입니다.","utf-8"); // 메일 제목
			mail.setText(htmlTxt,"utf-8", "html"); // 메일 내용, 본문 html형식  한글:utf-8
			mail.addRecipient(RecipientType.TO, new InternetAddress(email)); // 메일 수신자
			mailSender.send(mail); // 메일 발송
		} catch(MessagingException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int keyAuth(String id, String key) {
		return mDao.alterKey(id, key);
	}

}
