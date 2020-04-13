<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
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
			padding-left: 12px;
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
		.login_re {
			background-color : white;
			border : 1px solid #bbb;
			padding : 13px 23px 15px 19px;
		}
		.reply_login_btn {
			color : #4FB0C6;
		}
		.error_next_box {
			margin-left : 12px;
			color : red;
			font-size : 14px;
			visibility: hidden;
		}
		.texton {
			padding: 9px 10px;
			margin: 0 1px;
			cursor: pointer;
			text-align: center;
   			border-radius: 10px;
   			background-color : white;
			border : 1px solid #bbb;
			padding : 9px 33px 9px 33px;
   		}
   		.commentno {
   			border : 1px solid #ddd;
   			background-color : white;
   			padding : 1px 1px 1px 1px;
   		}
   		.textfield {
   			padding : 20px 0 20px 7px;
   		}
   		.updatedate {
   			text-decoration: underline;
   		}
   		.uploadedList {
			display: flex;
		}
		.uploadedList > li {
			margin-left : 20px
		}

	

	</style>
</head>
<body>
<%@ include file="../include/modal.jsp" %>
	<div id="content">
		<div class="contents-inner cs-page">
			<div class="section">

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
									<span class="divide-bar">&nbsp;</span>
		
									<span class="regdate"><fmt:formatDate value="${one.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/> 작성 </span>
									<c:if test="${one.regdate != one.updatedate}">
										<span class ="updatedate"><fmt:formatDate value="${one.updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/> 수정</span>
									</c:if>
								</div>
								<div class="value">
									<span class="text4">
										댓글수
										<strong>${one.replycnt}</strong>
									</span>
									<span class="text3">
										조회수
										<strong>${one.viewcnt}</strong>
									</span>
								</div>

							</div>
						</div>
						<div class="board-view-body">
							<div class="textfield">
								<br>
								${one.view_content}
								<br>
								<ul class = "mailbox-attachments clearfix uploadedList"></ul>
							</div>
						</div>
						<div class="ec-base-button">
							<span class="gLeft">
								<a href="${header.referer}" class="btnNormalFix sizeS">목록</a>
								<a href="${path}/board/answer?bno=${one.bno}" class="btnNormalFix sizeS">답글</a>
							</span>
							<c:if test="${name == one.writer}">
								<span class="gRight">
									<a href="${path}/board/update?bno=${one.bno}" class="btnNormalFix sizeS">수정</a>
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
<script id="fileTemplate" type="text/x-handlebars-template">
	<li>
		<div class="mailbox-attachment-icon has-img">
			<center><img src="{{imgSrc}}" alt="Attachment" class="s_img"></center>
		</div>
		<div class="mailbox-attachment-info">
			<a href="{{originalFileUrl}}" class="mailbox-attachment-name">
				<i class="fa fa-paperclip"></i> {{originalFileName}}
			</a>
		<span class="btn btn-default btn-xs pull-right delBtn" data-src="{{basicFileName}}">
			<i class="fas fa-times"></i>
			</span>
		</div>
	</li>
</script>
<script src="${path}/resources/js/fileAttach.js"></script>
<script type="text/javascript">

	//Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());

	// 문서가 완료되면 시작 listReply 호출
	$(function(){
		// 첨부파일 목록 불러오기
		var listCnt = listAttach('${path}', '${one.bno}');
		
		// 첨부파일 0건일때 '첨부파일 없음' 출력
		console.log('File count : '+ listCnt);
		if(listCnt == 0) {
			var text = '<span class="no_attach">첨부파일이 없습니다.</span>';
			$('.uploadedList').html(text);
		}
		// 자바 내장함수
		setInterval(newReply, 180000);
		
		//alert('이전 URL: ${header.referer}');
		listReply();
		
		
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
	
	$(document).on('click', '.reply_login_btn', function(){
		$('.dt_popup').css('display', 'flex');
	});
	
	// 새로운 댓글 확인하기 버튼 클릭시
	$(document).on('click','#reply_refresh_btn', function(){
		// alert("text");
		listReply();
	});
	
	
	
	//문서에서 btnNormalFix 찾아서 버튼을 클릭하면 맨 위에 function에 넣으면 안된다.
	// 1. 사용자가 댓글을 입력하고 댓글등록버튼을 클릭
	$(document).on('click', '.texton',function(){
		// 2. reply_txt라고 변수에 사용자가 입력한 댓글내용을 작성
		var reply_txt = $('.inp').val();
		//alert(reply_txt);
		
		// 3. 조건문 사용자가 입력한 값이 ''이거나 길이가 0이면
		// 	널 값이기 때문에 댓글 입력부분으로 포커스를 이동하고 경고메시지를 출력하고 여기서 이벤트를 종료
		//	사용자가 입력한값이 있으면 실행하지 않고 통과
		if(reply_txt == '' || reply_txt.length == 0) {
			$('.inp').focus();
			$('.error_next_box').css('visibility', 'visible');
			return false;
		}
		
		$('.reply_bno').val('${one.bno}');
		$('.reply_type').val('${one.type}');
		$('.reply_writer').val('${name}');
		
		
		$.ajax({
			url : '${path}/reply/insert',
			type : "POST",
			// hashmap json이용방식 data = {"bno": bno, "type" : type, "writer" : writer, "content" : content}
			// keyvalue
			// qestring (쿼리스트링)이용방식 url = '${path}/reply/insert?bno='+bno '&type='+type+'&writer'= name + '&content'+content
			// serialize 직렬화 쿼리스트링을 자동으로 생성후 보냄 위에 방법은 보내는 값이 많을 경우 사용 input name값으로 서버단으로 받을수 있는것은 name밖에 없다.
			data : $('.frm_reply').serialize(),
			success : function() {
				listReply();
			},
			error : function() {
				alert('실패');
			}
			
			
		});
	});
	
	$(document).on('click', '.commentno', function(){
		var rno = $(this).attr('data-num');
		var bno = '${one.bno}';
		
		$.ajax({
			type:"POST",
			url:'${path}/reply/delete',
			data:{'rno': rno, 'bno': bno},
			success:function(){
				listReply();
			}
		});
	});
	
	// 댓글 목록 출력 함수 replycontroller
	function listReply() {
		$.ajax({
			type:"get",
			async : false,
			url:"${path}/reply/list?bno=${one.bno}",
			success:function(result) {
				// result : responseText 응답텍스트 (html)
				$("#listReply").html(result);
			}
		});
	}	
	function newReply() {
			listReply();
	}
		
	//$('.text4 > strong').text($('.replyListCnt').val());
</script>