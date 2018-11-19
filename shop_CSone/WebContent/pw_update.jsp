<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PW_UPDATE</title>
<style type="text/css">
#body_rpw{
padding-top: 190px;
}
	body,ul {
		margin: 0;
		padding: 0;
	}
	a {
		text-decoration: none;
	}
	ul {
		list-style-type: none;
	}
	/* 로고 */
	#content_layout {
		width: 460px;
		margin: 0 auto;
	}
	#header_div img {
		display: block;
		margin: 62px auto;
	}
	
	
	/* 비밀번호 수정 */
	.div_rpw_input {
		background-color: white;
		border: 1px solid #fec9c9;
		width: 408px;
		height: 29px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}
	.input_password {
		width: 408px;
		border-width: 0px;
		padding: 7px 0px 6px 0px;
	}
	#btn_rpw_ck {
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
	
	
	hr {
		width: 98%;
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
	#rpw_input input:focus {
		outline: 2px solid #FADAD8;
	}
	.rpw_ck_err_check{
		display: none;
	}
	.rpw_ck_err_check_msg {
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
	
	#pw_hr_middle {
		margin: 10px auto;
		
	}
	#pw_hr_under {
		margin: 30px auto;
	}
	.error {
		padding-top: 10px;
		color: red;
		font-size: 11px;
		display: none;
	}
	
	

</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* focus: 초점이 가게하는 것
		blur: 초점을 해제 하는 것*/

		$("#input_pw_ck").focus(function(){
			$("#scone_id").css("border", "1px solid #fd999a");
		});
		$("#input_rpw").focus(function(){
			$("#scone_pw").css("border", "1px solid #fd999a");
		});
		$("#input_rpw_ck").focus(function(){
			$("#scone_rpw_ck").css("border", "1px solid #fd999a");
		});
		
		
		$("#input_pw_ck").blur(function(){
			$("#scone_id").css("border", "1px solid #fec9c9");
		});
		$("#input_rpw").blur(function(){
			$("#scone_pw").css("border", "1px solid #fec9c9");
		});
		$("#input_rpw_ck").blur(function(){
			$("#scone_rpw_ck").css("border", "1px solid #fec9c9");
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
		$("#btn_rpw_ck").click(function(){
			/* alert("test"); */
			/* input의 id와 pw값을 입력 */
			var pwck = $("#input_pw_ck").val();
			var rpw = $("#input_rpw").val();
			var rpwck = $("#input_rpw_ck").val();
			alert(pwck+", "+rpw+", "+rpwck);
			
			/* 유효성 체크 */
			if(pwck != "" && rpw !="" && rpwck !=""){
				alert("페이지 이동");
				/* $("#frm_pwCk").submit(); */
			}else{/*둘다 값x 또는 둘 중에 하나라도 값이x*/
				$(".rpw_ck_err_check").css("display","block");
				return false; /*java로 이동하지 않고 화면단으로 다시 돌아감*/
			}
		});
		
		
		
		
		
		
	});
	
	
	$(document).on("blur", "#input_pw_ck", function(){
		/* 현재 비밀번호 입력받은 값이 일치한지 확인하는 과정 */
			var nowPw = $("#input_pw_ck").val();
			
			 if(nowPw !=""){
					$.ajax({
						url: "pwCheck.bizpoll",
						type: "POST",
						dataType: "json",
						data: "id=${sessionScope.loginUser.id}&pw="+ nowPw,
						success: function(data){
							/* alert("Ajax 성공!"); */
							if(data.message == "-1"){
								/* alert("현재비밀번호가 일치"); */
								$("#input_pw_ck").next().text("비밀번호가 일치합니다.").css("display", "block").css("color", "#0000FF");
								$("#input_pw_ck").parent().css("margin-bottom","30px");
								
							}else{
								/* alert("현재비밀번호가 일치하지 않음"); */
								$("#input_pw_ck").next().text("비밀번호가 일치하지 않습니다").css("display", "block").css("color", "#F46665");
								$("#input_pw_ck").select();
								$("#input_pw_ck").parent().css("margin-bottom","30px");
								
							}
						},
						error:function(){
							alert("System Error!!");
						}
						
					});
				}
			/* 유효성검사를 위해서 했기 때문에 이렇게 하지 않고 밑과 같이 실행한다
			if(nowPW==""){
				alert("필수정보입니다!")
			} else {
				여기서 ajax
				ajax는 쿼리스트링이기때문에 공백을 넣으면 절대 안됌!!!!!
			} */
			
			/* nowPW가 NULL이 아닌경우에만 실행! */
			
			/* >>>> esle if에 넣어놨다!!*/
		});
	
	
	/* 새비밀번호 확인하기! */
	$(document).on("click","#btn_rpw_ck",function(){
		var
		form  = $("#frm_pwCk"),
		mnpw = $("#input_pw_ck"),
		mpw = $("#input_rpw"),
		mrpw = $("#input_rpw_ck");
		
		
		var npw = $.trim(mnpw.val());
		var pw = $.trim(mpw.val());
		var rpw = $.trim(mrpw.val());
		alert("npw : "+npw+pw+rpw);
		var checkTest = $("#input_pw_ck").next().text();
		/* 필수정보입니다. 비밀번호가 일치하지 않습니다. 비밀번호가 일치합니다. */
		
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		
		if (npw == ""){
			mnpw.focus();
			mnpw.next().text("필수정보 입니다.").css("display","block");
			mnpw.parent().css("margin-bottom","30px");
			return false;
		}
		
		if (pw == ""){
			mpw.focus();
			mpw.next().text("필수정보 입니다.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		} else if(!regPass.test(pw)){
			mpw.focus();
			mpw.next().text("8~20자 이내 영문자와 숫자 특수문자만 입력하세요.").css("display","block");
			mpw.parent().css("margin-bottom","30px");
			return false;
		} else if(rpw == ""){
			alert("재확인!!!");
			mrpw.focus();
			mrpw.next().text("필수정보 입니다.").css("display","block");
			mrpw.parent().css("margin-bottom","30px");
			return false;
		} 
		if(pw != rpw){//새비밀번호확인- 새비밀번호재입력 확인
			alert("안됨!!");
			mrpw.select();
			mrpw.next().text("비밀번호가 일치하지않습니다.").css("display","block");
			mrpw.parent().css("margin-bottom","30px");
			return false;
		} else if(pw == npw){ //현재비밀번호와 새비밀번호 비교
			alert("안됨2!!!");
			mpw.focus();
			mpw.val("");
			mrpw.val("");
			mpw.next().text("현재 비밀번호와 동일합니다.").css("display", "block");
			return false;
		}
		
		
		form.submit();
		
	});
</script>
</head>
<body id="body_rpw">
	<div id="content_layout">
		<header>
			<div id="header_div">
				<a href="http://localhost:8081/shop_csone/include/header.html">
					<img alt="scone 로고" src="img/logo_csone.png">
				</a>
			</div>
		</header>
		<section id="rpw_input">
			<form action="memberpwplay.bizpoll" method="POST" name="frm_pwCk" id="frm_pwCk">
			<div class="div_rpw_input" id="scone_id">
				<input type="password" placeholder="비밀번호 확인" id="input_pw_ck" class="input_password" name="input_pw_ck">
				<span class="error">필수 정보입니다.</span>
			</div>
			<div id="pw_hr_middle"><hr></div>
			<div class="div_rpw_input" id="scone_pw">
				<input type="password" placeholder="새 비밀번호" id="input_rpw" class="input_password" name="input_rpw">
				<span class="error">필수 정보입니다.</span>
			</div>
			<div class="div_rpw_input" id="scone_rpw_ck">
				<input type="password" placeholder="새 비밀번호 확인" id="input_rpw_ck" class="input_password" name="input_rpw_ck">
				<span class="error">필수 정보입니다.</span>
			</div>
			<div class="rpw_ck_err_check">
				<span class="rpw_ck_err_check_msg">비밀번호를 정확히 입력해 주세요</span>
			</div>
			
			<!-- input태그 숨기기 -->
			<input type="hidden" name="updateId" value="${sessionScope.loginUser.id}">
			
			<div><a href="#" id="btn_rpw_ck">비밀번호 변경</a></div>
			</form>
			<div id="pw_hr_under"><hr></div>
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

</body>
</html>
<%@ include file="include/footer.jsp" %>