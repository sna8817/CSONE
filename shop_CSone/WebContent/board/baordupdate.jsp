<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Yeon+Sung');
#boardinsert_body , #boardinsert_body ul{
	padding: 0;
	margin: 0;
}
#boardinsert_body *:not(.fa){
	font-family: 'Yeon Sung', cursive;
}
#boardinsert_body {
	padding-top: 200px;
}
#boardinsert_body {
}

/* TOP */
#boardr_to {
	padding: 0;
	margin: 0 auto;
	padding: 10px 30px;
	text-align: center;
	border: 1px solid beige;
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
	border: 1px solid beige;
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
.btn-file {
	border: 1px solid pink;
    color: #fff;
    background-color: pink;
    border-radius: 5px;
}
#file-name {
	font-size: 14px;
}


.bd_up_btn {
	padding: 0;
	margin: 0;
	width: 100px;
	height: 30px;
	float: right;
	color: #fff;
    background-color: #FFCE67;
    border: 1px solid #FFCE67;
    border-radius: 0.4rem;
    font-size: 16px;
}
.bd_up_btn:hover {
    background-color: #ffc241;
    border-color: #ffbe34;
}
.bd_up_btn > a {
	text-decoration: none;
	color: #fff;
}
.bd_ex_btn {
	padding: 0;
	margin: 0;
	width: 100px;
	height: 30px;
	float: left;
	color: #fff;
    background-color: #56CC9D;
    border:1px solid #56CC9D;
    border-radius: 0.4rem;
    font-size: 16px;
}
.bd_ex_btn:hover {
    background-color: #3ac18c;
    border-color: #37b885;
}

.text_index {
	width: -webkit-fill-available;
	height: -webkit-fill-available;
}
.line {
	color: #fec8c9;
}
#writer {
	font-size: 16px;
	color: #fec8c9;
	border: 0;
}
.line_file {
	color: #fec8c9;;
}
#close_btn {
	margin-left: 5px;
}




/* nouser */
#noUser {
	margin: 0 auto;
	padding: 50px 30px;
	text-align: center;
	border: 1px solid red;
	max-width: 1000px;
	/* display: none; */
}
#noUser_text {
	width: -webkit-fill-available;
	height: 200px;
	background-color: #f1f1f1;
	border: 1px solid lightgray;
	border-radius: 15px;
}
#noUser_text >h2 {
	text-align: center;
	line-height: 50px;
}
#noUser_text >h2 >span {
	color: #fec8c9;
}

.error {
	color: red;
	font-size: 11px;
	display: none;
}
</style>
<script type="text/javascript" src="<%=path%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	// 전파일 값 넣어놓기
	$(document).ready(function(){
		$("#file-name").text("${boardview.filename}");
		var fileyes = $("#file-name").val();
		if(fileyes != null){
			$("#close_btn").css("display","inline-block");
		}
	});
	
	// 파일업로드 클릭시 업로드파일을 클릭 
	$(document).on("click", ".btn-file",function(){
		$("#uploadfile").click();
	});
	
	// 파일이름에 값이 들어올 경우 파일이름을 나타나게 하고, fa아이콘 보이게!
	$(document).on("change","#uploadfile",function(){
		var filesize = $(this)[0].files; // file들을 첨부할 수 있으니(배열)
		
		// 파일 선택시 취소 버튼 누를때 선택된 파일없음으로 뜨는 명령어
		if(filesize.length <1){
			$("#file-name").text("선택된 파일 없음");     // 파일이 없기 때문에 선택된 파일없음
			$("#close_btn").css("display","none");  // 클로즈 버튼 none
		} else{
			// 첨부파일이 있다면 첨부파일의 이름과 사이즈를 불러옴!
			var filename = this.files[0].name;
			var filesize = this.files[0].size;
			
			var maxSize = 10*1024*1024;    // 10MB로 용량 제한
			
			if(filesize>maxSize){ // 용량 제한 걸림!
				alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다.");
				$("#file-name").text("선택된 파일 없음");
				// 화면단에서는 input type="file" 용량 제한하는 코드가 없기 때문에 경고창은 뜨지만 실제로는 10mb넘는 파일이 들어가 있다
				// 반드시 초기화를 시켜서 지워줄 것!!
				$("#uploadfile").val("");     // 초기화
				$("#now-file-size").val(0);   // 초기화
			} else { // 첨부 가능!!
				$("#now-file-size").val(filesize);
				$("#file-name").text(filename);
				$("#close_btn").css("display","inline-block");
			}
		}
	});
	
	// fa아이콘 클릭시 닫히게!
	$(document).on("click","#close_btn",function(){
		$("#uploadfile").replaceWith($("#uploadfile").clone(true)); // 초기화
		$("#uploadfile").val("");
		$("#file-name").text("선택된 파일 없음");
		$("#close_btn").css("display","none");
	});
	
	
	
	
	
	$(document).on("click",".bd_up_btn", function(elClickedObj){
		alert("test");
		var title = $("#title").val();
		alert(title);
		
		// 스마트 에디터로 content부분 값 넘겨받는 부분
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",[]);
		
		if(title == "") {
			alert("제목 안썻음");
			$("#title").focus();
			$(".error").css("display","block");
			return false;
		}
		
		// submit에 파일이름을 넣어줌!
		var nowfile = $("#file-name").text();
		$("#now-file-name").val(nowfile);
		$("#fmt_btn").submit();
	});
	
	$(document).on("blur","#title",function(){
		var title = $("#title").val();
		if(title==""){
			$(".error").css("display","block");
		} else {
			$(".error").css("display","none");
			
		}
	});
	
	
	
	
	
	
	
/* 로그인페이지로 이동!!! */
/* 2. JavaScript사용 */ 
	var cnt=4; /* 3,2,1,0 ⇒  함수가 실행되는 시간이 1초 걸리기 때문에 -1한 4부터 시작 */
	function countdown(){
		if(cnt == 0){
			clearInterval(s);
			location.href="login.bizpoll";
		}
		document.getElementById("rCnt").innerHTML=cnt;
		cnt--;
	}
	var s = setInterval(countdown, 1000); /* Start ⇒ 1초단위로 countdown 실행! */
</script>
<title>게시글 수정</title>
</head>
<body id="boardinsert_body">
	<!-- 게시판 -->
	<header id="boardr_to">
		<h3>게시글 수정</h3>
	</header>
	<c:choose>
		 <c:when test="${empty sessionScope.loginUser}">
	<div id="noUser">
		<div id="noUser_text">
			<h2><span>CSone</span>회원에게만 게시글작성의 권한이 있습니다.</h2>
			<div id="login_go">
			<span id="rCnt">5</span><h3>초 뒤에 로그인페이지로 이동합니다.</h3>
			</div>
		</div>
	</div>
		</c:when>
		<c:otherwise>
	<article id="boardr_md">
	<form action="boardUpdatePlay.bizpoll" id="frm_btn" name="frm_btn" enctype="multipart/form-data" method="POST">
	<div id="table_div">
		<table id="boardr_table" border="1px solid lightgray">
		 <thead style="border-right-color: lightgray;">
		 	<tr class="line">
		 		<th style="width: 100px">subject</th>
		 		<th style="width: 900px;text-align: left;"><input type="text" style="width: -webkit-fill-available" id="title" name="title" value="${boardview.title}">
		 		<span class="error">*필수 입력창입니다.</span>
		 		</th>
		 	</tr>
		 	<tr class="line">
		 		<th style="width: 100px">writer</th>
				<th style="width: 900px;text-align: left;"><input value="${sessionScope.loginUser.id}" name="writer" readonly="readonly" id="writer">
				</th>
		 	</tr>
		 </thead>
		 <tbody>
		 	<tr>
		 		<td colspan="2" style="height: 200px">
		 			<textarea rows="" cols="" id="content" name="content" class="text_index">
		 			${boardview.content}
		 			</textarea>
		 		</td>
		 	</tr>
		 </tbody>
		 <tfoot style="border-right-color: lightgray;">
			<tr class="line_file">
				<td>첨부파일</td>
				<td>
				<input type="file" name="uploadfile" id="uploadfile" style="display: none">
				<input type="button" class="btn-file" value="파일 선택">
				<span class="files" id="file-name" style="height: 29px; border: none;">선택된 파일 없음</span>
				<i class="fa fa-close" id="close_btn" style="display: none"></i>
				
				
		 		<input type="hidden" value="${boardview.bno}" name="bno" readonly="readonly" id="bno">
				<input type="hidden" id="now-file-name" name="now-file-name">
				<input type="hidden" id="now-file-size" name="now-file-size">
 				</td>
			</tr>		 	
		 </tfoot>
		</table>
	</div>
	
	<button class="bd_ex_btn">목록</button>
	<button class="bd_up_btn">게시글 수정</button>
	</form>
	
	</article>
	
	
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "<%=path%>/smarteditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
	</script>
		</c:otherwise>
	</c:choose>
</body>
</html>
