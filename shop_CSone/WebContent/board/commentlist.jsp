<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">


</style>
<script type="text/javascript">

 
</script>
<title>Insert title here</title>
</head>
<body>
	<!-- 댓글 -->
	<!-- 댓글달기 -->
	<div id="boardr_bt">
		<div class="bt_all">
		<div class="reply_all"> 
			<!-- 댓글이 있을때 -->

			<div class="reply_RD">
				<!-- 수정 -->
				<div><p>댓글<span class="line"> | </span><span class="Num_cl">${replyList.size()}</span></p></div>
				<c:if test="${replyList.size()==0}">
					<div class="reply_no">
					<input type="text" readonly="readonly" placeholder="등록된 댓글이 없습니다. 첫번째 댓글을 남겨주세요" id="no_input">
					</div>
				</c:if>
				<c:forEach items="${replyList}" var="replyview">
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
				<fmt:formatDate value="${replyview.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
				<div class="reply_on"><div class="replyYes"><p>댓글<span class="line"> | </span><span class="Num_cl">${replyview.rno}</span></p><!-- <div id="replyYes_btn"><button>목록</button><button>쓰기</button></div> --></div>
					<div class="RD_one"><p>${replyview.writer}<span class="line"> | </span><span class="sp_cl"><c:choose>
						<c:when test="${today2 == regdate2}">
							<fmt:formatDate pattern="HH:mm:ss" value="${replyview.regdate}"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${replyview.regdate}"/>
						</c:otherwise>
					</c:choose>	</span><c:if test="${sessionScope.loginUser.id==replyview.writer}"><%-- <button class="update" data_rno="${replyview.rno}">수정</button> --%><button class="delete" data_num="${replyview.rno}">삭제</button>
					<!-- 삭제 모달창 -->
					<div id="modal_all_redel">
		  			 <div id="modal_in_redel">
						<div id="modal_up_redel"><span id="draw_redel">게시글삭제</span><span id="close_btn_redel"><i class="fa fa-close"></i></span></div>
						<div id="modal_text_redel"><h3>다음<span>댓글</span>을 삭제하시겠습니까?</h3></div>
						<div id="yesno_btn_redel">
					<div><a href="#" id="no_btn_redel">아니오</a></div><div><a href="#" id="yes_btn_redel">네</a></div>
					</div>
		   			</div>
					</div>
					
					</c:if></p>
					<textarea rows="" cols="" style="resize: none;width: 800px;height: 50px" readonly="readonly">${replyview.content}</textarea>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>	
		</div>
	
	<c:choose>
		 <c:when test="${empty sessionScope.loginUser}">
			<!-- 로그인 NO -->
			<div id="no_login">
				<div id="NOOO"><span>회원에게만 댓글작성의 권한이 있습니다.</span></div>
			</div>
		 </c:when>
		 <c:otherwise>
			<div id="reply_write">
			<!-- 로그인시 -->
			<form action="" method="post" id="reply_fmt" name="reply_fmt">
			<div id="user_login">
				<div id="user_name"><input value="${sessionScope.loginUser.id}" id="reply_writer" name="reply_writer" readonly="readonly"></div>
				<input type="text" placeholder="댓글을 입력하세요. 비방, 욕설등은 허용하지 않습니다. " name="reply_text" id="reply_text">
				<button id="reply_btn">댓글 등록</button>
			</div>
				<span id=err_content>내용을 입력해주세요.</span>
				<input type="hidden" name="re_bno" id="re_bno">
			</form>
			</div>
		 </c:otherwise>			
		</c:choose>	
</body>
</html>