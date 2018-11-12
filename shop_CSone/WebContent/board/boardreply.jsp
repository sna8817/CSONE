<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
#boardreply_body , #boardreply_body ul{
	padding: 0;
	margin: 0;
}
#boardreply_body *{
	font-family: 'Noto Sans KR', sans-serif;
}
#boardreply_body {
	padding-top: 200px;
}
#boardreply_body {
}

/* TOP */
#boardr_to {
	padding: 0;
	margin: 0 auto;
	padding: 10px 30px;
	text-align: center;
	border: 1px solid red;
	max-width: 1000px;
}
#boardr_to> h3 {
}





/* MIDDLE */
#table_div {
	display: block;
}
#boardr_md {
	margin: 0 auto;
	padding: 50px 30px;
	text-align: center;
	border: 1px solid red;
	max-width: 1000px;
}
#boardr_table {
	padding: 0;
	margin: 0;
 	border-collapse: collapse;
 	border-left: 1px solid white;
 	border-right: 1px solid white;
}
.lineno {
}
.bd_dl_btn {
	padding: 0;
	margin: 0;
	width: 100px;
	height: 30px;
	float: left;
	color: #fff;
    background-color: #F3969A;
    border: 1px solid #F3969A;
    border-radius: 0.4rem;
    font-size: 16px;
}
.bd_dl_btn:hover {
	color: #fff;
    background-color: #ef7479;
    border-color: #ee686e;
}
.bd_ex_btn {
	padding: 0;
	margin: 0;
	width: 100px;
	height: 30px;
	float: right;
	color: #fff;
    background-color: #56CC9D;
    border:1px solid #56CC9D;
    border-radius: 0.4rem;
    font-size: 16px;
}
.bd_ex_btn > a {
	color: #fff;
	text-decoration: none;
}	

.bd_ex_btn:hover {
	color: #fff;
    background-color: #3ac18c;
    border-color: #37b885;
}
.bd_up_btn {
	padding: 0;
	margin: 0;
	width: 100px;
	height: 30px;
	float: left;
	color: #fff;
    background-color: #FFCE67;
    border: 1px solid #FFCE67;
    border-radius: 0.4rem;
    font-size: 16px;
    
}
.bd_up_btn:hover {
	color: #fff;
    background-color: #ffc241;
    border-color: #ffbe34;
}






/* BOTTOM */
#bt_all {
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
#reply_RD{
	padding: 0 auto;
	margin: 0 auto;
 	float: left;
 	display: inline-block;
}
#reply_on {
	text-align: center;
}
#replyYes {
	border: 1px solid;
    width: -webkit-fill-available;
    text-align: center;
}
#replyYes > p {
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
#RD_one {
	padding: 20px 30px;
	margin: 0;
	float: left;
	display: inline-block;
	text-align: center;
	border: 1px solid red;
}
#RD_one > p {
	text-align: left;
	font-size: 15px;
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
.line > a {
	color: #F3969A;
}
#RD_one > input {
	width: 800px;
	height: 70px;
	display: inline-block;
	float: right;
}
#RD_one >p > button {
	width: 50px;
	height: 30px;
	border: 1px solid black;
	float: right;
}
#RD_one >p> button:nth-child(3){
	background-color: #ffc241;
    border-color: #ffbe34;
}
#RD_one >p> button:nth-child(4){
	background-color: #FF7851;
    border-color: #FF7851;
}

/* reply입력 */
#reply_write{
	margin: 0 auto;
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


/* 로그인 NO */
#no_login {
	margin: 0 auto;
	padding: 20px 30px;
	text-align: center;
	border: 1px solid red;
	max-width: 1000px;
	float: left;
}
#NOOO {
	width: 800px;
	height: 30px;
	background-color: #f1f1f1;
	border: 1px solid lightgray;
}
#NOOO > span {
	font-size: 14px;
	text-align: left;
}

</style>
<title>게시글</title>
</head>
<body id="boardreply_body">
	<!-- 게시판 -->
	<header id="boardr_to">
		<h3>Q&A</h3>
	</header>

	<article id="boardr_md">
	<div id="table_div">
		<table id="boardr_table" border="1px solid lightgray">
		 <thead style="border-right-color: lightgray;">
		 	<tr class="line">
		 		<th style="width: 100px"  class="line">no</th>
		 								<!-- el태그로 받기 -->
		 		<th style="width: 900px">${boardview.bno}</th>
		 	</tr>
		 	<tr class="line">
		 		<th style="width: 100px">subject</th>
		 		<th style="width: 900px">${boardview.title}   [${boardview.viewcnt}]</th>
		 	</tr>
		 	<tr class="line">
		 		<th style="width: 100px">writer</th>
				<th style="width: 900px">${boardview.writer}</th>
		 	</tr>
		 	<tr class="line">
		 		<th style="width: 100px">Date</th>
		 		<th style="width: 900px">
		 		<fmt:formatDate pattern="yyyy-MM-dd" value="${boardview.regdate}"/>
		 		</th>
		 	</tr>
		 </thead>
		 <tbody>
		 	<tr>
		 		<td></td>
		 		<td rowspan="2" style="height: 200px">
		 			<div class="content">${boardview.content}</div>
		 		</td>
		 	</tr>
		 </tbody>
		 <tfoot style="border-right-color: lightgray;">
			<tr class="line">
				<td>첨부파일</td>
				<td><a href="download.bizpoll?file=${boardview.filename}">${boardview.filename}
				(<fmt:formatNumber type="number" value="${boardview.filesize / 1024}" pattern="0.0"/>kb)
				</a></td>
			</tr>		 	
		 </tfoot>
		</table>
		<c:if test="${sessionScope.loginUser.id==boardview.writer}">
		 <button class="bd_dl_btn">삭제</button>
		 <button class="bd_up_btn">수정</button>
		</c:if>
		
		<button class="bd_ex_btn"><a href="boardList.bizpoll">목록</a></button>
	</div>
	
	
	
	</article>
	<!-- 댓글 -->
	<!-- 댓글달기 -->
	<div id="boardr_bt">
		<div id="bt_all">
		<div id="reply_all"> 
			<!-- 댓글이 있을때 -->

			<div id="reply_RD">
				<div id="reply_on"><div id="replyYes"><p>댓글<span class="line"> | </span><span class="Num_cl">1</span></p><!-- <div id="replyYes_btn"><button>목록</button><button>쓰기</button></div> --></div>
					<div id="RD_one"><p>둥둥이<span class="line"> | </span><span class="sp_cl">2018-11-07</span><button>수정</button><button>삭제</button></p>
					<input type="text" readonly="readonly" placeholder="ㅋㅋㅋㅋ">
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
			<div id="user_login">
				<div id="user_name">${sessionScope.loginUser.name}</div>
				<input type="text" placeholder="댓글을 입력하세요. 비방, 욕설등은 허용하지 않습니다. ">
				<button>댓글 등록</button>
			</div>
			</div>
		 </c:otherwise>			
		</c:choose>
		</div>
	</div>
	
	
</body>
</html>
