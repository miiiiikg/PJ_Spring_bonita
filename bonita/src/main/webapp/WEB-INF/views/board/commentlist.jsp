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
						<strong>댓글 ${list.size()}</strong>
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
									<span class="comment_date txt_sub p11 ls0">${reply.regdate}</span>
									<i class="fas fa-heart"></i>
								</div>
									<div class="comment" style="display: block;">
										<span class="comment-contents">${reply.content}</span>
									</div>
									<div class="txt_btn p11">
											<a href="#">신고</a>
									</div>
									<div class="c1">&nbsp;</div>
									<div class="comment_item_list  recomment_pos recomment_first">
										<div class="id_admin">
											<span class="re_icon">
												<span>┗</span>
													<a href="#" class="b">사과</a>
											</span>
												<span class="comment_date txt_sub p11 ls0">08:03</span>
												<i class="fas fa-heart"></i>
										</div>
											<div class="recomment" style="display:block;">
												<span class="comment-contents">대댓글대댓글</span>
											</div>
											<div class="txt_btn p11">
												<a href="#">신고</a>
											</div>
											<div class="c1">&nbsp;</div>
										</div>
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
											<table>
												<tbody>
													<tr>
													<c:choose>
														<c:when test="${empty userid}">
															<td class="longtail_comment inp">
															<div class = "login_re">
																<span class="reply_login_btn">로그인</span>을 하셔야 댓글 등록이 됩니다. 
															</div>
														</c:when>
														<c:otherwise>
															<div class="longtail_comment_wrap">
																<textarea class="inp scroll txt_sub" name=comment_view rows="3" cols="56" style ="resize:none; width: 572px; height: 60px;" ></textarea>
															</div>
														</td>
														<td class="longtail_editor_btn">
															<a href="#" class="btn submit_content opacity">
																<a href="#" class="btnNormalFix sizeS">등록</a>
															</a>
														</td>
														</c:otherwise>	
													</c:choose>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>

</body>
</html>