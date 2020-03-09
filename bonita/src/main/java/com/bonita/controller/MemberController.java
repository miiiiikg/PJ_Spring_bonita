package com.bonita.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bonita.domain.MemberDTO;
import com.bonita.service.mail.MailService;
import com.bonita.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
/*
 * SessionAttributes로 설정된 변수(객체)는
 * response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다
 * web browser와 server간에 한번이라도 연결이 이루어졌으면
 * Session..에 등록된 변수는 서버가 중단될때까지 그 값이 그대로 유지된다.
 * web은 클라이언트의 req를 서버가 받아서 
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
 * 이런 특성과는 달리 Spring기반의 web은 일부 데이터들은
 * 메모리에 보관했다가 재사용하는 기법이 있다.
 * 그 중 SessiongAttributes라는 기능이 있다.
 * 
 * sessionAttributes()에 설정하는 문자열(이름)은
 * 클래스의 표준 객체생성 패턴에 의해 만들어진 이름
 * MemberDTO memoDTo

 * 이름을 표준 패턴이 아닌 임의의 이름으로 바꾸고 싶다.
 */
public class MemberController {
	/*
	 * 의존성주입 할 수 있다. 의존성주입(type) 멤버서비스 type
	 * @Autowired 각각 써줘야 한다.
	 */
	@Autowired
	MemberService mService;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;
	
	/*
	 * SessionAttributs를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controlller에 있어야 하고
	 * 해당 메서드에는 @ModelAttribute("변수명") 가 있어야 한다. 
	 */
	
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();
	}
	
	@GetMapping("/constract")
	public String viewConstract() {
		log.info(">>>>>>>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
	
	/*
	 * SessionAttrubutes에서 설정한 변수(객체)에는 
	 * @ModelAttribute를 설정해 두어야 한다
	 * 단, 5.x 이하에서는 필수 5.x 이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패턴이 아닌 임의의 이름으로 사용할경우
	 * @ModelAttribute("객체이름")을 필수로 지정해 주어야 한다.
	 */
	
	
	@GetMapping("/join")
	public String getJoin(@ModelAttribute("memberDTO") MemberDTO mDto, 
			@RequestParam(value="flag", defaultValue="0") String flag,
			Model model) {
		log.info(">>>>>>> MEMBER/JOIN PAGE GET 출력");
		log.info(mDto.toString());
	
		model.addAttribute("flag", flag);
		
		// 비정상적인 접근일 경우 약간 동의페이지로 이동
		if(!flag.equals("1")) {
			return "member/constract";
		}
		
		return "member/join";
	}
	
	// 회원가입 후 email 인증
	@GetMapping("/keyauth")
	public String keyAuth(String id, String key, RedirectAttributes rttr) {
		mailService.keyAuth(id, key);
		
		// 인증 후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "auth");
		
		return "redirect:/";
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>>> ID OVERLAP CHECK");
		log.info("아이디:"+id);
		
		int cnt = mService.idOverlap(id);
		String flag = "1";
		if(cnt==0) {
			flag="0";
		}
		return flag;
	}
	
	// 회원정보수정
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info(">>>>>>>>>> GET: Member Update Page ");
		
		// 현재 로그인 상태를 확인
		String id = (String)session.getAttribute("userid");
		
		// 로그인이 안되어있으면 비정상적인 접근으로 간주하여
		// 인덱스페이지로 이동!
		if(id == null) {
			return "redirect:/";
		}
		
		// 로그인 된 유저를 GET
		// 회원정보수정 페이지로 보내기
		model.addAttribute("user", mService.userView(id));
		
		
		
		return "member/join";
	}
	
	
	/*
	 * join POST가 mDto를 수신할때
	 * 입력 form에서 사용자가 입력한 값들이 있으면 그 값들을 mDto의 필드변수에 settiong을 하고
	 * 
	 * 만약 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된 mDto변수에서 값을 가져와서 비어있는 
	 * 필드변수를 채워서서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도 
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이 기능을 효율적으로 사용하려면
	 * jsp코드에서 Spring-form tag로 input을 코딩해야 한다. 
	 */
	
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDTO") MemberDTO mDto, 
				SessionStatus sessionStatus, HttpServletRequest request, RedirectAttributes rttr) {
		// view단에서 Controller단으로 이동
		log.info(">>>>>>>>> MEMBER/JOIN PAGE POST 출력");
		
		// view단에서 전송된 데이터가 잘 전달됐는지 확인
		log.info(mDto.toString());
		
		log.info("password:" + mDto.getPw()); // 사용자 입력pw값
		// 1. 사용자 암호 hash 변환
		String encPw = passwordEncoder.encode(mDto.getPw());
		mDto.setPw(encPw);
		log.info("Password(+Hash)" + mDto.getPw());
		
		// 2. DB에 회원 등록
		int result = mService.memInsert(mDto);
		
		// 3. 회원등록 결과
		if(result > 0) {
			log.info(">>>>>" +mDto.getId()+"님 회원가입되셨습니다.");
		}
		
		// 4. 회원가입 인증 메일 보내기
		mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
		// SessionAttrubutes를 사용할때 input, update가 완료되고
		// view로 보내기전 반드시 setComplet()를 실행하여
		// Session에 담긴 값을 clear 해주어야 한다.
		sessionStatus.setComplete();
		
		//회원가입 후 메시지 출력을 위한 값 전달
		// 값이 바뀌면 redirect forward 디폴트, 
		
		// 회원가 lashAttribute("id", mDto.getEmail());
		rttr.addFlashAttribute("id", mDto.getId());
		rttr.addFlashAttribute("email", mDto.getEmail());
		rttr.addFlashAttribute("key", "join");
		
		return "redirect:/";
	}
	
	@PostMapping("/update")
	public String memUpdate(MemberDTO mDto, HttpSession session) {
		log.info(">>>>>>> POST : Member Update Action");
		log.info(mDto.toString());
		
		mService.memUpdate(mDto, session);
		//if(result > 0) {
		//	log.info(">>>>> Member Update Sucess");
		//} else { 
		//	log.info(">>>>> Member Update Fail");
		//}
		
		return "redirect:/";
	}
	
	



}
