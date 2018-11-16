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
	/*font-family: 'Noto Sans KR', sans-serif;*/
}
#boardreply_body {
	padding-top: 200px;
}
#boardreply_body {
}

	/* modal 창 */
	#modal_all {
		z-index: 10000;
		position: fixed;
		top:0px;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background: rgba(0,0,0,0.4);
		padding-top: 100px;
		display: none;
		
	}
	#modal_in {
		border: 2px solid #a79c8e;
		border-radius: 15px;
		text-align: center;
		width: 400px;
		height: 150px;
		background-color: #f2e9e1;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -150px;
		margin-left: -200px;
	}
	#modal_up {
		font-size: 16px;
		text-align: left;
		color: white;
		background-color: #f9cdad;
		border-radius: 14px 14px 0 0;
	}
	#draw {
		padding: 0 10px;
	}
	
	#close_btn {
		padding: 0 10px;
		float: right;
		color: white;
	}
	
	h3 > span {
		color: #fd999a;
		font-weight: bold; 
	}
	#modal_text {
		margin: 15px auto;
		padding: 0 auto;
	}
	#modal_text > h3 {
		margin-top: 30px;
	}
	#yesno_btn {
		margin-left: 28%;
	}
	#yes_btn{
		width: 80px;
		height: 29px;
		font-size: 16px;
		text-align: center;
		background-color: #fd999a;
		color: white;
		display: block;
		padding-top: 2px; 
		/* line-height: 61px; */
		display: inline-block;
		float: left;
		margin-left: 10px;
		border: 1px solid #f8ecc9;
		border-radius: 30px;
		
	}
	#no_btn {
		width: 80px;
		height: 29px;
		font-size: 16px;
		text-align: center;
		background-color: white;
		color: #fd999a;
		display: block;
		padding-top: 2px;
		/* line-height: 61px; */
		display: inline-block;
		float: left;
		border: 1px solid #fd999a;
		border-radius: 30px;
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
.bd_up_btn > a{
	color: #fff;
	text-decoration: none;
}
.bd_up_btn:hover {
	color: #fff;
    background-color: #ffc241;
    border-color: #ffbe34;
}






/* BOTTOM */
.bt_all {
	padding: 0 30px;
}
#boardr_bt {
	margin: 0 auto;
	padding: 10px 30px;
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

.RD_one >p> button{
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
	margin: 0;
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
	margin: 0 60px;
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
#reply_writer {
	font-size: 16px;
	font-weight: bold;
	color: #F7AA97;
	border: 0;
}
#err_content {
	font-size: 11px;
	color: red;
	float: left;
	display: none;
}





	/* reply 삭제 modal 창 */
	#modal_all_redel {
		z-index: 10000;
		position: fixed;
		top:0px;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background: rgba(0,0,0,0.4);
		padding-top: 100px;
		display: none;
		
	}
	#modal_in_redel {
		border: 2px solid #a79c8e;
		border-radius: 15px;
		text-align: center;
		width: 400px;
		height: 150px;
		background-color: #f2e9e1;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -150px;
		margin-left: -200px;
	}
	#modal_up_redel {
		font-size: 16px;
		text-align: left;
		color: white;
		background-color: #f9cdad;
		border-radius: 14px 14px 0 0;
	}
	#draw_redel {
		padding: 0 10px;
	}
	
	#close_btn_redel {
		padding: 0 10px;
		float: right;
		color: white;
	}
	
	h3 > span {
		color: #fd999a;
		font-weight: bold; 
	}
	#modal_text_redel {
		margin: 15px auto;
		padding: 0 auto;
	}
	#modal_tex_redelt > h3 {
		margin-top: 30px;
	}
	#yesno_btn_redel {
		margin-left: 28%;
	}
	#yes_btn_redel{
		width: 80px;
		height: 29px;
		font-size: 16px;
		text-align: center;
		background-color: #fd999a;
		color: white;
		display: block;
		padding-top: 2px; 
		/* line-height: 61px; */
		display: inline-block;
		float: left;
		margin-left: 10px;
		border: 1px solid #f8ecc9;
		border-radius: 30px;
		
	}
	#no_btn_redel {
		width: 80px;
		height: 29px;
		font-size: 16px;
		text-align: center;
		background-color: white;
		color: #fd999a;
		display: block;
		padding-top: 2px;
		/* line-height: 61px; */
		display: inline-block;
		float: left;
		border: 1px solid #fd999a;
		border-radius: 30px;
	}









</style>
<script type="text/javascript">

 $(document).ready(function(){
	 // 문서가 준비 되면 댓글 목록을 조회하는 AJAX 실행
	 comment_list();
 });
 
 function comment_list(){
	 $.ajax({
		type: "post",
		url: "commentlist.bizpoll",
		data: "bno=${boardview.bno}",
		success: function(result){ // ajax로 include함(페이지 삽입)
			$("#commentList").html(result);
		}
	 });
 }
 
 
 $(document).on("click","#up_btn", function(){
	alert("test");
	location.href="boardupdate.bizpoll?bno=${boardview.bno}";
 });
 
 
 
  $(document).on("click","#de_btn", function(){
	 alert("삭제하시겠습니까?")
	 // 모달창 열기
	 $("#modal_all").css("display", "block");
	 
	 $("#close_btn").click(function(){
		$("#modal_all").css("display", "none");
	 });
	 $("#no_btn").click(function(){
		$("#modal_all").css("display", "none");
	 });
	 $("#yes_btn").click(function(){
		location.href="boarddelete.bizpoll?bno=${boardview.bno}";
	 });
  });
  
  
  
  // 댓글 입력
  $(document).on("click","#reply_btn",function(){
	 alert("입력");
	 var content = $("#reply_text").val();
	 
	 if(content == ""){
		$("#reply_text").focus();
		$("#err_content").css("display","block");
		alert("입력하셔야 등록이 됩니다.");
	 	return false;
	 } else {
		var bno = ${boardview.bno};
	 	$("#re_bno").val(bno);
		alert(content+", "+bno);
	 }
	 // form태그로 데이터 보내기! -> serialize() + contentType
	 //                     form 태그 직렬화!!
	 $.ajax({
			url: "replyinsert.bizpoll",
			data: $("#reply_fmt").serialize(),
			contentType: 'application/x-www-form-urlencode; charset=UTF-8',
			success: function(result){
				comment_list();
				$("#reply_text").val("");
			},
			error:function(){
				alert("SYSTEM ERROR!!")
			}
	 });
	 
	 
	 
  });

  // 댓글 삭제
  $(document).on("click",".delete",function(){
	 alert("삭제하시겠습니까?")
	 var rno = $(this).attr("data_num");
	 var bno=${boardview.bno};
	 // 모달창 열기
	 $("#modal_all_redel").css("display", "block");
	 
	 $("#close_btn_redel").click(function(){
		 $("#modal_all_redel").css("display", "none");
	 });
	 $("#no_btn_redel").click(function(){
		$("#modal_all_redel").css("display", "none");
	 });
	
	 $("#yes_btn_redel").click(function(){
	 
		 $.ajax({
			url: "replyDelete.bizpoll",
			data: "rno="+rno,
			success: function(result){
				comment_list();
			},
			error:function(){
				alert("SYSTEM ERROR!!")
			}
	 	});
		 
	 }); 
	  
  });
  
</script>
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
				<td class="file_a"><a href="download.bizpoll?file=${boardview.filename}">${boardview.filename}
				(<fmt:formatNumber type="number" value="${boardview.filesize / 1024}" pattern="0.0"/>kb)
				</a></td>
			</tr>		 	
		 </tfoot>
		</table>
		<c:if test="${sessionScope.loginUser.id==boardview.writer}">
		 <button class="bd_dl_btn" id="de_btn">삭제</button>
		 <!-- 삭제 모달창 -->
		 <div id="modal_all">
		   <div id="modal_in">
			<div id="modal_up"><span id="draw">게시글삭제</span><span id="close_btn"><i class="fa fa-close"></i></span></div>
			<div id="modal_text"><h3>다음<span>게시글</span>을 삭제하시겠습니까?</h3></div>
			<div id="yesno_btn">
				<div><a href="#" id="no_btn">아니오</a></div><div><a href="#" id="yes_btn">네</a></div>
			</div>
		   </div>
		</div>
		 <button class="bd_up_btn" id="up_btn">수정</button>
		</c:if>
		
		<button class="bd_ex_btn"><a href="boardList.bizpoll">목록</a></button>
	</div>
	
	
	
	</article>
	<!-- 댓글 -->
	<!-- 댓글달기 -->
	<div id="boardr_bt">
		<div id="commentList">
		</div>
		<%-- commentlist.jsp로 갈 것!
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
					</c:choose>	</span><c:if test="${sessionScope.loginUser.id==replyview.writer}"><button>수정</button><button>삭제</button></c:if></p>
					<input type="text" readonly="readonly" value="${replyview.content}">
					</div>
				</div>
				</c:forEach>
				</div>
			</div>
		</div>
		--%>
		
		<%-- 
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
			<form action="replyinsert.bizpoll" method="post" id="reply_fmt" name="reply_fmt">
			<div id="user_login">
				<div id="user_name"><input value="${sessionScope.loginUser.id}" id="reply_writer" name="reply_writer" readonly="readonly"></div>
				<input type="text" placeholder="댓글을 입력하세요. 비방, 욕설등은 허용하지 않습니다. " name="reply_text" id="reply_text">
				<button id="reply_btn">댓글 등록</button>
			</div>
			</form>
			</div>
		 </c:otherwise>			
		</c:choose> 
		--%>
		</div>
	
	
</body>
</html>
