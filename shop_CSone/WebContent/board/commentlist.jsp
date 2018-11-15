<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* BOTTOM */
.bt_all {
	padding: 0 30px;
}
#boardr_bt {
	margin: 0 auto;
	padding: 50px 30px;
	text-align: center;
	border: 1px solid red;
	max-width: 1000px;
}

/* reply */
.reply_no{
	width: 800px;
    margin: 0 30px;
}
#no_input{
	width: 800px;
	height: 50px;
	border: 1px solid burlywood;
    background-color: bisque;
    border-radius: 5px;
}
.reply_RD{
	margin: 0;
 	float: left;
 	display: inline-block;
}
.reply_on {
	text-align: center;
}
.replyYes {
	border: 1px solid;
    width: -webkit-fill-available;
    text-align: center;
}
.replyYes > p {
	font-size: 15px;
	float: left;
}
.Num_cl {
	font-size: 15px;
	color: #6CC3D5;
}
/* #replyYes_btn > button{
	margin: 0 auto;
	width: 50px;
	height: 30px;
	border: 1px solid black;
	float: right;
	
}
#replyYes_btn > button:nth-child(1){
	background-color: #6CC3D5;
    border-color: #6CC3D5;
}
#replyYes_btn > button:nth-child(2){
	background-color: #5eb69d;
    border-color: #55b298;
} */
.RD_one {
	padding: 10px 30px;
	margin: 0;
	float: left;
	display: inline-block;
	text-align: center;
	border: 1px solid red;
}
.RD_one > p {
	text-align: left;
	font-size: 15px;
	height: 20px;
    margin: 0;
}
.sp_cl {
	color: #56CC9D; 
	font-size: 12px;
}
.line{
	color: #F3969A;
	text-align: center;
    font-weight: bold;
}
.file_a> a {
	color: #F3969A;
	text-decoration: none;
}
.RD_one > input {
	width: 800px;
	height: 50px;
	display: inline-block;
	float: right;
}
.RD_one >p > button {
	width: 50px;
	height: 30px;
	border: 1px solid black;
	float: right;
}
.RD_one >p> button:nth-child(3){
	background-color: #ffc241;
    border-color: #ffbe34;
}
.RD_one >p> button:nth-child(4){
	background-color: #FF7851;
    border-color: #FF7851;
}

/* reply입력 */
#reply_write{
	margin: 0 60px;
	padding: 20px 30px;
	text-align: center;
	border: 1px solid red;
	max-width: 1000px;
	float: left;
}
#user_login {
	padding: 0;
	margin: 0;
}
#user_name {
	text-align: left;
}
#user_login > input {
	width: 700px;
	height: 100px;
	display: inline-block;
	float: left;
}
#user_login > button {
	width: 100px;
	height: 100px;
	border: 1px solid #F7AA97;
	background-color: #F7AA97;
	display: inline-block;
	float: right;
}


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
				<c:if test="${replyList.size()==0}">
					<div class="reply_no">
					<input type="text" readonly="readonly" placeholder="등록된 댓글이 없습니다. 첫번째 댓글을 남겨주세요" id="no_input">
					</div>
				</c:if>
				<div><p>댓글<span class="line"> | </span><span class="Num_cl">${replyList.size()}</span></p></div>
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
					</c:choose>	</span><c:if test="${sessionScope.loginUser.id==replyview.writer}"><button class="update" data_bno ="${replyview.bno}"" data_num="${replyview.rno}">수정</button><button class="delete" data_num="${replyview.rno}">삭제</button></c:if></p>
					<textarea rows="" cols="" style="resize: none;width: 800px;height: 50px" readonly="readonly">${replyview.content}</textarea>
					</div>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>	
		</div>
	
	
</body>
</html>