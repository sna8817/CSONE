<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<%
	String path = request.getContextPath(); // 컨텍스트 경로
%>
<!DOCTYPE html>
<html>
<head>
                                              <!--image/png -->
<link rel="icon" href="img/favicon_12.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>header.html</title>
<style type="text/css">
/* @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css); */
@import url('https://fonts.googleapis.com/css?family=Yeon+Sung');
	* {
		/* font-family: 'Noto Sans KR', sans-serif; */
		font-family: 'Yeon Sung', cursive;
	}
	body, ul {
	/* 여백삭제 */
		margin: 0 auto;
		padding: 0;
	}
	ul {
		list-style-type: none;
	}
	a {
		text-decoration: none;
	}
	#header_wrap {
		box-sizing: border-box;
		/* background-color: #fd999a; */
		z-index: 1000;
		position: fixed;
		width: 100%;
		top: 0px;
		left: 0px;
		box-sizing: border-box;
		background-color: white;
	}
	
	
	/* HEDAER 로그인, 회원가입, 고객센터 */
	#header_line1 {
		height: 30px;
		width: 100%;
		background-color: #fd999a;
		box-sizing: border-box;
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),
					0 6px 20px 0 rgba(0,0,0,0.19);
	}
	#header_line1_in {
		width: 80%;
		margin: 0 auto;
		position: relative;
	}
	#header_line1_slogo {
		position: absolute;
		left: 49%;
	}
	#header_line1_ul {
		float: right;
	}
	#header_line1_ul > li > a {
		color: white;
		font-size: 12px;
		font-weight: bold;
		height: 30px;
		padding: 0 10px;
		display: inline-block;
		line-height: 30px;
	}
	#header_line1_ul > li > a:hover{
		color:#1e2022;
	}
	#header_line1_ul > li {
	/* 태그들을 좌측, 우측 유동 배치 */
		float: left;
		height: 30px;
		position: relative;
	}
	#header_line1_ul > li:not(#user_name):hover{
	/* li태그에 마우스를 올렸을 때 동작하는 내용 */
		background-color: #fec8c9;
	}
	#header_line1_dropdown {
		box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),
					0 6px 20px 0 rgba(0,0,0,0.19);
		/* 숨기는 효과
		display: none; 존재 자체가 없는 것
		visibility: false; 있는데 보이지 않는 것
		 */
		display: none;
		position: absolute;
		z-index: 100;
		 
	}
	#header_line1_ul > li:hover #header_line1_dropdown {
		/* #header_line1_ul > li:hover 했을 때
		#header_line1_dropdown을 어떻게 변경할지 적용 */
		display: block;
	}
	#header_line1_dropdown > a {
		display: block;
		font-size: 12px;
		background-color: #fd999a;
		color: white;
		padding: 5px /* 0px 5px */10px;
		border-bottom: 1px solid white;
		width: 82px!important;
	}
	#header_line1_dropdown > a:hover {
		background-color: #fec8c9;
		color: #1e2022;
		font-weight: bold;
		text-decoration: underline;
	}
	#header_line1_mypage {
		width: 82px!important;	/* 전체에서 -20한 사이즈로= padding이 10씩 있기 때문에 */
		text-align: center; 
	}
	
	
	
	/* 로고이미지, 검색창 */
	#header_line2 {
		width: 70%;
		height: 80px;
		margin: 15px auto;
		box-sizing: border-box;
	}
	#header_line2 img {
		display: inline-block;
		margin-top: 8xp;
	}
	
	
	
	
	/* line2 검색창 */
	#header_line2_wrap_search {
		height: 34px;
		display: inline-block;
		float: right;
		padding-top: 50px;
	}
	div#header_line2_search {
		border: 2px solid #fec8c9;
		height: 34px;
		box-sizing: border-box;
		position: relative;
	}
	input#search_keyword {
		width: 353px;
		height: 30px;
		font-size: 13px;
		box-sizing: border-box;
		border: 0px;
		padding-left: 10px;
	}
	input#search_btn {
		width: 55px;
		height: 30px;
		background-color: #fec8c9;
		color: white;
		font-size: 13px;
		border: 0px;
		position: absolute;
		right: 0px;
		top: 0px;
	}
	#header_line2_search input:focus {
		outline: 2px solid #FADAD8;
	}
	
	
	
	
	
	/* 네비게이션 메뉴바 */
	#header_line3 {
		width: 100%;
		height: 49px;
		background-color: #fec8c9;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
					0 4px 20px 0 rgba(0,0,0,0.19);
		box-sizing: border-box;
		z-index: 99;
	}
	#header_line3_ul > li {
		float: left;
		box-sizing: border-box;
		height: 49px;
		z-index: 100;
	}
	#header_line3_ul > li:hover {
		background-color: #fd999a;
		border-top: 5px solid white;
	}
	#header_line3_ul > li > a {
		width: 130px;
		color: white;
		line-height: 49px;
		font-size: 20px;
		padding: 0 13px;
		display: inline-block;
		text-align: center;
	}
	#header_line3_in {
		width: 70%;
		margin: 0 auto;
	}
	
	
	/* 네비게이션 dropdown */
	#header_line3_ul > li {
		position: relative;
	}
	.header_line3_dropdown {
		position: absolute;
		top:44px;
		display: none;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
					0 4px 20px 0 rgba(0,0,0,0.19);
		box-sizing: border-box;
	}
	#header_line3_ul > li:hover .header_line3_dropdown {
		display: block;
		
	}
	.header_line3_dropdown > ul > li{
		display: block;
		font-size: 15px;
		background-color: #fec8c9;
		width: 136px;
		height: 30px;
		padding: 10px 10px;
		text-align: center;
	}
	.header_line3_dropdown > ul > li > a{
		color: white;
	}
	.header_line3_dropdown > ul > li:hover {
		background-color: #fd999a;
	}
	
	#header_line2_logo {
		position: relative;
	}
	#header_logo {
		position: absolute;
		left: 45%;
	}
	
	/* 로그인 후 user이름 디자인 */
	#user_name {
		padding: 5px 3px;
		text-align: center;
		font-size: 15px;
		font-weight: bold;
		color: #444f59;
		width: 140px;
		height: 30px;
	}
	#user_name>span {
		font-weight: 70%;
		color: #f8ecc9;
		margin-right: 3px;
	}
	
		
</style>
</head>
<body>
	<header>
		<div>
			<div id="header_wrap">
				<div id="header_line1">
					<div id="header_line1_in">
					<a href="<%=path%>/index.bizpoll"><img src="<%=path%>/img/logo_cake_white.png" width="40" height="30" id="header_line1_slogo"></a>
						<ul id="header_line1_ul">
						  <c:choose>
						   <c:when test="${empty sessionScope.loginUser}"> <!-- 로그인 안된 상태 -->
							<li><a href="<%=path%>/login.bizpoll">로그인</a></li>
							<li><a href="<%=path%>/constract.bizpoll">회원가입</a></li>
						   </c:when>
						   <c:otherwise> <!-- 로그인 된 상태 -->
						   	<li id="user_name" style="text-align: right"> <!-- 정수아(sna8817) -->
						   		<span>${sessionScope.loginUser.name}</span>(${sessionScope.loginUser.id})
						   	</li>
							<li><a href="<%=path%>/loginOut.bizpoll">로그아웃</a></li>
						   </c:otherwise>
					 	  </c:choose>
							<li><a id="header_line1_mypage" href="#">마이페이지▼</a>
								<div id="header_line1_dropdown">
									<c:choose>
									 <c:when test="${empty sessionScope.loginUser}">
										<a href="#">주문/배송조회</a>
										<a href="#">장바구니</a>
										<a href="#">WishList</a>
										</c:when>
									 <c:otherwise>
										<a href="<%=path%>/pwUpdate.bizpoll">비밀번호 수정</a>
										<a href="<%=path%>/memberUpdate.bizpoll">회원정보</a>
									    <a href="#">주문/배송조회</a>
										<a href="#">장바구니</a>
										<a href="#">WishList</a>
										<a href="<%=path%>/memberdraw.bizpoll">회원탈퇴</a>
									 </c:otherwise>
									</c:choose>
								</div>
							</li>
							<li><a href="">고객센터</a></li>
						</ul>
					</div>
				</div>
				<div id="header_line2">
				<a href="#">
					<div id="header_line2_logo">
						<!-- <p id="CSone">CSone</p> -->
						<a href="<%=path%>/index.bizpoll"><img src="<%=path%>/img/logo_csone.png" id="header_logo" width="150" height="80" alt="로고디자인"></a>
					</div>
				</a>
				<div id="header_line2_wrap_search">
					<div id="header_line2_search">
						<input id="search_keyword" type="text" placeholder="검색어를 입력하세요.">
						<input id="search_btn" type="submit" value="검색">
					</div>
				</div>
				</div>
				<div id="header_line3">
					<div id="header_line3_in">
						<ul id="header_line3_ul">
							<li><a href="#">BRANDS</a></li>
							<li><a href="#">Sale</a></li>
							<li><a href="#">Cake</a>
								<div class="header_line3_dropdown">
									<ul>
										<li><a href="#">chocolat</a></li>
										<li><a href="#">cheese</a></li>
										<li><a href="#">tiramisu</a></li>
										<li><a href="#">tart</a></li>
										<li><a href="#">crepe</a></li>
										<li><a href="#">roll</a></li>
										<li><a href="#">etc</a></li>
									</ul>
								</div>
							</li>
							<li><a href="#">Bakery</a>
								<div class="header_line3_dropdown">
									<ul>
										<li><a href="#">muffin</a></li>
										<li><a href="#">scone</a></li>
										<li><a href="#">sandwich</a></li>
										<li><a href="#">cookie</a></li>
										<li><a href="#">chou</a></li>
										<li><a href="#">etc</a></li>
									</ul>
								</div>
							</li>
							<li><a href="#">Finger food</a>
								<div class="header_line3_dropdown">
									<ul>
										<li><a href="#">chocolate</a></li>
										<li><a href="#">candy</a></li>
										<li><a href="#">jelly</a></li>
										<li><a href="#">macaron</a></li>
										<li><a href="#">etc</a></li>
									</ul>
								</div>
							</li>
							<li><a href="#">Seasonal</a>
								<div class="header_line3_dropdown">
									<ul>
										<li><a href="#">spring</a></li>
										<li><a href="#">summer</a></li>
										<li><a href="#">fall</a></li>
										<li><a href="#">winter</a></li>
									</ul>
								</div>
							</li>
							<li><a href="#">Special order</a>
								<div class="header_line3_dropdown">
									<ul>
										<li><a href="#">flower</a></li>
										<li><a href="#">wedding</a></li>
										<li><a href="#">birth</a></li>
										<li><a href="#">etc</a></li>
									</ul>
								</div>
							</li>
							<li><a href="<%=path%>/boardList.bizpoll">게시판</a>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
</html>