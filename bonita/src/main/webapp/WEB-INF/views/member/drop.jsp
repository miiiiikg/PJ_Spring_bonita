<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<style type="text/css">
		ul, span, h2, a, h1, li{ text-decoration: none; }
		.wrap {
			display: block;
		}
		li { list-style: none }

		.compatible-wrap {
			width: 800px;
			display: block;
			text-align: center;
			margin: 70px auto 20px auto;
			position: relative;
		}
		.compatible-wrap .km-header {
			text-align: left;
		}
		.ka-section-header {
			border-bottom: 1px solid #d6d6d6;
		}
		.compatible-wrap .km-header h1 {
			font-weight: normal;
			font-size: 20px;
		}
		div[data-role="content"] {
			text-align: center;
			padding-top: 35px;
		}
		div[data-role="content"] .km-title {
			display: block;
			font-size: 24px;
			margin: 0 0 4px;
		}
		.km-button {
			border-radius: 4px;
			border:1px solid #b6b6b6;
			text-align: center;
			display: inline-block;
			min-width: 118px;
			padding: 11px;
		}
		form.km-section {
			text-align: center;
			width: 100%;
			font-size: 14px;
		}
		.ka-section-footer {
			margin-top: 33px;
			padding-top: 30px;
			border-top: 1px solid #d4d4d4;
		}
		.km-button:first-child {
			margin-right: 10px;
		}
		.km-button.highlighted {
			background-color: #8E85D6;
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
		.pw_box {
			text-align: center;
		}
		
	</style>
</head>
<body>
	<div class="wrap">
		
		<div class="compatible-wrap" style="height:auto;">
			<div class="page-deactivate-web km-page-active" data-role="page" id="page-deactivate-intro">
				<div class="km" data-back ="#back" data-role="header">
					<div class="km-header ka-section-header">
						<h1>보니또계정 탈퇴</h1>
					</div>
				</div>
				<div class="km" data-role="content">
					<div class="km-container">
						<h1 class="km-deactivate km-title">보니또계정 탈퇴 전 꼭 확인해주세요!</h1>
						<p class="km-deactivate km-section deactivate_desc1">보니또계정을 탈퇴하면 계정 정보 및 보니또 서비스 이용기록 등 모든 정보가 삭제 됩니다.</p>
						<p class="km-deactivate km-section">탈퇴한 카카오계정 정보와 서비스 이용기록 등 복구할 수 없으니 신중하게 선택하시길 바랍니다.</p>
						<div class = "pw_box" style = "padding: 0 170px;">
							<h3 class="join_title">
								<label for="pswd1">비밀번호</label>
							</h3>
							<span class="ps_box int_pass">
								<input type="password" id="upswd1" name="pw" class="int">
								<span class="step_url"><span class="pw_lock"></span></span>
							</span>
							<div style="margin:10px 0px;">     
							<span class="ps_box int_pass" >
								<input type="password" id="upswd2" name="upswd2" class="int">
								<span class="step_url"><span class="repw_lock"></span></span>
							</span>
							<span class="error_next_box" >필수 정보입니다.</span>
						</div>
						</div>
						<form class="km-section">
							<div class="ka-section-footer">
								<a class = "km-button deactivate-link-close" href="#">
									<span>탈퇴 취소</span>
								</a>
								<a class = "km-button highlighted submit deactivate-link-intro" href="#">
									<span>확인</span>
								</a>
							</div>
						</form>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>