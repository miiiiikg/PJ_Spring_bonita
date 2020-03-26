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
		ul li {list-style-type: none; float:left;}
		#content {
			width: 980px;
			margin : 0 auto;
			vertical-align: top;
		}
		.cs-page {
			padding : 30px;
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
			font-size: 13px;
			color: #ff5e00;
			font-weight : bold;
		}
		.far {
			color: #30A9DE;
		}
		.h2 {
			margin: 10px 366px;
			font-size: 25px;
			color:#6d6d6d;
		}
		.paging {
			padding: 0 75px 0 0;
			text-align: center;
			font-size: 15px;
			display: flex;
			margin : 0 auto;
			justify-content : center;
			
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
		.twincle_eff {
			animation-name:twinkle;
			animation-duration : 1.2s;
			animation-iteration-count: infinite;
		}
		@keyframes twinkle {
			0% {opacity:0;}
			100% {opacity:1;}
		}
		#check_color {
			font-weight: 200;
		}
		.paging > li > a {
			padding : 0px 8px;
			color : #515151;
			border : 1px solid #ddd;
			font-size : lrem;
			display: inline-block;
			margin: 0px 5px;
			border-radius : 2px;
			line-height : 28px;
			height : 30px;
		}
		#check_color {
			border : 1px solid #8E85D6;
			background-color : #8E85D6;
		}
		.paging > li > a:hover {
			background-color : #ddd;
			box-shadow : 0 14px 26px -12px hsla(0, 0%, 60%, .42),
						0 4px 23px 0 rgba(0, 0, 0, .12),
						0 8px 10px -5px hsla(0, 0%, 60%, .2);
		}
		.search_cnt {
			font-size : 14px;
			padding-left : 11px;
			padding-top : 20px;
		}
		.fa {
			display : inline-block;
			font-size : inherit;
			text-rendring : auto;
			-webkit-font-smoothing : autialiased;
			transform: translate(0, 0);
			color : #a3a1a1;
		}
		.bonita_board_search {
			border : 1.5px solid ##00b9f1;
			border-radius : 2px;
			padding : 0px 0px 0xp 5px;
			position : relative;
			overflow : hidden;
			margin-right: 95px;
		}
		.bonita_board_search input {
			margin : 7px 5px;
			width: 140px;
			outline : none;
			border : 0px;
			transition : .5s;
		}
		.btn_search_board {
			
			width : 35px;
			height : 35px;
			background-color : white;
			display: inline-flex;
			justify-content : center;
			align-items : center;
			transition : 0.4s;
			text-decoration : none;
			border-radius : 4px;
			border : none;
			cursor : pointer;
		}
		

	</style>
</head>
<body>
	<!-- now라는 변수를 만들고  -->
	<jsp:useBean id="now" class="java.util.Date"/>
	<!-- 현재시간 -->
	<fmt:formatDate value="${now}" pattern ="yyyy-MM-dd" var="today"/>					
	<div id="content">
		<div class="contents-inner cs-page">
			<div class="section">
				<div class="section_header">
					<h2 class="h2">자유 게시판</h2>
					<div class="option type1">
						<div class="sun">
							<a href="${path}/board/list?sort_option=new&keyword=${map.keyword}" style="margin: 0px 12px;" id="sort_new">최신순</a>
							<a href="${path}/board/list?sort_option=cnt&keyword=${map.keyword}" style="margin: 0px 12px;" id="sort_cnt">조회순</a>
							<a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}" style="margin: 0px 12px;" id="sort_reply">댓글순</a>
							<a href="${path}/board/list?sort_option=good&keyword=${map.keyword}"style="margin: 0px 12px;" id="sort_good">추천순</a>
						</div>
						<a href="#" class="skinbtn base2 contactus-write">게시글 등록</a>
					</div>
					<div class="search_cnt">
						<span >검색결과 ${map.keyword}는 ${map.count}건 검색되었습니다.</span>
						<a href ="#" class= "btn btn-warning">
							<i class = "fa fa-times-circle"></i>
							
						</a>
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
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>추천</th>
						</thead>
						
						<!-- 게시글 -->
						<c:forEach items='${map.list}' var='list'>
						<!-- 년/월/일로 바꿈 -->
						<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd" var="regdate"/>
							<tbody>
								<tr style="height: 50px">
									<td class="ta-c">${list.bno}</td>
									<td class="tit" style="text-align: left;">
										<a href="${path}/board/view/${list.bno}">${list.title}
											<span  class="txt_point num  b">[${list.replycnt}]</span>  
											<i class="far fa-image"></i>
											<c:if test="${today == regdate}">
												<img src="${path}/resources/img/icons8-n-501.png" class = "blinking twinkle">	
											</c:if>
										</a>
									</td>
									<td class="ta-c">${list.writer}</td>
									<td class="ta-c">
										<c:choose>
											<c:when test="${today == regdate}">
												<fmt:formatDate value="${list.updatedate}" pattern="HH:mm:ss"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${list.updatedate}" pattern="yyyy-MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="ta-c">${list.viewcnt}</td>
									<td class="ta-c">${list.goodcnt}</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<fieldset class="boardSearch">
					<legend></legend>
					<p>
						<c:if test="${!empty map.keyword}">
							<div class ="bonita_board_search">
								<form action="${path}/board/list" method = "GET">
									<input type = "text" name = "keyword" class= "input_search" placeholder="검색어를 입력하세요." value="${map.keyword}">
									<button type = "submit" class = "btn_search btn_search_board" >
										<a class="btn btn-warning" href ="${path}/board/list" ><i class= "fas fa-search"></i></a>
										CLEAR
									</button>
								</form>
							</div>
						</c:if>
					</p>
				</fieldset>
				
					<div class="paging">
						<c:if test="${map.pager.curBlock > 1}">
							<li><a href="${path}/board/list?curPage=${map.pager.blockBegin-10}&sort_option=${map.sort_option}&keyword=${map.keyword}" class ="page_left"><i class= "fas fa-angle-left"></i></a></li>
							<li><a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">1</a></li>
							<li><span>...</span></li>
						</c:if>
						
						<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}" id="check_color">${num}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${path}/board/list?curPage=${num}&sort_option=${map.sort_option}&keyword=${map.keyword}">${num}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<li><span>...</span></li>
							<li><a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}" class="">${map.pager.totPage}</a></li>
							<li><a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}" class ="page_right"><i class= "fas fa-angle-right"></i></a></li>
						</c:if>
						
						
					</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	var sort_option = '${map.sort_option}';
	if(sort_option != null) {
		$('#sort_' + sort_option).css('color', '#2b90d9');
		$('#sort_' + sort_option).css('border-radius', '5px');
		$('#sort_' + sort_option).css('font-weight', 'bold');
	}
	
	
	$('.write_btn').click(function(){
		location.href="/bonita/board/write";
	});
});

</script>
</body>
</html>