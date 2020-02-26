<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 모달창 ===========================================================*/
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
		}
		ul, li, ol, dl, dt, dd {
			list-style: none;
		}
		.dt_popup1 {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0,0,0,0.5);
			z-index: 9999;
			display : none;
		}
		#pop_login1, .dt_popup_inr1 {
			width: 450px;
			padding : 40px 45px;
			background: #fff;
			box-sizing: border-box;
			border-radius: 10px 10px;
		}
		.dt_popup1, .dt_popup_inr1 {
			position : absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		.modal_close1 {
			position: absolute;
			top: 10px;
			right: 10px;
		}
		.modal_close1 > button {
			color: rgb(142, 142, 142);
			border : none;
			background: white;
			font-size: 17px;
			cursor: pointer;
			outline: none;

		}
		.dt_popup_inr1 {
			font-size: 18px;
			color: #333333;
			/*text-align: center;*/
			text-transform: uppercase;
		}
		.login_btn_box1{
			display: flex;
			justify-content: space-around;
			align-items: center

		}
		.login_btn_title1 {
			display: inline-block;
			width: 40%;
			height: 56px;
			font-size: 15px;
			color: #fff;
			text-align: center;
			line-height: 56px;
			background: #333333;
			border: 2px solid #333333;
			border-radius: 5px 5px;
		}

		.title1 {
			align-items: center
		}
		.title2 {
			font-size : 14px;
		}

	

</style>
</head>
<body>
	<div class="dt_popup1">
		<div class="dt_popup_inr1">
			<div class="modal_close1">	
				<button><i class="fas fa-times"></i></button>
			</div>
			<div class="pop_login_wrap1">
				<div class="pop_login_inr1">
					<div class="pop_tab_list1 login_tab_list1">
						<ul>
							<li class="active">
								<h3 class="pop_login_title1 roboto_font1">
									<span class="title1">님 회원가입을 축하드립니다.</span>
								</h3>
							</li>
							
						</ul>
					</div>
					<div class="pop_tab_list1 login_tab_list1">
						<ul>
							<li class="active">
								<h3 class="pop_login_title1 roboto_font1">
									<span class="title2">으로 인증메일을 보냈습니다.<br> 인증하셔야만 사이트 활동이 가능합니다.</span>
								</h3>
							</li>
							
						</ul>
					</div>
					<div class="login_btn_box1">
						<a href="#" id ="modal_msg_yes" class="login_btn_title"><span class="title">확인</span></a>
						<!-- <a href="#" class="join_btn_title" id = "modal_msg_close"><span class="title">취소</span></a> -->
					</div>
				</div>
			</div>
		</div>
	</div> 

</body>
<script type="text/javascript">
	$(function(){
		var id = '${id}';
		var email = '${email}';
		var key = '${key}';
		
		var join_main_txt = id + '님 회원가입을 축하드립니다. ';
		var join_sub_txt = email + '으로 인증 메일을 보냈습니다. 인증하셔야만 사이트 횔동이 가능합니다.';
		var auth_main_txt = id + '님 이메일 인증되셨습니다.';
		var auth_sub_txt = '지금부터 사이트 활동이 가능합니다. 감사합니다 :)';
		
		if(key == 'join') {
			$('.title1').text(join_main_txt); // 메인 텍스트
			$('.title2').text(join_sub_txt); // 서브 텍스트
			$('.modal_close1').css('display', 'none'); // 취소버튼 제거
			$('.dt_popup1').css('display', 'flex'); // 모달창 출력
		} else if(key == 'auth') {
			$('.title1').text(join_main_txt);
			$('.title2').text(auth_sub_txt);
			$('.modal_close1').css('display', 'none');
			$('.dt_popup1').css('display', 'flex');
		}
		
		$('#modal_msg_yes').on('click', function(){
			$('.dt_popup1').css('display', 'none');
		});
		$('.modal_close1').on('click', function(){
			$('.dt_popup1').css('display', 'none');
		});
		
		
	});
</script>
</html>