<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<style type="text/css">
		em {font-style: normal; font-style: none;}
		a:link { color: red; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
 		a:hover { color: black; text-decoration: underline;}
 		a:link, a:visited {
 			color: #444444;
 		}
		#content {
			font-size : 15px;
			margin: 0 auto;
			width: 768px;
			padding: 0 0 30px;
			vertical-align: top;
		}
		.txt_sub {
			color: #a5a5a5;
		}
		.cs-page .section-header {
			overflow: hidden;
			margin : 0 0 14px;
			padding : 0 0 14px;
		}
		.cs-page .section-header h2 {
			float: left;
		}
		.board-view-head .board-view-title {
			overflow: hidden;
			background: #f7f7f7;
			border-top: 1px solid #717171;
			padding: 15px;
			border-bottom: 1px solid #dbdbdb;
		}
		.board-view-head .board-view-title h2 {
			color: #111;
			font-size: 20px;
		}
		.board-view-info {
			padding: 10px 15px;
			border-bottom: 1px solid #dbdbdb;
			overflow: hidden;
		}
		.board-view-info .author {
			float: left;
			color: #111;
		}
		.fz11 {
			font-size: 11px;
		}
		.divide-bar {
			vertical-align: middle;
			width: 1px;
			height: 10px;
			display: inline-block;
			background: #cdcdcd;
			margin: 0 10px;
		}
		.board-view-info .value {
			float: right;
		}
		.board-view-info .value strong {
			color: #555;
		}
		.comment-wrap .head {
			overflow: hidden;
			padding: 15px 0 15px 15px;
			border-top: 1px solid #dbdbdb;
		}
		.comment-wrap .head .comment-count {
			float: left;
		}
		.comment-count span {
			float: left;
		}
		.comment-count span strong {
			color: #3e3d3c;
		}
		.comment-wrap > ul {
			background: #f8f8f8;
		}
		.comment-write {
			padding : 15px;
			background: #f8f8f8;
		}
		.skinbtn * {
			font-size: 100%;
		}
		.btn_all {
			text-align: right;

		}
		.btn_all > a {
			border: 9px solid #77AAAD;
			width: 50px;
			background-color: #77AAAD;
			border-radius: 10px;
		}
		.word {
			padding-left: 12px;
			padding-bottom: 70px;
		}
	/*	.write-wrap dd.text textarea {
			margin : 0 0  0 2px;
			width: 97.3%;
			padding: 9px 0 0 11px;
			border : 0px;
			color: #666;
			line-height: 1.2;
			resize: none;
		}*/
		.text {
			width:635px;  
			height:100px;      
			resize:none;
		}
		.ec-base-button {
			margin: 9px 0 51px;
		}
		.ec-base-button .gLeft {
			float: left;
			text-align: left;
		}
		[class^='btn'][class*='Fix'].sizeS {
			width: 100px;
		}
		.ec-base-button .gRight {
			float: right;
			text-align: right;
		}
		[class^='btnNormal'], a[class^='btnNormal'] {
			display: inline-block;
			box-sizing: border-box;
			border : 1px solid; #d1d1d1;
			background-color: #white;

		}
		.ec-base-button span a {
			border: 1px solid #e7e7e7;
			border-bottom-color: #d7d7d7;
		}
		.commentBox {
			clear:both;
			padding: 0;
		}
		.linebg {
			background-color: #e9e9e9;
		}
		.admin_boxT {
			position: relative;
			width: 100%;
			height: 1px;
			font-size: 1px!important;
			line-height: 1px;
			overflow: hidden;
			clear: both;
			opacity: .6;
			z-index: -1;
		}
		.bg_sub {
			background-color: #f7f7f7;
		}
		.commentDiv {
			padding : 15px 18px 12px;
			clear: both;
		}
		.commentPagingDiv {
			display: inline;
		}
		.comment_pos:first-child {
			margin-top: -13px;
		}
		.comment_pos {
			position: relative;
			z-index: 1;
			padding: 13px 0;
			clear: both;
		}
		.commentBox .id_admin {
			top: 13px;
			left: 0;
		}
		.commentBpx .comment_date {
			padding-left: 6px;
		}
		.comment_contents {
			display: block;
			line-height: 1.4;
		}
		.txt_btn {
			position: absolute;
			top: 15px;
			right: 10px;
			font-size: 12px;
		}
		.c1 {
			clear: both;
			line-height: 100%;
			font-size: 1px;
			height: 0;
			overflow: hidden;
		}
		.recomment_pos {
			position: relative;
			z-index: 1;
			padding: 22px 0 27px;
			clear: both;
		}
		.commentBox .id_admin {
			top: 13px;
			left: 0;
		}
		.re_icon {
			padding: 0 0 0 1px;
		}
		.comment_date {
			padding-left: 6px;
		}
		.comment_contents {
			display: block;
			line-height: 1.4;
		}
		.b {
			font-weight: bold;
		}
		.comment span {
			font-size: 14px;
		}
		.recomment span {
			font-size: 14px;
			padding-left: 20px
		}
		.longtail_editor {
			clear: both;
			zoom : 1;
			position: relative;
			z-index: 15;
		}
		.longtail_comment_wrap {
			position: relative;
			zoom : 1;
			padding: 5px;
			margin: 0;
		}
		.lontail_reply .preview_area {
			top: 5px;
		}
		td.longtail_editor_btn {
			padding-top: 2px;
			vertical-align: top;
		}
		.btn span {
			cursor: pointer;
			margin: 0 1px;
			padding : 9px 10px;
			text-align: center;
			border : 1px solid #d7d7d7;
			border-radius: 10px;
		}
		.fas {
			font-size: 12px;
		}
		.btnNormalFix {
			padding: 9px 10px;
			margin: 0 1px;
			cursor: pointer;
			text-align: center;
   			border-radius: 10px;
		}
		.textarea {
			width: 500px;
			height: 100px;
			resize: none;
		}

	

	</style>
</head>
<body>
<%@ include file="../include/modal.jsp" %>
	<div id="content">
		<div class="contents-inner cs-page">
			<div class="section">
				<form method="post" name="frmView" id="frmView" action="board_ps.php">
					<input type="hidden" name="bdId" value="goodsreview">
					<input type="hidden" name="mode" value>
					<input type="hidden" name="sno" value = "27454">
				</form>
				<div class="section-header">
					<h2 class="h2">자유게시판</h2>
					<div class="option type1"></div>
				</div>
				<div class="section-body">
					<div class="board-view">
						<div class="board-view-head">
							<div class="board-view-title">
								<h2>${one.title}</h2>
							</div>
							<div class="board-view-info">
								<div class="author">
									<span class="text1">
										<strong>${one.writer}</strong>
									</span>
									</span>
									<span class="divide-bar">&nbsp;</span>
									<span class="text2" pattern="yyyy-MM-dd HH:mm:ss">${one.updatedate}</span>
									<i class="fas fa-heart"></i>
								</div>
								<div class="value">
									<span class="text4">
										<strong>조회수</strong>
										${one.viewcnt}
									</span>
								</div>

							</div>
						</div>
						<div class="board-view-body">
							<div class="textfield">
								<br>
								<p class="word">
									테스트 페이지
								</p>
							</div>
						</div>
						<div class="ec-base-button">
							<span class="gLeft">
								<a href="${header.referer}" class="btnNormalFix sizeS" >목록</a>
								<a href="#" class="btnNormalFix sizeS">답변</a>
							</span>
							<c:if test="${name == one.writer}">
								<span class="gRight">
									<a href="#" class="btnNormalFix sizeS">수정</a>
									<a href="#" class="btnNormalFix sizeS" id="drop_yes">삭제</a>
								</span>
							</c:if>
						</div>

					<!-- 댓글창 -->
					<div id="listReply"></div>
					</div>
				
				</div>
				
			</div>
		</div>
	</div>

</body>
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	// 문서가 완료되면 시작 listReply 호출
	$(function(){
		
		listReply();
		//alert('이전 URL: ${header.referer}');
		
		// 삭제버튼 클릭시 모달창 open
		$('#drop_yes').click(function(){
			$('.dt_popup1').css('display', 'flex');
		});
		// 삭제 알림 모달창에서 확인버튼 click => 게시글 삭제
		$('#modal_msg_yes').click(function(){
			// alert("text");
			location.href= '${path}/board/delete?bno=${one.bno}';
			
		});			

	});
	
	// 댓글 목록 출력 함수 replycontroller
	function listReply() {
		$.ajax({
			type:"get",
			url:"${path}/reply/list?bno=${one.bno}",
			success:function(result) {
				// result : responseText 응답텍스트 (html)
				$("#listReply").html(result);
			}
		});
	}
</script>