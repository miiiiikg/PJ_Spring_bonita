<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<style type="text/css">
		* {
			font-family: Dotum,'돋움', Helvetica, sans-serif;
			box-sizing: border-box;
		}	

		body, h1, h2, h3, h4, h5, h6, ul, p {
			margin: 0;
			padding : 0;
		}
		body { 
			background-color: #f5f6f7;
			font-size: 12px;
		}
		ul { list-style: none; }
		/*inherit -> 상속받는다.*/
		a {
			text-decoration: none;
			color: inherit;
		}
		.wrap {
			width: 768px;
			margin: 0 auto;
			/*border: 1px solid black;*/
		}
		.join_content {
			width: 460px;
			margin: 0 auto;
		}
		.join_title {
			margin: 19px 0 8px;
			font-size: 14px;
			font-weight: 700;
			color: black;
		}
		.row_group {
			width: 100%;
		}
		.ps_box {
			display: flex;
			align-items: center;
			position: relative;
			width: 100%;
			height: 51px;
			border: 1px solid #dadada;
			padding : 10px 14px 10px 14px;
			background-color: #fff;
			vertical-align: top; 
		}
		.int_pass {
			padding-right: 40px;
		}
		.int {
			display: block;
			position: relative;
			width: 100%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}
		.pw_lock {
			background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
		}
		.btn_join {
			display: block;
			width: 100%;
			padding: 21px 0 17px;
			font-size: 20px;
			font-weight: 700;
			text-align: center;
			cursor: pointer;
		}
		.btn_agree {
			border: 1px solid #ddd;
			color: white;
			background-color: #8E85D6;
		}
		.btn_double_area {
			margin: 30px 0 9px;
		}
		.btn_double_area1 {
			margin: 10px 0 9px;
		}
		.btn_agree1 {
			border: 1px solid #ddd;
			color: black;
			background-color: white;
		}
		.error_next_box {
			display: block;
			margin: 9px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: #d95339;
			height: 15px;
			visibility: hidden;
		}
		/*===========================================footer*/
			#footer {
			padding: 15px 0;
		}
		#footer > ul {
			margin: 0 auto 9px;
			text-align: center;
		}
		#footer * {
			font-size: 11px;
			line-height: normal;
			list-style: none;
			color: #333;
		}
		#footer > ul > li {
			display: inline;
			padding: 0 5px 0 7px;
			border-left: 1px solid #dadada;
		}
		#footer > ul > li a:hover {
			color: #8E85D6;
			text-decoration: underline;
		}
		#footer ul li:first-child {
			/* !import => 가장 우선순위가 높다. 자주쓰면x*/
			border-left: 0px!important;
		}
		#addr_logo {
			width: 63px;
			height: 11px;
		}
		#address {
			margin: 0 auto;
			text-align: center;
		}
		#address * {
			font : 9px verdana;
		}
		#address a {
			font-weight: bold;
		}
		#address a:hover {
			color: #8E85D6;
		}
	</style>
</head>
<body>
	<div class ="wrap">
		<div class="container" style="padding-top:27px;">
			<div class="join_content">
				<div class="row_group">
				<form:form id = "frm_member" modelAttribute = "memberDTO" autocomplete = "on" >
					<div class="join_row">
						<h3 class="join_title">
							<label for="pswd1" id="nowpw">현재 비밀번호</label>
						</h3>
						<span class="ps_box int_pass">
							<input type="password" id="upswd1" name="upswd1" class="int">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="error_next_box">필수 정보입니다.</span>

						<h3 class="join_title">
							<label for="pswd1">새 비밀번호</label>
						</h3>
						<span class="ps_box int_pass">
							<input type="password" id="upswd2" name="pw"  class="int">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="error_next_box">필수 정보입니다.</span>


						<h3 class="join_title">
							<label for="pswd1">새 비밀번호 확인</label>
						</h3>
						<span class="ps_box int_pass">
							<input type="password" id="upswd3" name="pw1" class="int">
							<span class="step_url"><span class="pw_lock"></span></span>
						</span>
						<span class="error_next_box">필수 정보입니다.</span>
					</div>


					<div class="btn_double_area">
						<button id = "btn_join" type="button" class ="btn_join btn_agree">확인</button>
					</div>
					<div class="btn_double_area1">
						<button id = "btn_join" type="button" class ="btn_join btn_agree1">취소</button>
					</div>
				</form:form>
			 </div>
			</div>
		</div>
		<footer>
				<div id="footer">
					<ul>
						<li><a href="#">이용약관</a></li>
						<li><strong><a href="#">개인정보처리방침</a></strong></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">회원정보 고객센터</a></li>
					</ul>
					<div id="address">
						
						<span>Copyright</span>
						<span>ⓒ</span>
						
						<span>All Rights Reserved.</span>
					</div>
				</div>
			</footer>
		</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	
	// 전역변수를 공유해서 사용, 미사용 (keyup)
	$(document).ready(function(){
		var pwFlag = false;
		
		var checkArr = new Array(2).fill(false);
		
		// 약식으로 $(function()) = $(document).ready(function(){})
		$('#upswd1').keyup(function(){ //나혼자만 독단적으로 동작
			var upswd1 = $(this).val();
			console.log('입력 :'+upswd1);
			// code: 1, 2, 6, 100
			
			var result = joinValidate.checkNowpw(upswd1);
			console.log("code:" + result.code);
			ckDesign(result.code, result.desc, 0, 0);
			
			if(result.code == 100) {
				checkArr[0] = true;
			} else {
				checkArr[0] = false;	
			}
		}); 
		
		$('#upswd2').keyup(function(){ // 공유해서 사용
			// 1. 사용자가 입력한 값 받기
			var nowpw= $.trim($('#upswd1').val());
			var pw = $.trim($('#upswd2').val());
			var rpw = $.trim($('#upswd3').val());
			console.log('입력 :'+pw);
			
			var result = joinValidate.checkPw(nowpw, pw ,rpw);
			if (result.code == 0 || result.code == 10 || result.code == 6) {
				pwFlag = true;
			} else {
				pwFlag = false;
			}
	
			ckDesign(result.code, result.desc, 1, 1); // 테두리색상
			
			if(result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(1)').css('border-bottom', '2px solid #3885ca');			
			} else if(result.code == 6) {
				checkArr[1] = false;
				$('.ps_box:eq(1)').css('border-bottom', '2px solid #3885ca');
			} else {
				checkArr[1] = false;
			}
	
		});
	

		// 비밀번호 재확인 유효성체크
		$('#upswd3').keyup(function(){
			var pw = $.trim($('#upswd2').val());
			var rpw = $.trim($('#upswd3').val());
	
			var result = joinValidate.checkRpw(pw,rpw, pwFlag);
			
			ckDesign(result.code, result.desc, 2, 2); // 디자인한 갯수로 맞추기 (border-1,에러메시지-1)
			
			if(result.code == 10) {
				checkArr[1] = true;
				$('.ps_box:eq(1)').css('border-bottom', '2px solid #3885ca');			
			} else if(result.code == 6) {
				checkArr[1] = false;
				$('.ps_box:eq(1)').css('border-bottom', '2px solid #3885ca');
			} else {
				checkArr[1] = false;
			}
			
		});
			$('#btn_join').click(function(){
				var invalidAll = true;
				for(var i = 0; i< checkArr.length; i++) {
					if(!checkArr[i]) {
						invalidAll = false;
						$('.error_next_box:eq('+ i +')').css('visibility', 'visible') 
						   .text(desc)
						   .css('color','#d95339');
					}
				}
				if(invalidAll) {
					$('#frm_member').submit();
				} else {
					alert('유효성체크를 진행해주세요!');
				}
			});
	
	});
		
	function ckDesign(code, desc, line, msg) {
		if (code == 0 || code == 10 || code == 100) { // 통과 o
			$('.ps_box:eq('+line+')').css('border-bottom', '2px solid #3885ca');
			$('.error_next_box:eq('+ msg +')').css('visibility', 'visible')
								   .text(desc)
								   .css('color','#3885ca');
			return true;		
		} else { // 통과 O
			$('.ps_box:eq('+line +')').css('border-bottom', '2px solid #d95339'); //테두리색상변경
			$('.error_next_box:eq('+ msg +')').css('visibility', 'visible') 
								   .text(desc)
								   .css('color','#d95339');
			return false;

		}
	}
	
	// 개발시 사용 : 유효성체크 전체여부를 출력해주는 함수(true, false)
	function printCheckArr(checkArr) {
		for(var i=0; i<checkArr.length; i++) {
		console.log(i +'번지:' + checkArr[i]);
	}
}



</script>
</html>