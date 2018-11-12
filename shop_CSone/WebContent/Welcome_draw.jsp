<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 1. meta 태그 활용 refresh=새로고침 content="3초 뒤에 이동경로(url)로 이동한다!-->
<!-- <meta http-equiv="refresh" content="3; url=index.bizpoll"> -->
<title>welcome_draw.jsp</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	#body_draw {
		margin: 0 auto;
		padding: 0 auto;
		margin-top: 10%;
		font-family: 'Nanum Gothic', sans-serif;
	}
	#welcome {
		margin: 0 auto;
		text-align: center;
		border: 5px solid #c8c8a9;
		background-color: #f9cdad;
		border-radius: 30px;
		width: 1000px;
		/* color: #f8ecc9; */
	}
	#rCnt {
		font-weight: bold;
		color: red;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
/* 2. JavaScript사용 */
	var cnt=4; /* 3,2,1,0 ⇒  함수가 실행되는 시간이 1초 걸리기 때문에 -1한 4부터 시작*/
	function countdown(){
		if(cnt == 0){
			clearInterval(s);
			location.href="index.bizpoll";
		}
		document.getElementById("rCnt").innerHTML=cnt;
		cnt--;
	}
	var s = setInterval(countdown, 1000); /* Start ⇒ 1초단위로 countdown 실행! */
</script>
</head>
<body id="body_draw">
	<div id=draw>
		<h1>SCONE의 회원 탈퇴를 성공적으로 맞쳤습니다.</h1>
		<h3><img src="img/logo_cake_white.png" width="50" height="30">그동안 이용해주셔서 감사합니다<img src="img/logo_cake_white.png" width="50" height="30"></h3>
		<span id="rCnt">5</span><h3>초 뒤에 메인페이지로 이동합니다.</h3>
		<!-- 카운트다운 방법 -->
		<!-- 1. meta 태그 활용 (+JavaScript)
			 2. JavaScript의 setInterval() 활용
		 -->
	</div>
</body>
</html>