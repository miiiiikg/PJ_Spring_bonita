<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
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
		.fileDrag {
			font-size: 15px;
			text-align: center;
			width: 723px;
			height: 105px;
			border :2px dashed #939393;
		}
		.a {
			transform: translate( 1%, 193% );
		}
		.board_div {
			width: 723px;
			height: 27px;
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
			<form:form id="frm_board" >
				<div class="boardWriter">
					<table width="100%" border="1">
						<tbody>
							<tr class="first">
								<th scope="row" class="thead txtLess">작성자 </th>
								<td>${name}</td>
								<input type="hidden" value ="${name}" name="writer">
							</tr>
	
							<tr class="first">
								<th scope="row" name ="title" class="thead txtLess">제목 </th>
								<td>
									<input type="text" name="subject" id="subject" maxlength="125">
								</td>
							</tr>
	
							<tr class="first">
								<th scope="row" class="thead txtLess">종류 </th>
								<td>
									<select id="subject"  name ="type" class="board_div">
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
									<textarea name="content" id="board_content" rows="10" cols="100" style="height: 500px;"></textarea>
								</td>
							</tr>
	
							<tr class="first">
								<th scope="row" class="thead txtLess">
								
								
									<div style="transform: translate( 0%, -165% );">첨부파일 </div>
								</th>
								<td>
									<div class="table_f">
										<div id ="fileDragDesc" class="fileDrag">
											<div class= "a">
												<i class="fas fa-paperclip"></i>첨부파일을 드래그 해주세요.
											</div>
										</div>
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
							<button type="button" class="btnNormalFix sizeS">등록</button>
						</span>
					</div>
				</div>
			</form:form>
		</div>
	</div>
<script type="text/javascript">
	$(function(){
		
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
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
 		oAppRef: oEditors,
 		elPlaceHolder: "board_content",
 		sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
 		fCreator: "createSEditor2"
		});
</script>
</body>
</html>