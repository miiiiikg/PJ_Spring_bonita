package com.bonita.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		// 이전 페이지 URL을 GET
		String referer = request.getHeader("referer");
		log.info(">>>>이전 URL: " + referer);
		
		// login no
		if(session.getAttribute("userid") == null ) {
			log.info(">>>> NOLOGIN :(");
			
			// 
			String uri = request.getRequestURI();
			log.info(">>>>> 목적지: " + uri);
			
			if(referer == null) {
				// url로 바로 접근한 경우(referer이 없는 경우) 인덱스로
				// 외부에서 접속했을때 null값이 들어와서 
				referer = "http://localhost:8081/bonita/";
			} else {
				// 게시글 등록, 수정(로그인이 필요한 view단)
				// 내부에서 접근했을때
				int index = referer.lastIndexOf("/");
				int len = referer.length();
				// log.info(">>>>> 인덱스:" + index);
				// log.info(">>>>> 길이:" + len);
				String mapWord = referer.substring(index, len);
				// log.info("수정된 URL:" + mapWord);
				// log.info(">>>>> 이전 url" + referer);
				
				if(mapWord.equals("/write")) {
					response.sendRedirect(request.getContextPath() + "/board/list");
					return false;
				}
				
			}
			
			// url만  신경, GET or POST 중요하지 않음
			// 회원 수정 페이지 : GET:/member/update
			// 회원수정DB : POST:/member/update
			// /member/update 
			// request(GET, POST) > response(forward, sendRedirect)
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			fMap.put("uri", uri);
			
			// URL로 바로 접근한 경우(referer이 없는 경우) 인덱스로
			log.info("null URL:" + referer);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
						
			return false; // 이동 x
		} else { // login ok
			log.info(">>>> LOGIN :)");
			return true; // 이동 o 	
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	

}
