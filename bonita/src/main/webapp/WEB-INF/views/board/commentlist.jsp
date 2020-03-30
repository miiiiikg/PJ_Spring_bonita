<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board-view-comment" style="padding-top: 20px;">
		<div class="comment-wrap js-comment-area" data-bdid="goodsreview" data-sno="27448">
			<div class="head">
				<div class="comment-count">	
					<span>
						<input type="hidden" class="replyListCnt" value ="${list.size()}">
						<strong>댓글 ${list.size()}</strong>
						<i class="fas fa-sync-alt" id="reply_refresh_btn">새로운 댓글 확인</i>
						<span class="nobr" style="padding-top: 20px;"></span>
					</span>
					<br>
					<span class="rating-b">
						<span style="width: 80%;">&nbsp;</span>
					</span>
				</div>
				<div class="commentBox">
					<div class="admin_boxT linebg">&nbsp;</div>
						<div class="commentDiv bg_sub">
							<div class="comment_item_list  comment_pos">
								<c:forEach items="${list}" var="reply">
								<div class="id_admin">
									<span>
										<a href="#" class="b">${reply.writer}</a>
									</span>
									<c:if test="${name == reply.writer}">
										<button type ="button" class="commentno" data_num="${reply.rno}">삭제</button>
									</c:if>
										<span class="comment_date txt_sub p11 ls0">${reply.regdate}</span>
										<i class="fas fa-heart"></i>
										
									</div>
									<div class="comment" style="display: block; margin: 8px 1px 20px 1px;">
										<span class="comment-contents">${reply.content}</span>
									</div>
									<div class="txt_btn p11">
										<a href="#">신고</a>
									</div>
									<div class="c1">&nbsp;</div>
								</c:forEach>
									<c:if test="${list.size() == 0 }">
									
										<div class="id_admin">
											<span>
												<a href="#" class="b">관리자</a>
											</span>
												<span class="comment_date txt_sub p11 ls0" value ="${now}" pattern="yyyy-MM-dd"></span>
													
												</div>
												<div class="comment" style="display: block;">
													<span class="comment-contents">등록된 게시글이 없습니다 :(</span>
												</div>
												
												<div class="c1">&nbsp;</div>
									</c:if>
								</div>
									<div class="longtail_editor longtail_reply">
										<div class="longtail_editor_layout">
											<c:choose>
												<c:when test="${empty userid}">
													<div class = "login_re">
														<span class="reply_login_btn">로그인</span>을 하셔야 댓글 등록이 됩니다. 
													</div>
													</c:when>
												<c:otherwise>
													<form class="frm_reply">
														<input type="hidden" name="bno" class="reply_bno">
														<input type="hidden" name="type" class="reply_type">
														<input type="hidden" name="writer" class="reply_writer">
														<div class="longtail_comment_wrap">
															<textarea class="inp scroll txt_sub" name="content" rows="3" cols="56" style ="resize:none; width: 700px; height: 60px;" ></textarea>
														</div>
															<button type="button" class="texton">등록</button>
															<span class="error_next_box" >글을 입력해주세요.</span>
													</form>
												</c:otherwise>	
											</c:choose>
										</div>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>

</body>
</html>