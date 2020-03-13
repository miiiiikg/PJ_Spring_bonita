package com.bonita.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bonita.domain.SampleDTO;

import lombok.extern.slf4j.Slf4j;

// lombok라이브러리의 log기능을 사용
@Slf4j
// Spring이 동작시 DispatcherServlet 생성과정에서
// Servlet-context.xml의 환경설정을 읽어들이는데 
// Servlet-context.xml 내의 component-scan이
// 설정된 경로를 돌아다니며 @Controller가 붙어있는
// Class들을 전부 Spring Context에 Beans로 등록 시켜기 위해 사용
// Spring Context에 Beans로 등록되어있어야
// DispatcherServlet이 Handler Mapping과 
// Handler Adapter를 통해 요청처리를 시킬 수 있음

// Spring Context에 Beans로 등록되었다 
// = Spring이 객체의 제어권을 개발자로부터 넘겨받음(IOC패턴)

// Spring Context에 Beans로 등록되있는 객체들만 의존성주입 가능(DI패턴)
@RequestMapping("/sample")
@Controller  
public class SampleController {
	
	// sample.jsp 출력!
	@RequestMapping("/")
	public String print() {
		return "sample";
	}
	
	// @RequestMapping(value="/sample/view", method=RequestMethod.GET)
	@GetMapping("/view")
	public String view(String user) {
		log.info("GET 방식 호출");
		log.info("user:" + user);
		return "result";
	}
	
	// @RequestMapping(value="/sample/view", method=RequestMethod.POST)
	// public String view(HttpServletRequest request) {
	@PostMapping("/view")
	// 매개변수 @RequestParam 생략가능
	// @RequestParam(value ="user", defaultValue="미경")
	public String view (SampleDTO sDto) {
		// input 2개의 값을 전달(Name 속성값)
		// name = user, name= pass
		
		// (과거) view단으로부터 데이터를 받는 방법
		// request.getParamter(""); : 값을 모두 String타입으로 받음
		// 개발자가 받아서 형변환하는 작업이 필수!
		// 추가로 값을 view단에서 넘겨주지 않으면 null값이 들어가 
		// 하단에 매개변수를 사용하는 부분에서 전부 Error발생
		// Null체크 해주는 코드 필수!
		// String user = request.getParameter("user");
		// String pass = request.getParameter("pass");
		
		log.info("POST 방식 호출");
		//log.info(user+","+pass);
		
		log.info(sDto.toString());
		return "result";
	}
	
	// 동기방식
	@GetMapping("/sync")
////	public String sync(String model, Model model) {
////		log.info("동기방식 :" + name );
////		model.addAttribute("name", name);
//		
//		return "sample";
//	}
//	
	//비동기방식
	@ResponseBody
	@PostMapping(value="/ajax", produces="application/text;charset=utf-8")
	public String async(String name) {
		
		log.info("비동기방식 :" + name );
		
		return name;
	}
	

}
