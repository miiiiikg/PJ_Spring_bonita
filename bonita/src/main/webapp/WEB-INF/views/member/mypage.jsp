<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/effect.css">
	<style type="text/css">
		div, span {
			margin : 0;
			padding: 0;
			border : 0;
			vertical-align: baseline;
			outline: 0;

		}
		.join_content {
			width: 530px;
			margin : 0 auto;	
		}
		.row_group {
			overflow: hidden;
			width: 550px;
			font-size: 25px;
		}
		.page {
			border: 1px solid #404146;
		}
		.mypage {
			text-align: center;
			display: flex;
			font-size: 13px;
		}
		.myimg {
			padding: 61px 65px 55px;
		}
		.join_row {
			text-align: left;
		}
		.join_row table {
			font-size: 16px;
			padding : 33px 9px;
		}
		.btn_double_area {
			text-align: center;
			margin: 10px 0 9px;
		}
		table tr td:last-child {
			padding-left: 10px;
		}
		.btn_join {
			border: 1px solid #fff;
			padding: 21px 28px 17px;
			font-size: 15px;
			text-align: center;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="join_content">
			<div class="row_group">
				<h3>
					<label for="title">내 정보</label>
				</h3>
				<div class="page">
				<div class="mypage">
					<div class="myimg">
						<i class="far fa-grin-alt fa-6x"></i>	
					</div>
					<div class = "join_row">
						<table>
							<tr>
								<td>ID</td>
								<td>gpfhdzlx</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>미경</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>miiiiiikg@gmail.com</td>
							</tr>	
							<tr>
								<td>주소</td>
								<td>광주광역시 서구 광천동</td>
							</tr>
						</table>
					</div>

						
				</div>
					<div class="btn_double_area">
						<button id = "btn_join" type="button" class ="btn_join btn_agree" ><a href="${path}/member/update">회원정보 수정</a></button>
						<button id = "btn_join" type="button" class ="btn_join btn_agree" ><a href="${path}/member/pwupdate">비밀번호 변경</a></button>
						<button id = "btn_join" type="button" class ="btn_join btn_agree" ><a href="${path}/member/drop">회원탈퇴</a></button>
					</div>
				</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>