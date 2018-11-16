<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	#board_body, #board_body ul{
		padding: 0;
		margin: 0;
	}
	#board_body {
		padding-top: 190px;
	}
	#board_body *{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#BTwrap {
		margin: 0 auto;
		padding: 50px 30px;
		text-align: center;
		border: 1px solid red;
		max-width: 1000px;
	}
	#BTwrap a{
		text-decoration: none;
		color: #333;
	}
	/* #board_body * { 
		line-height: normal;
		list-style: none;
		color: #333;
	} */
	#board_body a { 
         text-decoration: none;
	}
	hr {
		border: thin solid #fd999a;
	}
	
	
	#BT_top {
		width : 900px;
		text-align: left;
		margin-bottom: 10px;
		margin: 0 auto;
	}
	#write {
		float: right;
		border: 2px solid beige;
		border-radius: 30px;
		background-color: #fffcf0;
		width: 65px;
		text-align: center;
	}
	#write:hover {
		background-color: #F7AA97;
		box-shadow: rgba(0,0,0,0.2);
		color: white;
	}
	.bar {
		color: #fd999a!important;
	}
	
	
	
	
	
	/* 테이블 */
	#board_table {
		width : 900px;
		margin: 0 auto;
		border-collapse: collapse;
		
	}
	#board_table * {
		font-weight: normal;
	}
	#board_table tr {
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
	}
	
	#tr_first *{
		font-weight: bold;
	}
	.subject{text-align: left; padding-left: 10px;}
	.new_time{
		color: white;
		font-size: 9px;
		border: 1px solid #FADAD8;
		background-color: #FADAD8;
		border-radius: 30px;
	}
	
	
	
	
	/* 페이지네이션 */
	#b_wrap {
		padding: 0;
		padding-top: 20px;
	}
	#pagination {
		padding: 10px 0;
		margin: 0;
		text-align: center;
	}
	.pagent{
		border: 1px solid #F7AA97;
		border-radius: 5px;
		padding: 5px 5px;
	}
	.pagent:not(#nohover):hover {
		background-color: #F7AA97;
		color: white;
	}
	.active {
		background-color: #F7AA97!important;
		color: white;
		border: 1px solid #F7AA97;
		border-radius: 5px;
		padding: 5px 5px;
	}
	
	/* float stop */
	.clr_both{clear:both;}
	
	
	/* 검색일자 */
	#bd_bar {
		width: 500px;
		padding: 0;
		margin: 0 auto;
		text-align: center;
	}
	#bd_select{
		width: 100px;
		border: 1px solid #F7AA97;
		color: #F7AA97;
	}
	#input_select {
		border: 1px solid #F7AA97;
		color: #F7AA97;
	}
	#input_select:focus{
		outline: 2px solid #FADAD8;
	}
	
	#bt_select {
		border: 1px solid #F7AA97;
		background-color: #F7AA97;
	}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#bt_select").click(function(){
			alert("test");
			var keyword = $("#input_select").val();
			var flag = $("#bd_select").val();
			alert(flag+keyword);
			// 쿼리스트링
			location.href="boardList.bizpoll?flag="+flag+"&keyword="+keyword;
			
		});
	});
</script>
</head>
<body id="board_body">
	<header>
		
	</header>
	
	<article id="BTwrap">
		<div id="BT_top">
			<h3>Q&A</h3>
				<input type="hidden" value="${code}" id="code">
				<span><strong><a href="boardList.bizpoll?flag=${flag}&keyword=${keyword}&key=new" id="orderNew">최신순</a></strong></span>&nbsp;<span class="bar">|</span>
				<span><a href="boardList.bizpoll?flag=${flag}&keyword=${keyword}&key=good" id="orderGood">추천순</a></span>&nbsp;<span class="bar">|</span>
				<span><a href="boardList.bizpoll?flag=${flag}&keyword=${keyword}&key=reply" id="orderReply">댓글순</a></span>&nbsp;<span class="bar">|</span>
				<span><a href="boardList.bizpoll?flag=${flag}&keyword=${keyword}&key=cnt" id="orderCnt">조회순</a></span>&nbsp;
				<div id="write"><span><strong><a href="boardinsert.bizpoll">글쓰기</a></strong></span></div>&nbsp;
				<div class="clr_both"></div>
		</div>
		<table id="board_table" border="0">
			<thead>
				<tr id="tr_first">
					<th style="width: 50px">no</th>
					<th style="width: 80px">Category</th>
					<th style="width: 300px" class="subject">subject</th>
					<th style="width: 40px">View</th>
					<th style="width: 80px">Writer</th>
					<th style="width: 100px">Date</th>
					<th style="width: 40px">file</th>
				<tr>
			</thead>
			<tbody>
				<!-- <tr><th>공지사항</th></tr>
				<tr><th>자주 묻는 질문</th></tr> -->
				<c:forEach items="${boardList}" var="bDto">
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
				<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
				<tr>
					<th>${bDto.bno}</th>
					<th>문의사항</th>
					<th class="subject">
					<a href="boardViewcnt.bizpoll?bno=${bDto.bno}">${bDto.title}
					<!-- new! -->
					<c:if test="${today2==regdate2}">
						<span class="new_time">NEW</span>
					</c:if>

					</a>
					</th>
					<th>${bDto.viewcnt}</th>
					<th>${bDto.writer}</th>
					<th>
					<!-- 날짜 포맷팅 -->
					<c:choose>
						<c:when test="${today2 == regdate2}">
							<fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/>
						</c:when>
						<c:otherwise>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
						</c:otherwise>
					</c:choose>	
					
					</th>
					<th class="icon">
						<c:if test="${bDto.filesize >0}">
							<img alt="파일이미지" src="img/fileimage1.PNG" width="20px" height="20px">
							<!-- <i class="fa fa-floppy-o"></i> -->
						</c:if>
					</th>
				</tr>
				</c:forEach>
				
			</tbody>
			<tfoot></tfoot>
		</table>
		
	<div id="b_wrap">
	<div id="pagination">
		<div class = "page">
			<c:if test="${pageMaker.prev}">
				<a href="boardList.bizpoll?page=${pageMaker.startPage-1}" class="pagent">&laquo;</a>
				
			</c:if>
			<c:forEach begin="${pageMaker.startPage}"
			  end="${pageMaker.endPage}" var="idx">
			  	<a <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/>
			  		href="boardList.bizpoll?page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}" class="pagent">${idx}</a>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
				<span class="pagent" id="nohover">...</span>
				<a href="boardList.bizpoll?page=${pageMaker.finalPage+1}" class="pagent">${pageMaker.finalPage+1}</a>
				<a href="boardList.bizpoll?page=${pageMaker.endPage+1}" class="pagent">&raquo;</a>
			</c:if>
		</div>
	</div>
	
	
	 <div id="bd_bar">
		<select id="bd_select">
			<option value="5" selected="selected">통합검색</option>
			<!-- <option value="directVal">통합 검색</option> -->
			<option value="1">category</option>
			<option value="2">제목</option>
			<option value="3">작성자</option>
			<option value="4">내용</option>
			<option value="5">제목+내용</option>
		</select>
		<input id="input_select" stype="text" placeholder="검색어를 입력하세요">
		<button id="bt_select">검색</button>
	 </div>
	</div>
	</article>
	
	<footer>
	
		<hr>
	</footer>
</body>
</html>
<%@ include file="../include/footer.jsp" %>