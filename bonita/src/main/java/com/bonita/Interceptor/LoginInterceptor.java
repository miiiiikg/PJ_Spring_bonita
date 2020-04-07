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
		// session 객체 생성
		HttpSession session = request.getSession();
		// 이동하기 전 있었던 Page URL 이전 페이지 URL을 GET
		String referer = request.getHeader("referer");
		log.info(">>>>이전 URL: " + referer);
		// 	qString 값이 없으면 null값이 들어온다.
		String qString = request.getQueryString();
		log.info(">>>>>>> queryString :" + qString);
		// 이동하려고 했던 목적지 Page URL
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String nextUrl = uri.substring(ctx.length());
		String prevUrl = "";
		String finalUrl = "http://localhost:8081/bonita";
		// session = []
		// referer = [http://localhost:8081/bonita/board/list]
		// uri = [/bonita/board/write]
		// ctx = [/bonita]
		// nextUrl = [board/write]
		// prevUrl = [""]
		// finalUrl = [http://localhost:8081/bonita]
		
		// 비정상적인 접근을 막는 기능!
		if(referer == null) {
			log.info("WARNING >> 비정상적인 접근 :(");
			response.sendRedirect(finalUrl);
			return false;
		} else {
			//
			int indexQuery = referer.indexOf("?");
			// 물음표가 없으면 -1 이 온다. 
			// ex) .substring(3) => 3번째부터 끝까지  .substring(3,5) => 3~5까지
			// finalUrl = http://localhost:8081/bonita/
			
			
			// indexQuery = 40
			if(indexQuery == -1) {
				// finalUrl.lenght()-1 = 30-1 = 29
				prevUrl = referer.substring(finalUrl.length()-1);
			} else {
				// finalUrl.lenght()-1 = 30-1 = 29 / indexQuery = 40
				prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
			}
			// prevUrl 이전url / nextUrl 지금 가야하는 url
			log.info("PREV URL >>>>>" + prevUrl);
			log.info("NEXT URL >>>>>" + nextUrl);
		
			//
			if(nextUrl.equals("/board/update") || nextUrl.contentEquals("/board/delete")) {
				if(request.getParameter("title") == null) { 
					// 상세게시글에서 나한테 넘어오는 애들만 처리해준다
					// indexof("board/view")
					// 게시글, 수정 이 있으면 전에 주소 왔던 곳이 상세게시글에서 왔으면 정상 상세게시글 수정, 삭제 버튼만  
					// 작성자와 로그인 이 같아야지 버튼이 생긴다. 나왔을때만 상세게시글이 넘어온다. 
					log.info("alasdfasdf :" + prevUrl.indexOf("board/view"));
					// board/view에서 안왔으면 -1값이 들어오면서 비정상적인 접근이 되면서 finalUrl로 가면서 false값을 가져간다. 
					if(prevUrl.indexOf("board/view") == -1) {
						log.info("WARNING >> 비정상적인 접근 :(" );
						response.sendRedirect(finalUrl);
						return false;
					}
				}
			}
		}
		// 현재 /board/update -> 로그아웃 session초기화 /board/
		// 정상적인 접근인 경우 실행
		// login no
		if(session.getAttribute("userid") == null ) {
			if(prevUrl.equals(nextUrl)) {
				log.info("WARNING >> prevUrl == nextUrl :/ ");
				response.sendRedirect(finalUrl);
				return false;
			}
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			if(qString != null) {
				uri = uri+ "?" + qString;
			}
			fMap.put("uri", uri);
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			return false; // 이동 X
		} else { // Login OK
			log.info(">>>> LOGIN :) ");
			return true; //이동 O
		}
	}	
}
