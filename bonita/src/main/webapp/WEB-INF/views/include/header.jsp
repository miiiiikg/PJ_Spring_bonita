<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp"%>    <!-- include랑 합쳐져있다. -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<style type="text/css">
		
		#wrap {
			position: relative;
			min-width: 1280px;
			overflow: hidden;
		}
		#header.bar {
			width: 100%;
			z-index: 98;
			border-bottom: 1px solid #e8e8e8;
			border-bottom-color: rgba(0,0,0,.09);
		}
		.inner {
			padding: 0 10px;
			width: 1260px;
			margin: 0 auto;
		}
		ul.gnb {
			float: left;
			display: inline-block;
			text-align: center;
		}
		#header .bar ul.gnb > li:nth-child(1) {
			margin-left: 0;
			transition: margin-left 0.3s 0.6s ease;
		}
		ul.gnb > li {
			float: left;
			position: relative;
			margin-left: 16px;
			white-space: nowrap;
		}
		ul.gnb > li a {
			font-size: 11px;
			line-height: 42px;
			color: #222;
			letter-spacing: 0.5px;
			white-space: nowrap;
		}
		ul.gnb > li span.cart-count {
			display: inline-block;
			min-width: 11px;
			height: 14px;
			line-height: 14px;
			margin: -1px 0 0 2px;
			padding: 1px 3px;
			text-align: center;
			border-radius: 50%;
			font-size: 10px;
			color: #555;
			letter-spacing: 0.5px;
			vertical-align: middle;
		}
	
		#header .bar ul.gnb > li.myshop:hover ul.mnb {
			display : block; 
		}
		#header .bar {
			width: 100%;
			z-index: 98;
			border-bottom: 1px solid #e8e8e8;
			border-bottom-color: rgba(0, 0, 0, .09);
		}
		#header .bar ul.bnb {
			float: right;
		}
		#header .bar ul.bnb li:first-child {
			margin-left: 0;
		}
		#header .bar ul.bnb li a {
			font-size: 11px;
			line-height: 42px;
			color: #222;
			letter-spacing: 0.5px;
			white-space: nowrap;
		}
		#header .bar ul.bnb li {
			float: left;
			text-align: center;
			font-size: 11px;
			line-height: 42px;
			margin-left: 19px;
		}
		#header .bar ul.gnb > li:hover a {
			color: #aaa;
		}
		/*마이페이지 설정*/
		#header .bar ul.gnb > li.myshop ul.mnb {
			display : none;
			position: absolute;
			top: 38px;
			left: 50%;
			margin-left: -50px;
			padding: 5px 0;
			border: 1px solid #ddd;
			background-color: rgba(255,255,255,0.95);
			z-index: 90; 
		}
		a:hover {  text-decoration: none;}
		#header .bar ul.gnb > li.myshop ul.mnb li {
			min-width: 105px;
			text-align: left;
		}
		#header .bar ul.gnb > li.myshop ul.mnb li a {
			display: block;
			font-size: 11px;
			line-height: 23px;
			padding: 0 13px; 
			color: #545454;
		}
		a:hover {
    		text-decoration: none;
		}

		#header .bar ul.gnb > li .msgbox > span {
			margin: -8px 0 0 0;
			display: block;
			padding: 1px 7px;
			background: #e4e4e4;
			border-radius: 7px;
			font-size: 10px;
			line-height: 18px;
			color: #333;
			letter-spacing: 0.5px;
		}

		
		#header .bar ul.gnb > li.myshop ul.mnb li:hover a {
			background: #efefef;
		}
		#header .bar ul.gnb > li .msgbox > i {
			display: block;
			color: #e4e4e4;
			font-size: 18px;
		}
		#header .bar ul.gnb > li .msgbox {
			position: relative;
			display:block;
			max-width:400px;
			margin:0px auto;
			animation:animatedbang 4s infinite;

		}
		@keyframes animatedbang

		{
			0%{transform:translateY(3px);}
			50%{transform:translateY(-3px);}
			100%{transform:translateY(3px);}

		}
		#header .spot {
			width: 100%;
		}
		#header .spot .inner {
			position: relative;
			width: 1260px;
			margin: 0 auto 0;
			padding: 15px 0;
			text-align: center;
			font-size: 0;
			min-height: 70px;
			display: table;

		}
		#header .spot .inner h1.top-logo a.logo {
			position: relative;
			display: inline-block;
			vertical-align: middle;
		}
		#header .bar ul.gnb > li {
			white-space: nowrap;
		}
		img, fieldset {
			border: none;
			vertical-align: top;
		}
		.modal_wrap {
			position: fixed;
			z-index: 1000;
			background-color: rgba(0,0,0,0.4);
			overflow: auto;
			width: 100%;
			height: 100%;
			display: flex;
			justify-content: center;
			align-items: center;
			display: none;
		}
		.model_content {
			position: relative;
			width: 460px;
			height: 600px;
			background-color: white;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
					0 4px 20px 0 rgba(0,0,0,0.19);
			border-radius: 2px;
			overflow: hidden;
		}
		#search-box {
			position: absolute;
			right: 0;
			bottom: 11px;
		}
		#search-box .xans-layout-searchheader fieldset {
			position: relative;
			text-align: left;
			font-size: 12px;
		}
		input {
			font-size: 100%;
			color: #353535;
			vertical-align: middle;
			outline: none;
		}
		legend {
			visibility: hidden;
			position: absolute;
			left: -9999px;
			top: -9999px;
			width: 0;
			height: 0;
			line-height: 0;
		}
		#search-box .xans-layout-searchheader a {
			display: inline-block;
			color: #bbb;
			font-size: 14px;
			position: absolute;
			bottom: 6px;
			top: 7px;
			right: 0px;
		}
		#search-box .xans-layout-searchheader {
			width: 180px;
			height: 27px;
			border: 1px solid #e2e2e2;
			border-color: rgba(0,0,0,.11);
			background: rgba(255,255,255,.11);
			box-sizing: border-box;
		}
		#search-box .xans-layout-searchheader #keyword {
			background: transparent;
			border-color: transparent;
			width: 150px;
			height: 17px;
			padding: 2px 0 0 8px;
			line-height: 21px;
			font-size: 11px;
			color: #777;
			box-sizing: border-box;
		}
	
		form { display: block; }
		.fa {
			display: inline-block;
			font: normal normal normal 14px/1 FontAwesome;
			font-size: inherit;
			text-rendering: auto;
		}

		#header .spot .inner ul.sns {
			position: absolute;
			left: 0;
			bottom: 10px;
			display: inline-block;
			font-size: 0;
		}
		#header .spot .inner ul.sns li {
			float: left;
			margin-right: 5px;
		}
		.sns li a {
			display: inline-block;
			background: rgba(0,0,0,.16);
			width: 26px;
			height: 26px;
			text-align: center;
			border-radius: 50%;
		}
		.sns li span.text, .sns li i {
			line-height: 26px;
			color: #fff;
			margin: 0;
			font-style: normal;
			letter-spacing: 0;
		}
		.sns li .instagram i {
			font-size: 17px;
		}
		.sns li .kakao i {
			font-size: 15px;
			line-height: 28px;
		}
		.banner_image {
			width: 250px;
			height: 145px;
		}
		.login_name {
			float : left;
			position : relative;
			margin-left: 16px;
			font-size: 11px;
			line-height:42px;
			color: #222;
			letter-spacing : 0.5px;
			white-space : nowrap;
		}


		/*===============================================================================================로그인 창= */
		* { -webkit-font-smoothing: antialiased; }
		a:link { text-decoration: none;}
		a:visited { text-decoration: none;}
 		a:hover {  text-decoration: none;}

		div, span {
			margin: 0;
			padding: 0;
			border: 0;
			vertical-align: baseline;
			outline: 0;
			/*border: 1px solid red;*/
		}
		ul, li, ol, dl, dt, dd {
			list-style: none;
		}
		.dt_popup {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,0.5);
			z-index: 9999;
			display: none;
		}
		#pop_login, .dt_popup_inr {
			width: 450px;
			padding : 50px 45px;
			background: #fff;
			box-sizing: border-box;
		}
		.dt_popup, .dt_popup_inr {
			position : absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%)
			;
		}
		.pop_login_title {
			font-size: 33px;
			color: #333333;
			text-align: center;
			text-transform: uppercase;
		}
		.pop_tab_list {
			text-align: center;
		}
		.pop_tab_list li {
			display: inline-block;
			vertical-align: middle;
		}
		/*로그인 에러 메세지*/
		.pop_tab_list1 li a {
			display: none;
			font-size: 12px;
			color: red;
			text-align: left;
		}
		.tab_content.open {
			display: block;
		}
		.tab_list_title {
			font-size: 17px;
		}
		.MS_login_id, .MS_login_pw {
			width: 100%;
			height: 40px;
			padding-left: 10px;
			font-size: 12px;
			border: 1px solid #ddd;
			box-sizing: border-box;
		}
		.login_input_box li {
			padding-top: 10px;
		}
		.save_login {
			display: inline-block;
			vertical-align: top;
			width: 50%;
		}
		#chk_save_id {
			-webkit-appearance : none;
			display: inline-block;
			vertical-align: middle;
			width: 20px;
			height: 20px;
			border : 1px solid #ddd;
			box-sizing: border-box;
		}
		.login_utile_box {
			padding-top: 16px;
			font-size: 0;
		}
		.login_utile_box label {
			display: inline-block;
			vertical-align: middle;
			padding-left: 10px;
			font-size: 13px;
			color: #333333;
			font-weight: 400;
		}
		.security_login {
			display: inline-block;
			vertical-align: top;
			width: 47%;
			text-align: right;
		}
		.MS_security_checkbox {
			-webkit-appearance : none;
			display: inline-block;
			vertical-align: middle;
			width: 13px;
			height: 16px;
			box-sizing: border-box;
		}
		.security_login label {
			padding-left: 5px;
		}
		.login_btn_box {
			padding-top : 17px;
		}
		.login_input_box {
			padding-top: 24px;
		}
		.login_btn_title {
			border: 0;
			outline-style: none;
			display: block;
			width: 100%;
			height: 56px;
			font-size: 15px;
			color: #fff;
			text-align: center;
			line-height: 56px;
			background: #333333;
		}
		.tab_content.open {
			display: block;
		}
		.join_btn_title {
			border: 0;
			/*padding-top: 10px;*/
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
		.id_pw_find_box {
			font-size: 12px;
			padding-top: 20px;
		}

		.id_pw_find_box dt {
			display: inline;
			text-align: right;
			vertical-align: top;
			width: 60%;
			color: #333;
			font-weight: 400;
		}
		.id_pw_find_box dd {
			display: inline;
			vertical-align: top;
			width: 40%;
			text-align: right;
		}
		.id_pw_find_box dd a {
			display: inline-block;
			padding-bottom: 2px;
			font-size: 12px;
			color: #333;
			background: space-between;
			font-weight: 400;
			border-bottom: 1px solid #333;
		}
		.id_pw {
			width: 50%;
			display: inline;
			vertical-align: top;

			text-align: right;
		}
		
		/*====================================================================================로그*/
		
		.login_close {
			position: absolute;
			top: 7px;
			right: 7px;
		}
		.login_close > button {
			color: rgb(142, 142, 142);
			border: none;
			background: white;
			font-size: 17px;
			cursor: pointer;
			outline: none;
		}
		.login_close >button:hover {
			color: #eba444;
		}
		

		/*==============================================================================비밀번호 눈*/

		.pw_eye {
			position: absolute;
			color: #aaa;
			font-size: 17px;
			top: 13px;
			right: 7px;
			cursor: pointer;
			height: 45px;
			line-height: 45px;
			width: 30px;
			text-align: center;
		}
		
			
		.input_div{
			position: relative;
		}
		
		/*====top버튼===========================================*/
		.top_btn {
			bottom: 115px;
			background-color: #9055A2;
			display : none;
		}
		.fix_btn {
			position: fixed;
			right: 50px;
			color: white;
			width: 70px;
			height: 70px;
			border-radius: 50%;
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 30px;
			cursor: pointer;
			box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,.19);
		}
		.fix_btn > i {
			transition: transform .3s;
		}
		.fas {
			font-weight: 900;
		}
		.fix_btn:hover > i {
			transform: scale(1.3);
		}

		
	</style>
</head>
<body>
	<div class="top_btn fix_btn"><i class="fas fa-arrow-up"></i></div>

	<div class="dt_popup">
		<div class="dt_popup_inr">
			<div class="login_close">
				<button><i class="fas fa-times"></i></button>
			</div>
			<div class="pop_login_wrap">
				<div class="pop_login_inr">
					<h3 class="pop_login_title roboto_font">
						<span class="title">LOGIN</span>
					</h3>
					<div class="pop_tab_list login_tab_list">
						<ul>
							<li class="active">
								<a href="#" class="tab_list_title js_tab_btn">회원 로그인</a>
							</li>
							
						</ul>
					</div>
					
					<div class="tab_contents">
						<div class="tab_content open">
							<form name="formlogin" method="post" action ="" onsubmit ="return false;">
								<div class="login_input_box">
									<ul>
										<li>
											<input type="text" id= "login_id" name="id" maxlength="20" value class="login_input MS_login_id" placeholder="아이디" required>
										</li>
										<li>
											<div class="input_div">
												<input type="password" id = "login_pw" name="passwd" maxlength="20" value class="login_input MS_login_pw" placeholder="비밀번호" required minlength="6" maxlength="18">
												<span class="pw_eye"><i class="fas fa-eye-slash"></i></span>
											</div>
										</li>
									</ul>
									
									<div class="pop_tab_list1 login_tab_list">
										<ul>
											<li class="active" >
												<a href="#" id = "err_content" class="tab_list_title js_tab_btn" >가입하지 않은 아이디이거나, 잘못된 비밀번호입니다. </a>
											</li>
										</ul>
									</div>
									
									<div class="login_utile_box">
										<div class="save_login">
											<input type="checkbox" name="save_id" id="chk_save_id" value="on">
											<label for="chk_save_id">아이디 저장</label>
										</div>
										<div class="security_login">
											<input type="checkbox" name="ssl" value="Y" class="MS_security_checkbox">
											<label for> 보안접속</label>
										</div>
									</div>
								</div>
								<div class="login_btn_box">
									<button type = "submit" class="login_btn_title" id="btn_login"><span class="title"   >로그인</span></button>
									<button href = "#" class="join_btn_title"><span class="title" >회원가입</span></button>
								</div>
							</form>
							<div class="id_pw_find_box">
								<dl>	
									<dt>아이디/비밀번호를 잊으셨나요?</dt>
									<div class="id_pw"><dd><a href="#">아이디/비밀번호 찾기</a></dd></div>
								</dl>
								<dl>
									<dt>비회원으로 주문하셨나요?</dt>
									<div class="id_pw"><dd><a href="#">비회원 주문조회</a></dd></div>
								</dl>
							</div>
						</div>
						<div class="tab_content"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="wrap" class="main">
		<div id="header">
			<div style="">
				<div class="bar" df-fixed-id="gnb" style="top:0px;">
					<div class="inner">
						<ul class="gnb">
							<c:choose>
								<c:when test="${empty sessionScope.userid}">
									<li class="xans-element- xans-layout xans-layout-statelogoff ">
										<a href="#" class="log">LOGIN</a>
									</li>
									<li class="xans-element- xans-layout xans-layout-statelogoff ">
										<a href="${path}/member/constract">JOIN US</a>
										<div class="msgbox use-msgbox" style="display:block;">
											<i class="fa fa-caret-up"></i>
											<span class="rep-msgbox">+1,000 P</span>
										</div>
									</li>
								</c:when>
								<c:otherwise>
								
									<div class = "login_name"><span >${sessionScope.userid}(${sessionScope.name}) 님 </span></div>
									<li class="xans-element- xans-layout xans-layout-statelogoff ">
										<a href="#" class="log" id ="header_btn_logout">LOGOUT</a>
									</li>
								</c:otherwise>
							</c:choose>
							
							<li>
								<a href="#">CART</a>
								<span class="xans-element- xans-layout xans-layout-orderbasketcount cart-count EC-Layout_Basket-count-display ">
									<span class="EC-Layout_Basket-count">0</span>
								</span>
							</li>
							<li>
								<a href="#">ORDER</a>
							</li>
							<li class="myshop">
								<a href="#">MY PAGE</a>
								<ul class="xans-element- xans-myshop xans-myshop-main mnb">
									<li><a href="#">관심상품</a></li>
									<li><a href="#">주문조회</a></li>
									<li><a href="#">내가쓴글</a></li>
									<li><a href="${path}/member/mypage">마이페이지</a></li>
									<c:if test="${not empty userid}">
									</c:if>
								</ul>
							</li>
							<li>
								<a href="#" target="_blank" onclick="winPop(this.href); return false">+BOOKMARK</a>
							</li>
						</ul>
						<ul class="xans-element- xans-layout xans-layout-boardinfo bnb">
							<li class="xans-record">
								<a href="#">NOTICE</a>
							</li>
							<li class="xans-record">
								<a href="#">Q&N</a>
							</li>
							<li class="xans-record">
								<a href="#">REVIEW</a>
							</li>
							
						</ul>
					</div>
				</div>
			</div>

			<div class="spot">
				<div class="inner">
					<h1 class="xans-element- xans-bannermanage2 xans-bannermanage2-display-18 xans-bannermanage2-display xans-bannermanage2-18 top-logo">
						<a href="${path}/" class="logo">
							<span class="xans-record-" style="opacity: 1;">
								<img class="banner_image" alt="로고" src="${path}/resources/img/bobo.png" >
							</span>
						</a>
					</h1>
					<div class="xans-element- xans-layout xans-layout-multishoplist globalThumb"></div>
					<ul class="sns">
						<li class="use-kakao" style="display:list-item;">
							<a href="#" class="kakao put-kakao">
								<i class="fa fa-quote-right"></i>
							</a>
						</li>

						<li class="use-instagram" style="display: list-item;">
							<a href="#" class="instagram put-instagram">
								<i class="fab fa-instagram"></i>
							</a>
						</li>

					</ul>
					<div id="search-box">
						<form id="searchBarForm" name action
						method="get" target="_self" enctype="multipart/form-data">
							<div class="xans-element- xans-layout xans-layout-searchheader">
								<fieldset>
									<legend>검색</legend>
									<input id="keyword" name="keyword" value type="text">
									<a href="#" >
										<i class="fa fa-search"></i>
									</a>
								</fieldset>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message == 'nologin') {
			$('.dt_popup').css('display','flex');
			$('#log').focus();
			$('#err_content').css('display', 'block')
							 .text('로그인이 필요한 기능입니다.');
			
		}
		
	});
	
	// 로그인 input(id, pw)에 focus되면 테두리색 변경
	$(document).on('focus', 'login_input_container', function() {
		$(this).parent().css('border', '1.5px solid #3885ca');
	});

	$(document).on('blur', 'login_input_container', function() {
		$(this).parent().css('border', '1.5px solid transparent');
	});

	// Login 버튼 클릭시 modal창 open
	// 로그인창 들어가면 바로 칠수있게 설정한것 id = "login_id" $('#login_id').focus(); 
	$(document).on('click','.log', function(){
		$('.dt_popup').css('display','flex');
		$('#log').focus();
	});

	// modal창의 x버튼을 클릭하면 modal창 close
	$(document).on('click', '.login_close', function(){
		$('.dt_popup').css('display', 'none');
		//$('.frm_login')[0].reset();
		$('.login_input').val('');

		$('.pw_eye').prev().attr('type', 'password');
		$('.pw_eye').html('<i class= "fas fa-eye-slash"></i>')
					.css('color', '#aaa');
		

	});
	
	/* 로그아웃 기능*/
	$(document).on('click', '#header_btn_logout', function(){
		$.ajax({
			url: '${path}/login/out',
			type:'POST',
			success:function(){
				//console.log('Logout Success:)');
				location.reload();
			},
			error:function(){
				alert('System Error:/');
			}
		}); 
		
	});

	

	// login modal창 암호 보이기 or 숨기기. 옵션. 옵션 
	$(document).on('click', '.pw_eye', function(){
		var code = $(this).prev().attr('type');
		
		if (code == 'password') {
			$(this).prev().attr('type', 'text');
			$(this).html('<i class="fas fa-eye"></i>')
					.css('color', '#666');
		} else {
			$(this).prev().attr('type', 'password');
			$(this).html('<i class="fas fa-eye-slash"></i>')
					.css('color', '#aaa');
		}

	});
	
	// Login 버튼 클릭시 AJAX 동작
	$(document).on('click','#btn_login', function(){
		 // id와 pw값 받아와서 null이면 작동x 
		 var id = $('#login_id').val();
		 var pw = $('#login_pw').val();
		 
		 // 유효성 체크 (id,pw) null 체크
		 if(id != '' && pw != '' && id.length != 0 && pw.length != 0) {
		 	$.ajax({
		 		url:'${path}/login/in', 
		 		type:'POST',
		 		data : 'id='+id+'&pw='+pw,
		 		success: function(data) {
		 			//alert('System Success:)');
		 			console.log(data);
		 			
		 			if(data == 0 || data == 3) {
		 				$('#err_content').css('display', 'block')
		 				.text('로그인 중 문제가 발생하였습니다. 아이디와 비밀번호를 확인하거나 계정을 생성하십시오.')
		 			} else if(data == 1) {
		 				console.log('로그인 성공');
		 				location.reload(); // 새로고침
		 			} else if(data == 2) {
		 				$('#err_content').css('display', 'block')
		 				.text('이메일 인증 후 로그인 할 수 있습니다.')
		 			}
		 		},
		 		error: function(){
		 			alert('System Error:/');
		 		}
		 	});
		 }
		 
	});
	

	// Scroll Top버튼 생성 및 top으로 이동
	$(window).scroll(function() { // 스크롤이 움직이면
		// alert('움직임');
		// scrollTop 맨위 0부터 시작해서 fadeIn, fadeout:잔상효과 top버튼이 나오게 한다. 기본효과 display: block;
		if(document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
			$('.top_btn').fadeIn().css("display","flex");
		} else {
			$('.top_btn').fadeOut();
		}
	});
	// animate 스크롤이 서서히 올라가는 효과, 안주면 순간이동 된다. 맨위로 0.8초
	$('.top_btn').click(function(){
		$('html, body').animate({ scrollTop: 0 }, 800);
	});
  

</script>
</html>