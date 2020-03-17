<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<style type="text/css">
		a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
 		a:hover { color: black; text-decoration: underline;}
		#content {
			width: 980px;
			margin : 0 auto;
			vertical-align: top;
		}
		.cs-page {
			padding-top : 30px;
		}
		.cs-page .section-header {
			overflow: hidden;
			margin : 0;
			padding: 0 0 14px;
		}
		.section .top-date {
			margin : 40px 0 0;
		}
		.m2 {
			margin-top: 20px !important;
		}
		.table1 > table > thead > tr > th {
			padding: 10px 0;
			border-bottom: 1px solid #dbdbdb;
			background: #f7f7f7;
		}
		.table1 > .board-list td {
			height: 40px;
			text-align: center;
		}
		.table1 > .board-list td.category {
			color : #888;
		}
		.table1 > .board-list td.tit {
			padding: 0 30px;
		}
		.skinbtn {
			display: inline-block;
			text-align: center;
			vertical-align: top;
			box-sizing: border-box;
			cursor: pointer;
			font-size: 12px;
		}
		.skinbtn.base2 {
			background: #979797;
			border: 1px solid #979797;
			color: #fff;
		}
		.skinbtn.base2.contactus-write {
			height: 30px;
			line-height: 28px;
			padding: 0 12px;
		}
		.cs-page .section-header .option {
			float: right;
			position: static;
		}
		.pagination {
			padding: 20px 0 0;
			text-align: center;
		}
		.table1 > table > tbody > tr >td {
			border-bottom: 1px solid #dbdbdb;
			color: #444;
		}
		.option {
			text-align: right;
		}
		.active {
			border: 1px solid #3e3d3c;
			color: #3e3d3c;
		}
		.pagination li span {
			height: 21px;
			padding: 4px 10px 1px;
			text-align: center;
			display: block;
		}
		.sun {
			float: left;
			font-size: 15px;
		}
		.boardSearch {
			border: 1px solid white;
		}
		.xans-board-search select#search_date {
			margin: 0 2px 0 0;
		}
		.xans-board-search select {
			margin : 0 2px 0 0;
			width: 100px;
		}
		select {
			height: 26px;
			border: 1px solid #f3f3f3;
			box-sizing: border-box;
		}
		input[type=text] {
			height: 26px;
			line-height: 26px;
			padding: 2px 8px;
			border: none;
			background: #f3f3f3;
			color: #6d6d6d;
			font-size: 12px;
			box-sizing: border-box;
		}
		.btn_04 {
			display: inline-block;
			padding: 0 8px;
			height: 26px;
			line-height: 28px;
			font-size: 12px;
			font-weight: normal;
			letter-spacing: 0.2px;
			vertical-align: top;
			box-sizing: border-box;
			border-radius: 2px;
			border: 1px solid #6d6d6d;
			text-align: center;
		}
		.txt_point {
			font-size: 12px;
		}
		.far {
			color: #30A9DE;
		}
		.h2 {
			margin: 5px 427px;
			font-size: 25px;
			color:#6d6d6d;
		}
		.paging {
			padding: 0 75px 0 0;
			text-align: center;
			font-size: 12px;
		}
		.paging span.num_prev {
			display: inline-block;
			position: relative;
			width: 52px;
			top: 2px;
		}
		.num_box {
			display: none;
		}
		.blinking{
		-webkit-animation:blink 0.7s ease-in-out infinite alternate;
    	-moz-animation:blink 0.7s ease-in-out infinite alternate;
    	animation:blink 0.7s ease-in-out infinite alternate;
		}
		@-webkit-keyframes blink{
		    0% {opacity:0;}
		    100% {opacity:1;}
		}
		@-moz-keyframes blink{
		    0% {opacity:0;}
		    100% {opacity:1;}
		}
		@keyframes blink{
		    0% {opacity:0;}
		    100% {opacity:1;}
		}

	</style>
</head>
<body>
	<div id="content">
		<div class="contents-inner cs-page">
			<div class="section">
				<div class="section_header">
					<h2 class="h2">자유 게시판</h2>
					<div class="option type1">
						<div class="sun">
							<a href="#" style="margin: 0px 12px;">최신순</a>
							<a href="#" style="margin: 0px 12px;">조회순</a>
							<a href="#" style="margin: 0px 12px;">댓글순</a>
							<a href="#"style="margin: 0px 12px;">추천순</a>
						</div>
						<a href="#" class="skinbtn base2 contactus-write">게시글 등록</a>
					</div>
				</div>
			</div>
			<div class="section top-date">
				<div class="table1 type1 m2" align="center">
					<table class="board-list" style="width: 100%;">
						<colgroup>
							<col style="width: 96px;">
							<col style="width: 407px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 65px;">
							<col style="width: 50px;">
						</colgroup>
						<thead>
							<th>게시글번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>추천</th>
						</thead>
						<tbody>
							<tr style="height: 50px">
								<td class="ta-c">010</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[8]</a>
									<i class="far fa-image"></i>
									<img src="${path}/resources/img/icons8-n-501.png" class = "blinking">
								</td>
								<td class="ta-c">쿠쉬쿠쉬</td>
								<td class="ta-c">100</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">009</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[2]</a>
									<i class="far fa-image"></i>
									<img src="${path}/resources/img/icons8-n-501.png" class = "blinking">
								</td>
								<td class="ta-c">여우</td>
								<td class="ta-c">10</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">008</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[4]</a>
									<i class="far fa-image"></i>
									<img src="${path}/resources/img/icons8-n-501.png" class = "blinking">
								</td>
								<td class="ta-c">밝은안경</td>
								<td class="ta-c">80</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">007</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[20]</a>
									<i class="far fa-image"></i>
									<img src="${path}/resources/img/icons8-n-501.png" class = "blinking">
								</td>
								<td class="ta-c">미경</td>
								<td class="ta-c">100</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
								<tr style="height: 50px">
								<td class="ta-c">005</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[3]</a>
									<i class="far fa-image"></i>
								</td>
								<td class="ta-c">초승달</td>
								<td class="ta-c">50</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">005</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[5]</a>
									<i class="far fa-image"></i>
								</td>
								<td class="ta-c">레몬</td>
								<td class="ta-c">24</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">004</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[7]</a>
									<i class="far fa-image"></i>
								</td>
								<td class="ta-c">딸기</td>
								<td class="ta-c">36</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">003</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[3]</a>
									<i class="far fa-image"></i>
								</td>
								<td class="ta-c">사과</td>
								<td class="ta-c">52</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">002</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[7]</a>
									<i class="far fa-image"></i>
								</td>
								<td class="ta-c">송주은</td>
								<td class="ta-c">89</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
							<tr style="height: 50px">
								<td class="ta-c">001</td>
								<td class="tit" style="text-align: left;">
									<a href="#">글 제목 라라라랄~:)</a>
									<a href="#" class="txt_point num  b">[19]</a>
									<i class="far fa-image"></i>
								</td>
								<td class="ta-c">로야또야</td>
								<td class="ta-c">12</td>
								<td class="ta-c">2020.03.16</td>
								<td class="ta-c">0</td>
							</tr>
						</tbody>
					</table>
				</div>
				<fieldset class="boardSearch">
					<legend></legend>
					<p>
						<select id = "seach_date" name = "search_date">
							<option value="week">일주일</option>
							<option value="month">한달</option>
							<option value="month3">세달</option>
							<option value="all">전체</option>
						</select>
						<select id="search_key" name="search_key">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="writer_name">글쓴이</option>
							<option value="member_id">아이디</option>
						</select>
						<input id = "search" name="search" class="inputTypeText" value type="text">
						<a href="#none" class="btn_white btn_04">찾기</a>
					</p>
				</fieldset>
				<nav>
					<div class="paging">
						<span class="num_prev">
							<span class="txt_sub"></span>
						</span>
						<a href="#" class="txt_point u b">1</a>
						<a href="#" class ="num_box">2</a>
						<a href="#" class ="num_box">3</a>
						<a href="#" class ="num_box">4</a>
						<a href="#" class ="num_box">5</a>
						<a href="#" class ="num_box">6</a>
						<a href="#" class ="num_box">7</a>
						<a href="#" class ="num_box">8</a>
						<a href="#" class ="num_box">9</a>
						<span class="num_next">
							<a href="#" class="arrow txt_sub"></a>
						</span>
					</div>
				</nav>
			</div>
		</div>
	</div>

</body>
</html>