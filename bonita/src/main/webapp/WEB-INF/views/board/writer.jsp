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
					printFiles(data); // 첨부파일 출력 메서드 호출
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
	
	//파일 정보 처리
	function getFileInfo(fullName) { // 2020..... 이거
		var originalFileName;   // 화면에 출력할 파일명
		var imgSrc;             //썸네일 of 파일아이콘 이미지 파일
		var originalFileUrl;    //원본파일 요청 URL
		var uuidFileName;       //날짜경로를 제외한 나머지 파일명
		var basicFileName = fullName; //삭제시 값을 전달하기 위한

	//이미지 파일이면
	if(checkImageType(fullName)){
		imgSrc = "${path}/upload/displayFile?fileName=" + fullName; // 썸네일 이미지 링크
		uuidFileName=fullName.substr(14); // 순수이미지 이름만 남음 s_까지 잘림
		var originalImg = fullName.substr(0, 12) + fullName.substr(14); // 0은포함 12는 미포함. //원본이미지
		//원본 이미지 요청 링크
		originalFileUrl = "${path}/upload/displayFile?fileName=" + originalImg;
	}else{
		imgSrc = "${path}/resources/img/file-icon.png";//파일 아이콘 이미지 링크
		uuidFileName = fullName.substr(12);
		//파일 다운로두 요청 링크
		originalFileUrl = "${path}/upload/displayFile?fileName=" + fullName;
	}
	originalFileName=uuidFileName.substr(uuidFileName.indexOf("_")+1);
		//파일이름 안나오면 여기 체크하기
	
		//전체 파일명의 크기가 14보다 작으면 그대로 이름 출력, 14보다 크면 실행
		if(originalFileName.length > 14) {
		//앞에서부터 11글자 자름
		var shortName = originalFileName.substr(0,10);
		//.을 기준으로 배열 생성
		var formatVal = originalFileName.split(".");
		//formatVal = originalFileName.substr(originalFileName.length-3)
		//파일명에 .이 여러개 들어가 있을수도 있음
		// 배열크기를 구해와서 무조건 맨 마지막 확장자부분 출력되게 함
		var arrNum = formatVal.length -1;
		//맨 처음 문자열 10글자 + ... + 확장자
		originalFileName = shortName + "..." + formatVal[arrNum];
		}
		return {originalFileName: originalFileName, imgSrc: imgSrc, originalFileUrl: originalFileUrl, fullName: fullName, basicFileName: basicFileName}
		
	}



		//첨부파일 출력
		function printFiles(data) {
		//파일 정보 처리
		var fileInfo = getFileInfo(data);
		console.log(fileInfo);
		//Handlebars 파일 템플릿에 파일 정보들을 바인딩하고 HTML생성
		var html  = fileTemplate(fileInfo);
		html += "<input type='hidden' class='file' value='" + fileInfo.fullName+"'>";
		//Handlebars 파일 템플릿 컴파일을 통해 생성된 HTML을 DOM에 주입
		$(".uploadedList").append(html);
		//이미지 파일인 경우 aaaaaaaaaaaaaaaa파일 템플릿에 lightbox속성 추가
		if(fileInfo.fullName.substr(12,2) === "s_"){
		//마지막에 추가된 첨부파일 템플릿 선택자
		var that = $(".uploadedList li").last();
		//lightbox속성추가
		that.find(".mailbox-attachment-name").attr("data-lightbox", "uploadImages");
		//파일 아이콘에서 이미지 아이콘으로 변경
		that.find(".fa-paperclip").attr("class", "fa fa-camera");
		}
	}

	function getOriginalName(fileName){
		if(checkImageType(fileName)) { //이미지 파일이면 skip
			return;
		}
		var idx=fileName.indexOf("_")+1; // uuid를 제외한 파일이름
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName){
		if(!checkImageType(fileName)){ // 이미지 파일이 아니면 skip
			return;
		}
		var front=fileName.substr(0,12); // 연월일 경로
		var end=fileName.substr(14); //s_ 제거
		return front+end;
	}
	
	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i; // 정규표현식(대소문자 무시)
		return fileName.match(pattern); //규칙에 맞으면 true //파일 이름 비교해서 pattern이 있는지 확인하는거
	}

	//첨부파일 리스트를 출력하는 함수
	function listAttach(){
		var listCnt = 0;
		$.ajax({
			type : "post",
			url : "${path}/board/getAttach/${one.bno}",
			async: false,
			success : function(list){
			//list : json
			//console.log(list);
			listCnt = list.length;

			/*console.log(list.length);*/
			/*
			jQuery each()는 반복문
			i와 e는 index와 element로
			json에서 {0: "apple.png"}일 때
			index는 0, element는 apple.png가 됨
			*/
		$(list).each(function(i,e){
		/*console.log(list)*/
			printFiles(e); // 첨부파일 출력 메서드 호출

			});
		}
	});
		return listCnt;
	}
	
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