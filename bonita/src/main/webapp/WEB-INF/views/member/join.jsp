<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<title>naver_join.html</title>
	<link rel="icon" type="image/png" href="${path}/resources/Img/naver/naversm.png">
	<style type="text/css">
		/*css 시작*/
		/* 모든 글씨체를 font-family */
		* {
			font-family: Dotum,'돋움', Helvetica, sans-serif;
			box-sizing: border-box;
		}
		#back {
			position : fixed;
			z-index : 1200;
			background-color : rgba(0,0,0,0.4);
			overflow : auto;
			width: 100%;
			height: 100%;
			top : 0;
			left : 0;
			display : none;
			align-items: center;
			justify-content : center;
		}	
		.loading_img {
			animation : ani_loading 1.5s infinite linear;
			font-size : 70px;
			color : #EBA444;
		}
		
		@keyframes ani_loading {
			from {-webkit-transform : rotate(0deg);}
			to 	 {-webkit-transform : rotate(359deg);}
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
		a {s
			text-decoration: none;
			color: inherit;
		}
		.wrap {
			width: 768px;
			margin: 0 auto;
		/*	border: 1px solid black*/
		}
		.header {
			padding : 20px 0px 20px;
			position: relative;
		/*	border: 1px solid red;*/
		}
		/*inline-block은 가로가 다 자신것이 아니고, block은 가로가 자신것이기 때문에 margin:auto를 준것이다. */
		.n_logo {
			display: block;
			width: 260px;
			height: 130px;
			/*background: url('../img/b.png') 0 -232px no-repeat;*/
			margin: auto;
		}
		.join_content {
			width: 460px;
			margin: 0 auto;
		/*		border: 1px solid blue;*/
		}
		.row_group {
			/*overflow: hidden;*/
			width: 100%;
		}
		.join_title {
			margin: 19px 0 8px;
			font-size: 14px;
			font-weight: 700;
			color: black;
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
		/*@naver.com 까지 작성이 되기때문에*/
		.int_id {
			padding-right: 110px;
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
		.home {
			padding-top: 5px;
		}
		.home_number {
			padding-top: 10px;
			display: block;
			width: 100%;
			height: 56px;
			margin-top: 5px;
			font-size: 15px;
			color: #363636;
			text-align: center;
			line-height: 56px;
			background: #f2f2f2;
			padding-bottom: 2px;
		}
		/*	.out {
			display: block;
			position: relative;
			width: 50%;
			height: 29px;
			padding-right: 25px;
			line-height: 29px;
			border: none;
			background: #fff;
			font-size: 15px;
			z-index: 10;
		}*/
		.step_url {
			position: absolute;
			right: 13px;
			font-size: 15px;
			color: #8e8e8e;
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
		.pw_lock {
			background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
		}
		.repw_lock {
			background-image: url(https://static.nid.naver.com/images/ui/join/m_icon_pw_step.png);
			background-repeat: no-repeat;
			background-size: 125px 75px;
			cursor: pointer;
			width: 24px;
			height: 24px;
			display: inline-block;
			background-position: -27px 0;

		}
		.bir_yy, .bir_mm, .bir_dd {
			display: table-cell;
			table-layout: fixed;
			width: 147px;
			vertical-align: middle;
		}
		.sel {
			background: #fff url('https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif') 100% 50% no-repeat;
			background-size: 20px 8px;
			width: 100%;
			height: 29px;
			font-size: 15px;
			line-height: 18px;
			color: #000;
			border: none;
			-webkit-appearance: none;
		}

		/* table <= display: table;
		   td 	 <= display: table-cell;
		   div   <= display: block;*/
		.bir_wrap {
			display: table;
			width: 100%;
		}
		.bir_mm, .bir_dd {
			padding-left: 10px;
		}
		.choice {
			font-size: 12px;
			font-weight: 400;
			color: #8e8e8e;
		}
		.btn_double_area {
			margin: 30px 0 9px;
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
			color: white;
			background-color: #8E85D6;
		}
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
		
	/*css 종료*/
	</style>
</head>
<body>
	<div class="wrap">
		<header><div class="header"></div></header>
	<!-- section 열기/닫기 -->
		<section>
			<!--form태그를 작성할때 name action(목적지) method(보내는방식) : get방식 -> 검색 , post방식 -> 개인정보 -->
			<!--<form name="frm_member" action="frm_member" action = '${path}/member/join' method="POST">  -->
			<form:form id="frm_member" modelAttribute ="memberDTO" autocomplete ="on">
				<div class="container">
					<div class="join_content">
						<div class="row_group">
			
							<div class="join_row">
								<h3 class="join_title">
									<label for="id">아이디</label>
								</h3>
								<span class="ps_box int_id">
									<input type="text" id="uid" name="id" class="int" value='${user.id}'>
									<!-- <span class="step_url"></span> -->
								</span>
								<span class="error_next_box">필수 정보입니다.</span>
							</div>

							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd1">비밀번호</label>
								</h3>
								<span class="ps_box int_pass">
									<input type="password" id="upswd1" name="pw" class="int">
									<span class="step_url"><span class="pw_lock"></span></span>
								</span>
								<div style="margin:10px 0px;">     
									<span class="ps_box int_pass">
										<input type="password" id="upswd2" name="upswd2" class="int">
										<span class="step_url"><span class="repw_lock"></span></span>
									</span>
									<span class="error_next_box" >필수 정보입니다.</span>
								</div>
								
								
							</div>									
									
					
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="name">이름</label>
									</h3>
									<span class="ps_box">
										<input type="text" id="uname" name="name" class="int" value='${user.name}'>
									</span>
									<span class="error_next_box">필수 정보입니다.</span>
								</div>
							</div>
	
							<div class="join_row">
								<h3 class="join_title">
									<label for="phone">휴대전화</label>
								</h3>
								<span class="ps_box">
									<input type="tel" id="uphone" name="phone" class="int" value='${user.phone}' placeholder="-없이 입력 예)01012345678">
								</span>
								<span class="error_next_box">필수 정보입니다.</span>
							</div>
	
	
							<div class="join_row">
								<h3 class="join_title">
									<label for="email">본인 확인 이메일<span class="choice">(선택)</span></label>
								</h3>
								<span class="ps_box">
									<input type="text" id="uemail" name="email" class="int" placeholder="선택입력" value='${user.email}'>
								</span>
								<span class="error_next_box">필수 정보입니다.</span>
							</div>
	
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="name">주소</label>
									</h3>
									<div class="bir_yy" >
										<span class="ps_box">
											<input name = "postcode" type="text" id="sample6_postcode"  class="int"  placeholder="우편번호" value='${user.postcode}' class="int" readonly>
										</span>
									</div>
									<div class = "bir_mm">
										<span class="ps_box">
											<input type="button" id = "btn_post" class="int" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"  class="int"><br>
										</span>
									</div>
									<div class="home">	
										<span class="ps_box">
											<input name="addr1"type="text" id="sample6_address" class="int" placeholder="주소"  class="int" readonly value='${user.addr1}'><br>
										</span>
									</div>
									<div class="home">
										<span class="ps_box">
											<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
											<input name="addr2" type="text" id="sample6_detailAddress" class="int" placeholder="상세주소" class="int" value='${user.addr2}'>
										</span>
									</div>
									
									<span class="error_next_box">필수 정보입니다.</span>
								</div>
							</div>
												
							<div class="btn_double_area">
								<button id = "btn_join" type="button" class ="btn_join btn_agree" >가입하기</button>
								<!-- <span><a href="#" class="btn_type btn_agree">가입하기</a></span> -->
							</div>
						
					</div><!-- row_group -->
				</div><!-- join_content -->	
			</div><!-- container -->
		</form:form>
		
	</section>

	<!-- footer -->
		<footer>
			<div id="footer">
				<ul>
					<li><a href="#">이용약관</a></li>
					<li><strong><a href="#">개인정보처리방침</a></strong></li>
					<li><a href="#">책임의 한계와 법적고지</a></li>
					<li><a href="#">회원정보 고객센터</a></li>
				</ul>
				<div id="address">
					<span>
						<a href="#">
							<!-- <img id="addr_logo" src="../Img/naver/naver_logo.png"> -->
						</a>
					</span>
					<span>Copyright</span>
					<span>ⓒ</span>
					<!-- <span><strong><a href="#">NAVER Corp.</a></strong></span> -->
					<span>All Rights Reserved.</span>
				</div>
			</div>
		</footer>

	</div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	$(function(){

		// 비밀번호가 유효한 값인지 체크해주는 flag값
		var pwFlag = false;

		// 유효성체크 여부를 알려주는 배열
		var checkArr = new Array(6).fill(false);
		// printCheckArr(checkArr);

		// 유효성체크 모두 통과 or 불통 여부를 알려주는 변수
		var checkAll = true;
		
		alert('user:'+ '${user}');
		
		if('${user}' != '') {
			// 회원정보수정 디자인 변경
			// →버튼 텍스트가 수정하기
			$('#btn_join').text('수정하기');
			// →비밀번호, 비밀번호 재설정 제거
			// display , none
			$('.join_row:eq(1)').css('visibility', 'hidden')
								.css('height', '0px')
								.css('margin-top', '-17px');
		
			// →id에 readonly효과를 줘서 입력이 불가능
			// id=#id를 제거해서 우리가 입력한 유효성체크 동작 불가능
			$('.join_row_input:eq(0)').attr('readonly', 'true')
										   .removeAttr('id');
			
			var name = '${user.name}';
			var phone = '${user.phone}';
			var email = '${user.email}';
			var postcode = '${user.postcode}';
			var addr1 = '${user.addr1}';
			var addr2 = '${user.addr2}';
			ckName(name);
			ckPhone(phone);
			ckEmail(email);
			ckAddr(postcode, addr2);
			checkArr[0] = true;
			checkArr[1] = true;
			ckColorBtn();
			printCheckArr(checkArr);
		}
		// 비정상적인 접근인지 판단
		//var flag = '${flag}';
		//if(flag == 0) {
		//	location.href= "${path}/member/constract"
		//}



		
			// 아이디 유효성체크 :
			//  >> #uid인 input태그의 값을 가져와서 체크
			$('#uid').keyup(function(){
				//trim 좌우여백을 없애는 것
				// 사용자가 입력한 값의 좌우여백을 제거하고 id에 입력
				var id = $(this).val().trim(); // 사용자가 입력한 값
				// validation.js의 checkId로 유효성체크를 실행 후
				// 결과를 result에 담음(code, desc)
				// alert(id);
				var result = joinValidate.checkId(id);
				// console.log(result.code + ", " + result.desc);
				// 유효성체크  결과로 테두리색과 err메세지를 출력하는 
				// 함수 실행
				
				if(result.code == 0) {
					checkArr[0] = true;
				} else {
					checkArr[0] = false;
				}
				// printCheckArr(checkArr);
				ckDesign(result.code, result.desc, 0, 0); // 테두리색상
			});

			// 비밀번호 유효성체크
			$('#upswd1').keyup(function(){
				// 1. 사용자가 입력한 값 받기
				var pw = $.trim($('#upswd1').val());
				var rpw = $.trim($('#upswd2').val());
				// alert( pw+ "," +rpw);
				// 2. 유효성 체크 하기
				var result = joinValidate.checkPw("",pw ,rpw);
				if (result.code == 0 || result.code == 10 || result.code == 6) {
					// $('.ps_box:eq(2)').css('border-bottom', '2px solid #3885ca');	
					pwFlag = true;
				} else {
					pwFlag = false;
				}

				if (result.code == 0) {
					checkArr[1] = true;
				} else {
					checkArr[1] = false;
				}
				// 3. 체크 결과에 따라 디자인하기
				// printCheckArr(checkArr);
				ckDesign(result.code, result.desc, 2, 1); // 테두리색상

			});

		// 비밀번호 재확인 유효성체크
			$('#upswd2').keyup(function(){
				var pw = $.trim($('#upswd1').val());
				var rpw = $.trim($('#upswd2').val());
				// console.log(pw + "," +rpw);

				var result = joinValidate.checkRpw(pw,rpw, pwFlag);
				if(result.code == 10) {
					checkArr[1] = true;
					$('.ps_box:eq(1)').css('border-bottom', '2px solid #3885ca');			
				} else if(result.code == 6) {
					checkArr[1] = false;
					$('.ps_box:eq(1)').css('border-bottom', '2px solid #3885ca');
				} else {
					checkArr[1] = false;
				}
				// printCheckArr(checkArr);
				ckDesign(result.code, result.desc, 2, 1); // 디자인한 갯수로 맞추기 (border-1,에러메시지-1)

			});

		// 이름 유효성체크
			$('#uname').keyup(function(){
				var name = $.trim($('#uname').val());
				// console.log(name);
				// alert(name);
				ckName(name);
			});
		
			function ckName(name){
				var result = joinValidate.checkName(name);
					// printCheckArr(checkArr);
				ckDesign(result.code, result.desc, 3, 2);
	
				if (result.code == 0) {
					checkArr[2] = true;
				} else {
					checkArr[2] =false;
				}
					
			}

		// 전화번호 유효성체크
			$('#uphone').keyup(function(){
				var phone = $.trim($('#uphone').val());
				ckPhone(phone);
				// console.log(phone);
			});
			function ckPhone(phone) {
				var result = joinValidate.checkPhone(phone);
				ckDesign(result.code, result.desc, 4, 3);


				if (result.code == 0) {
					checkArr[3] = true;
				} else {
					checkArr[3] =false;
				}
				// printCheckArr(checkArr);
				
			}

		// 이메일 유효성체크
		$('#uemail').keyup(function(){
			var email = $.trim($(this).val());
			ckEmail(email);
			// console.log(email);				
		});
		
		function ckEmail(email) {
			var result = joinValidate.checkEmail(email);
			ckDesign(result.code, result.desc, 5, 4);

				if (result.code == 0) {
					checkArr[4] = true;
				} else {
					checkArr[4] =false;
				}
				// printCheckArr(checkArr);
		}

		$('.addr_only').click(function(){
			// 사용자가 우편번호 또는 주소 input을 클릭했을 때
			$('#btn_post').click();
		});

		// 상세주소를 클릭하면
		$('#sample6_detailAddress').click(function(){
			var addrPost = $('#sample6_postcode').val();
			if (addrPost == '' || addrPost.length == 0) {
				$('#btn_post').click();
			}
		});


		// 주소유효성 체크
		$('#sample6_detailAddress').keyup(function(){
			var addrDetail = $.trim($(this).val());
			var addrPost = $('#sample6_postcode').val();
			
			ckAddr(addrPost, addrDetail);
			// printCheckArr(checkArr);
		});
		function ckAddr(addrPost, addrDetail) {
			var result = joinValidate.checkAddr(addrDetail, addrPost);
			// console.log(result.code);
			if(result.code == 3) { // 우편번호 & 주소x
				ckDesign(result.code, result.desc, 6, 5);
				ckDesign(result.code, result.desc, 8, 5);
				checkArr[5] = false;

			} else if (result.code == 0) { // 상세주소x
				ckDesign(result.code, result.desc, 6, 5);
				ckDesign(result.code, result.desc, 8, 5);
				ckDesign(result.code, result.desc, 9, 5);
				checkArr[5] = true;
			} else {
				ckDesign(result.code, result.desc, 9, 5);
				checkArr[5] = false;
			}			
		}


		// 버튼활성화
		$(".btn_agree").keyup(function(){
			ckColorBtn();
		});
		
		function ckColorBtn(){
			var checkAll = true;
			for(var i = 0; i < checkArr.lenght; i++) {
				if (!checkArr[i]) {
					checkAll = false;
				}
			}
			if(checkAll) {
				$('#btn_join').addClass('btn-primary');
				// $('#btn_join').prop('disabled', false);
				$('#btn_join').css('cursor', 'pointer');
			} else {
				$('#btn_join').removeClass('btn-primary');
				// $('#btn_join').prop('disabled', false)
				$('#btn_join').css('cursor' , 'no-drop');
			}
		}

		// 회원가입 버튼 클릭!
		$('#btn_join').click(function(){
			var invalidAll = true;
			for(var i = 0; i< checkArr.length; i++) {
				if (!checkArr[i]) {
					invalidAll = false;
					$('.error_next_box:eq('+i+')').css('visibility','visible')
									.css('color', '#d95339');
					// alert('값을 모두 입력해주세요.');
				}
				
			}
			printCheckArr(checkArr);

			if(invalidAll) {
				//alert('회원가입 성공!');
				FunLoadingBarStart(); // 로딩바 생성
				// submit : form태그 안에 있는 데이터들을 서버단으로 전송
				// action : 목적지(MemberController '/join')
				// method : 방법(POST : 숨겨서)
				$('#frm_member').submit();
			} else { 
				alert('유효성체크를 진행해주세요!');
			}
			// 유효성체크가 전부 true이면
			// 하나라도 false이면
		});
		
		// 로딩바 출력
		function FunLoadingBarStart(){
			var loadingBarImage =''; // 가운데 띄어 줄 이미지
			loadingBarImage += "<div id = 'back'>";
			loadingBarImage += "<div id = 'loadingBar'>";
			loadingBarImage += "<i class='fas fa-spinner loading_img'></i>";
			loadingBarImage += "<div></div>";
			$('body').append(loadingBarImage);
			$('#back').css('display','flex');
			$('#loadingImg').show();
		}



		function ckDesign(code, desc, line, msg) {
			if (code == 0 || code == 10) { // 통과 o
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
		}//function ckDesign(code, desc, line, msg)

		// 개발시 사용 : 유효성체크 전체여부를 출력해주는 함수(true, false)
		function printCheckArr(checkArr) {
			for(var i=0; i<checkArr.length; i++) {
			console.log(i +'번지:' + checkArr[i]);
		}
	}


});
</script>
<!-- daum 주소 -->
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
</html>