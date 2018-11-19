<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!-- referer: 로그인하기 전의 url 주소를 가져온다! -->
<%
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CSONE LOGIN</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	#body_login{
		padding-top: 150px;
	}
	#body_login > body, #body_login > ul {
		margin: 0;
		padding: 0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	#body_login > a {
		text-decoration: none;
	}
	#body_login > ul {
		list-style-type: none;
	}
	/* 로고 */
	#wrap_login {
		/* background-color: #fffcf0; */
		width: 600px;
		height: 550px;
		padding: 0 auto;
		margin: 0 auto;
		/* border: 1px solid red; */
	}
	#content_layout {
		width: 460px;
		margin: 0 auto;
	}
	#header_div img {
		display: block;
		margin: 62px auto;
	}
	
	
	/* section(그룹 로그인, input(id, pw), 로그인 버튼, find) */
	#group_login {
		color: #eb9f9f;
		font-size: 11px;
		text-align: right;
		margin-bottom: 7px;
	}
	#group_login > a{
		color: inherit;
	}
	.div_input {
		background-color: white;
		border: 1px solid #fec9c9;
		width: 408px;
		height: 29px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}
	.input_login {
		width: 408px;
		height: 30px;
		border-width: 0px;
		padding: 7px 0px 6px 0px;
	}
	#btn_login {
		width: 460px;
		height: 59px;
		font-size: 22px;
		text-align: center;
		background-color: #fd999a;
		color: white;
		display: block;
		padding-top: 2px;
		line-height: 61px;
	}
	
	#body_login > table {
		width: 100%;
	}
	#body_login #login_table {
		width: 460px;
	}
	#body_login > td {
		height: 26px;
	}
	#state {
		font-size: 13px;
		position: relative;
	}
	#state img {
	/* img와 text를 같이 맞출 때 */
		vertical-align: middle;
	}
	#secure {
		text-align: right;
		font-size: 12px;
	}
	#ip_ud {
		color: #747474;
	}
	#ip_ud > a{
	/* 부모의 글자색을 그대로 물려받아서 사용 */
		color: inherit;
	}
	#off {
		font-weight: bold;
		width: 22px;
		text-align: left;
		display: inline-block;
	}
	.si {
		color: #d5d5d5;
	}
	#login_ud {
		color: #eb9f9f;
		text-decoration: underline;
	}
	#login_ud > a {
		color: inherit;
	}
	#secure img {
		vertical-align: bottom;
	}
	#login_bar {
		margin: 20px auto;
		border: thin solid #fec9c9;
	}
	#member {
		color: #eb9f9f;
		font-size: 12px;
		text-align: center;
	}
	#member > a {
		color: inherit;
	}
	#macketing {
		width: 100%;
	}
	#scone_img {
		width: 460px;
		display: block;
		margin: 47px 0px 15px 0px;
	}
	#login_input input:focus {
		outline: 2px solid #FADAD8;
	}
	#login_err_check{
		display: none;
	}
	#login_err_check_msg {
		display: inline-block;
		width: 428px;
		height: 24px;
		font-size: 11px;
		font-weight: 700;
		line-height: 24px;
		color: #E71D36;
		padding: 0px 15px;
		text-align: center;
	}
	
	hr{
		border: thin solid #fec9c9;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* focus: 초점이 가게하는 것
		blur: 초점을 해제 하는 것*/

		$("#inputid").focus(function(){
			$("#scone_id").css("border", "1px solid #fd999a");
		});
		$("#inputpw").focus(function(){
			$("#scone_pw").css("border", "1px solid #fd999a");
		});
		
		$("#inputid").blur(function(){
			$("#scone_id").css("border", "1px solid #fec9c9");
		});
		$("#inputpw").blur(function(){
			$("#scone_pw").css("border", "1px solid #fec9c9");
		});
		
		
		$("#off").click(function(){
			var val = $("#off").text();

			if(val == "OFF") {
				$("#off").text("ON").css("color", "#fec8c9");
			} else {
				$("#off").text("OFF").css("color", "black");
			}
		});
		
		/* 로그인버튼을 클릭했을 때, 유효성 체크 */
		$("#btn_login").click(function(){
			/* alert("test"); */
			/* input의 id와 pw값을 입력 */
			var id = $("#inputid").val();
			var pw = $("#inputpw").val();
			alert(id+", "+pw);
			
			/* 유효성 체크 */
			/* id와 pw중 하나라도 값이 없으면 경고문 출력 */
			if(id != "" && pw !=""){
				
				/* $("#frm_login").submit(); */
					$.ajax({
						url: "LoginPlay.bizpoll",
						type: "POST",
						dataType: "json",
						data: "id="+id+"&pw="+pw,
						success: function(data) {
							if(data.message =="1"){
								alert("로그인 성공");
								location.href="<%=referer%>";
							} else {
								alert("로그인 실패");
								$("#login_err_check").css("display","block");
								$("#login_err_check_msg").text("ID와 PW가 일치하지 않습니다.");
							}
						},
						error:function(){
							alert("SYSTEM ERROR!!");
						}
						
					});
				alert("페이지 이동");	
			}else{/*둘다 값x 또는 둘 중에 하나라도 값이x*/
				$("#login_err_check").css("display","block");
				return; /*java로 이동하지 않고 화면단으로 다시 돌아감*/
			}
		});
		
		
	});
</script>
</head>
<body id="body_login">
	<div id="wrap_login">
	
	<div id="content_layout">
		<header>
			<div id="header_div">
				<a href="http://localhost:8081/shop_csone/include/header.html">
					<img alt="scone 로고" src="img/logo_csone.png">
				</a>
			</div>
		</header>
		<section id="login_input">
			<div id="group_login">
				<a href="#">단체아이디 로그인 방법</a>
			</div>
			<!-- <form action="LoginPlay.bizpoll" method="POST" name="frm_login" id="frm_login"> -->
			<div class="div_input" id="scone_id">
				<input type="text" placeholder="아이디" id="inputid" class="input_login" name="inputid">
			</div>
			<div class="div_input" id="scone_pw">
				<input type="password" placeholder="비밀번호" id="inputpw" class="input_login" name="inputpw">
			</div>
			<div id="login_err_check">
				<span id="login_err_check_msg">아이디와 비밀번호를 입력해주세요.</span>
			</div>
			<div><a href="#" id="btn_login">로그인</a></div>
			<!-- </form> -->
			<div>
				<table id="login_table">
					<tbody>
						<tr>
							<td id="state"><!-- <img src="img/check_off.gif"> -->
							<input type="checkbox" value="1">
							로그인 상태 유지</td>
							<td id="secure">
								<span id="ip_ud"><a href="#">IP보안</a></span>&nbsp;
								<span id="off">OFF</span>&nbsp;
								<span class="si">|</span>&nbsp;
								<span id="login_ud"><a href="#">일회용 로그인</a></span>&nbsp;
								<!-- <img src="img/help.png"> -->
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr id="login_bar">
			<div id="member">
				<a href="#">아이디 찾기</a>
				&nbsp;
				<span class="si">|</span>
				&nbsp;
				<a href="#">비밀번호 찾기</a>
				&nbsp;
				<span class="si">|</span>
				&nbsp;
				<a href="#">회원가입</a>
			</div>
		</section>
		
		<aside>
			<div id="macketing">
				<!-- <img src="img/scone_img.JPG" id="scone_img"> -->
			</div>
		</aside>
		

		
	</div>
</div>
</body>
</html>
<%@ include file="include/footer.jsp" %>