<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	<script src="https://kit.fontawesome.com/83b564820d.js" crossorigin="anonymous"></script>
	<style type="text/css">
		em,a {font-style: normal; font-style: none;}
		a:link { color: red; text-decoration: none; }
		a:visited { color: black; text-decoration: none;}
 		a:hover { color: black; text-decoration: underline;}
 		a:link, a:visited {
 			color: #444444;
 		}
		#container {
			margin: 0 auto;
			width: 812px;
			padding: 0 0 30px;
			vertical-align: top;
		}

		.tit-board {
			min-height: 30px;
			margin: 0 0 15px;
		}
		.tit-board h2 {
			display: inline-block;
			font-size: 16px;
			color: #2e2e2e;
			font-weight: bold;
		}
		.tit-board p.info {
			margin: 17px 0 0;
			color: #939393;
			font-size: 12px;
		}
		.boardWrite table {
			table-layout: fixed;
			border-top: 1px solid #e7e7e7;
			border-bottom: 1px solid #e7e7e7;
			line-height: 180%;
		}
		table {
			width: 100%;
			border: 0;
			border-spacing: 0;
			border-collapse: collapse;
		}
		tbody {
			display: table-row-group;
			vertical-align: middle;
			border-color: inherit;
		}
		tr {
			display: table-row;
			vertical-align: inherit;
			border-color: inherit;
		}
		table th {
			width: 85px;
			padding : 8px 0 8px 0;
			background-color: #fff;
			text-align: left;
			font-weight: left;
			font-weight: normal;
			vertical-align: middle;
			letter-spacing: 1px;
			text-align: center;
		}
		table td {
			font-size: 16px;
			padding-left : 6px;
		}
		table input#subject {
			width: 723px;
			height: 27px;
			padding: 3px;
		}
		.ec-base-button {
			margin: 35px 8px 76px;
		}
		.ec-base-button .gLeft {
			float: left;
			text-align: center;
		}
		[class^='btn'][class*='Fix'].sizeS {
			width: 100px;
		}
		.ec-base-button .gRight {
			float: right;
			text-align: center;
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
		.btnNormalFix {
			padding: 9px 10px;
			margin: 0 1px;
			cursor: pointer;
			text-align: center;
			border-radius: 10px;
		}
		.board_div {
			font-size: 15px;
			text-align: center;
			width: 723px;
			height: 105px;
			border :2px dashed #939393;
		}
		.board_div > p {
			margin-top : 41px;
			margin-bottom : 41px;
		}
		.a {
			transform: translate( 1%, 193% );
		}
		.board_type {
			width: 723px;
			height: 27px;
		}
		.error_next_box {
			display: none;
			margin: 5px 0 -2px;
			font-size: 12px;
			line-height: 14px;
			color: #d95339;
			height: 15px;
			
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
	<div id="container">
		<div id="contens">
			<div class="tit-board">
				<h2>
					<font color="#555555">게시글 등록</font>
				</h2>
				<p class="info"></p>
			</div>
			<form:form id="frm_board">
				<div class="boardWriter">
					<table width="100%" border="1">
						<tbody>
							<tr class="first">
								<th scope="row" class="thead txtLess">작성자 </th>
								<td>${name}</td>
								<input type="hidden" value ="${name}" name="writer">
							</tr>
	
							<tr class="first">
								<th scope="row" id="board_title" class="thead txtLess">제목 </th>
								<td>
									<input type="text" name="title" id="subject" value="${one.title}">
									<div class="error_next_box">제목을 입력해주세요.</div>
								</td>
							</tr>
	
							<tr class="first">
								<th scope="row" class="thead txtLess">종류 </th>
								<td>
									<select id="subject" name ="type" class="board_type">
										<option value="free">자유게시판</option>
										<option value="qna">Q&N게시판</option>
										<option value="review">REVIEW</option>
									</select>
								</td>
							</tr>
							
							<!-- 게시글 내용 등록(스마트에디터) -->
							<tr class="first">
								<th scope="row" class="thead txtLess">
									<div style="transform: translate( -1%, -1134% );">내용 </div>
								</th>
								<td>
									<script type="text/javascript" src="${path}/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
									<textarea name="view_content" id="board_content" rows="10" cols="100" style="height: 500px;">${one.view_content}</textarea>
								</td>
							</tr>
	
							<tr class="first">
								<th scope="row" class="thead txtLess">
									<div style="transform: translate( 0%, -165% );">첨부파일 </div>
								</th>
								<td>
									<!-- 게시글 첨부파일 등록 -->
									<div class = "input_wrap form-group">
										<div class="board_div fileDrop">
											<p><i class="fas fa-paperclip"></i>첨부파일을 드래그 해주세요.
										</div>
										<ul class="mailbox-attachments clearfix uploadedList"></ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="ec-base-button">
						<span class="gLeft">
							<button type="button" class="btnNormalFix cancel_btn" style="width:100px;">취소</button>
						</span>
						<span class="gRight">
							<button type="button" class="btnNormalFix insert_btn" style="width: 100px;">등록</button>
						</span>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
<script src="${path}/resources/js/validation.js"></script>
<script type="text/javascript">
	var flag = "${flag}";
	console.log('flag: '+ flag);
	
	//Handlebars 파일템플릿 컴파일
	var fileTemplate = Handlebars.compile($("#fileTemplate").html());
	
	$(function(){
		
		// register => 게시글 등록과 게시글 수정
		// ${one}에 값이 있으면 수정페이지 로딩! dto 객체
		if(flag == 'update') {
			//alert('데이터:' +  ${one});	
			// 수정페이지로 디자인 변경
			$('.tit-board > h2 > font').text('게시글 수정');
			$('.insert_btn').text('수정');
			
			// selectBox 값으로 selected
			$('.board_type').val('${one.type}').attr('selected','selected');
			
		} else if(flag == 'answer') {
			$('.tit-board > h2 > font').text('게시글 답글');
			$('.insert_btn').text('답글');
			$('.board_type').val('${one.type}')
						   .attr('selected','selected')
						   .attr('onFocus', 'this.initialSelect = this.selectedIndex')
						   .attr('onChange', 'this.selectedIndex = this.initialSelect');
			$('#subject').val('RE:'+'${one.title}')
							 .attr('readonly', 'readonly');
		}
		
		// 1. 웹브라우저에 drag&drop시 파일이 열리는 문제(기본 효과) %%%첨부파일%%%
		//  : 기본효과를 막음
		$('.fileDrop').on('dragenter dragover', function(e){
			e.preventDefault();
		});
		
		// 2. 사용자가 파일을 drop했을 때
		$('.fileDrop').on('drop', function(e){
			e.preventDefault();
			
			var files=e.originalEvent.dataTransfer.files; // 드래그에 전달된
			var file=files[0]; // 그중 하나만 꺼내옴
			
			var formData = new FormData(); // 폼 객체 생성
			formData.append('file', file); // 폼에 파일 1개 추가!
			
			// 서버에 파일 업로드
			// ajax는 쿼리스트링=> 길이제한
			$.ajax({
				url: '${path}/upload/uploadAjax',
				data: formData,
				datatype: "text",
				processData: false, // 쿼리스트링 방식 생성x
				contentType: false, // 서버단으로 전송하는 데이터 타입(multipart) 
				type: 'POST',
				success: function(data) {
					console.log(data);
					// data: 업로드한 파일 정보와 http 상태 코드
					printFiles(data, '${path}'); // 첨부파일 출력 메서드 호출
				}
			});
		});
		
		$('.uploadedList').on('click', '.delBtn', function(event){
			var bno = '${one.bno}';
			var that = $(this);
			// 게시글 등록
			if(bno == '') {
				$.ajax({
					url:'${path}/upload/deleteFile',
					type:'POST',
					data:{fileName : $(this).attr('data-src')},
					success:function(data) { // success:data ='deleted'
						if(data == 'deleted') { // parents li 내 조상중에 li를 찾음
							that.parents('li').remove(); // remove() display:none이랑 똑같다.
						
						}
					}, error:function() {
						alert('System Error!!!!');
					}
				});
				
			} else { // 게시글 수정
				
			}
		});
		
	});
	
	$(document).on('click', '.cancel_btn', function(){
		var referer = '${header.referer}';
		console.log('이전 URL: ' + referer)
		
		var index = referer.indexOf('/board/list');
		console.log('index:' + referer.indexOf('/board/list'))
		
		if(index == '-1') {
			location.href ='${path}/board/list'		
		} else {
			location.href ='${header.referer}'
		}
		
	});
	
	$(document).on('click', '.insert_btn', function(){
		
		// 유효성 체크(제목)
		var title = $('#subject').val();
		
		if(title == '' || title.legnth == 0) {
			// 에러메시지 '제목을 입력해주세요.'
			$('.error_next_box').css('display','block');
			return false;
		} else {
			
			// 에디터의 내용이 textarea에 적용된다. 스마트에디터의 값을 #board_content에 입력
 			oEditors.getById["board_content"].exec("UPDATE_CONTENTS_FIELD", []);
			
			var view_content = $('#board_content').val();
			
			// 정규식을 통해 HTML 태그를 제거 후 순수 Text만 추출
			var search_content = view_content.replace(/(<([^>]+)>)/ig,"").replace("&nbsp;","");
			
			// append 평상시엔 없다가 게시글 등록버튼을 눌렀을때 맨 마지막에 추가해준다. 
			$('#frm_board').append('<textarea id="search_content" name ="search_content"></textarea>');
			$('#search_content').val(search_content); // 순수 content
			
			// 첨부파일 목록[배열]도 추가
			var str ='';
			// uploadedList 내부의 .file 태그 각각 반복
			// uploadedList에 클래스가 file인것
			// i = 인덱스값
			$(".uploadedList .file").each(function(i){
				console.log(i);
				// hidden 태그 구성
				// 첨부파일 갯수만큼 반복해라
				str += "<input type='hidden' name= 'files["+i+"]' value='" + $(this).val() + "'>";
			});
			
			// 로컬드라이브에 저장되어있는 해당 게시글
			// 첨부파일 삭제
			//if(deleteFileList.length > 0) {
			//	$.post('${path}/upload/deleteAllFile', {files:deleteFileList}, function(){});
			//}
			
			//폼에 hidden 태그들을 붙임
			// .append 등록을 하는데 맨 마지막에 등록한다 
			// 로컬드라이브(실제 파일) db(파일이름)
			$("#frm_board").append(str);
			
			// 서버로 전송
			$('#frm_board').submit();
			
		}
		
		
	});
	
	$(document).on('keyup','#subject', function(){
		var len = $(this).length;
		
		if(len != 0) {
			$('.error_next_box').css('display','none');
		}
	});
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
 		oAppRef: oEditors,
 		elPlaceHolder: "board_content",
 		sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
 		fCreator: "createSEditor2"
	});
</script>

</html>