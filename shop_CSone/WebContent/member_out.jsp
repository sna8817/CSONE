<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_out</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
#body_draw{
padding-top: 190px;
}
	body,ul {
		margin: 0;
		padding: 0;
	}
	body {
		/* background-color: #f5f6f7; */
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
	
	
	
	
	
	/* 탈퇴텍스트 */
	#draw_div{
		margin: 50px auto;
		padding: 0 auto;
	}
	#draw_text{
		border: 2px solid #DE7E73;
		text-align: center;
		border-radius: 13px;
		color: #444f59;
	}
	#draw_div h2 {
		color: #fd999a;
		text-align: center;
	}
	#text_div {
		margin: 0 20px;
		padding: 0 auto;
		text-align: left;
	}
	.text_color {
		color: #c8c8a9;
	}
	
	
	/* 탈퇴 비번 */
	.div_withdraw {
		background-color: white;
		border: 1px solid #fec9c9;
		width: 408px;
		height: 29px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}
	.input_withdraw {
		width: 408px;
		border-width: 0px;
		padding: 7px 0px 6px 0px;
	}
	#btn_draw_ck {
		width: 220px;
		height: 59px;
		font-size: 22px;
		text-align: center;
		background-color: #fd999a;
		color: white;
		display: block;
		padding-top: 2px;
		line-height: 61px;
		display: inline-block;
		float: left;
		margin-left: 10px;
		border: 1px solid white;
	}
	#btn_draw_ck2 {
		width: 220px;
		height: 59px;
		font-size: 22px;
		text-align: center;
		background-color: white;
		color: #fd999a;
		display: block;
		padding-top: 2px;
		line-height: 61px;
		display: inline-block;
		float: left;
		border: 1px solid #fd999a;
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
	#withdraw_input input:not(#input_id):focus {
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
	
	#div_draw_pw {
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

		$("#input_id_ck").focus(function(){
			$("#scone_id").css("border", "1px solid #fd999a");
		});
		$("#input_pw").focus(function(){
			$("#scone_pw").css("border", "1px solid #fd999a");
		});
		$("#input_pw_ck").focus(function(){
			$("#scone_rpw_ck").css("border", "1px solid #fd999a");
		});
		
		
		$("#input_id_ck").blur(function(){
			$("#scone_id").css("border", "1px solid #fec9c9");
		});
		$("#input_pw").blur(function(){
			$("#scone_pw").css("border", "1px solid #fec9c9");
		});
		$("#input_pw_ck").blur(function(){
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
		$("#btn_draw_ck").click(function(){
			/* alert("test"); */
			/* input의 id와 pw값을 입력 */
			var pwck = $("#input_id_ck").val();
			var rpw = $("#input_pw").val();
			var rpwck = $("#input_pw_ck").val();
			alert(pwck+", "+rpw+", "+rpwck);
			
			/* 유효성 체크 */
			/* id와 pw중 하나라도 값이 없으면 경고문 출력 */
			if(pwck != "" && rpw !="" && rpwck !=""){
				$("#frm_pwCk").submit();
				alert("페이지 이동");	
			}else{/*둘다 값x 또는 둘 중에 하나라도 값이x*/
				$(".rpw_ck_err_check").css("display","block");
				return; /*java로 이동하지 않고 화면단으로 다시 돌아감*/
			}
		});
		
		
		
		
		
		
	});
	
	
	$(document).on("click","#yes_btn", function(){
		/* 현재 비밀번호 입력받은 값이 일치한지 확인하는 과정 */
			var nowPw = $("#input_pw").val();
			alert("PW: "+nowPw);
			 if(nowPw !=""){
					$.ajax({
						url: "memberdeleteplay.bizpoll",
						type: "POST",
						dataType: "json",
						data: "id=${sessionScope.loginUser.id}&pw="+ nowPw,
						success: function(data) {
							if(data.message =="-1"){
								location.href="index.bizpoll";
							} else {
								$("#modal_all").css("display","none");
								$("#input_pw").next().text("정확한 비밀번호를 입력해주세요.");
								$("#input_pw").select();
								$("#input_pw").parent().css("margin-bottom", "30px");
							}
						},
						error:function(){
							alert("SYSTEM ERROR!!");
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
	
	
	/* 비밀번호 확인 */
	$(document).on("click","#btn_draw_ck",function(){
		var
		form  = $("#frm_pwCk"),
		mpw = $("#input_pw");
		
		
		var pw = $.trim(mpw.val());
		var checkTest = $("#input_pw").next().text();
		/* 필수정보입니다. 비밀번호가 일치하지 않습니다. 비밀번호가 일치합니다. */
		
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		
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
		}
		
		
		
		form.submit();
		
	});
	
	
	$(document).ready(function(){
	/* Model창 켜고 끄기 */
	$("#btn_draw_ck").click(function(){
		$("#modal_all").css("display", "block");
	});
	$("#close_btn").click(function(){
		
		$("#modal_all").css("display", "none");
	});
	$("#no_btn").click(function(){
		$("#modal_all").css("display", "none");
		
	});
	});
	
/* 	$(document).on("click","#yes_btn", function(){
		var nowPw = $("input_pw").val();
		alert("PW: "+nowPw);
		  $.ajax({
			url: "memberdeleteplay.bizpoll",
			type: "POST",
			dateType: "json",
			data: "id=${sessionScope.loginUser.id}&pw=" + nowPW,
			success: function(data) {
				if(data.message =="-1"){
					location.href="index.bizpoll";
				} else {
					$("#modal_all").css("display","none");
					$("#input_pw").next().text("정확한 비밀번호를 입력해주세요.");
					$("#input_pw").select();
					$("#input_pw").parent().css("margin-bottom", "30px");
				}
			},
			error:function(){
				alert("SYSTEM ERROR!!");
			}
		}); 
	}); */
	
</script>
</head>
<body id="body_draw">
	<div id="modal_all">
		<div id="modal_in">
			<div id="modal_up"><span id="draw">회원탈퇴</span><span id="close_btn"><i class="fa fa-close"></i></span></div>
			<div id="modal_text"><h3>정말 <span>CSone</span>을 탈퇴하겠습니까?</h3></div>
			<div id="yesno_btn">
				<div><a href="#" id="no_btn">아니오</a></div><div><a href="#" id="yes_btn">네</a></div>
			</div>
		</div>
	</div>
	
	<div id="content_layout">
		<header>
			<div id="header_div">
				<!-- <a href="http://localhost:8081/shop_csone/include/header.html">
					<img alt="scone 로고" src="img/logo_csone.png">
				</a> -->
			</div>
		</header>
		<section>
			<div id="draw_div">
					<h2>회원탈퇴</h2>
				<div id="draw_text">
					<h4>정말로 탈퇴하시겠습니까?</h4>
					<h5>그동안 이용한 서비스와 정보가 모두 사라지게 됩니다.</h5>
					<div id="text_div">
					<h6> 1. 계정정보는 <span class="text_color">'개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며,</span> 60일이 경과된 후에는 모든 개인 정보는 완전히 삭제되며 더 이상 복구할 수 없게 됩니다.</h6>
					<h6>2. 작성된 게시물은 삭제되지 않으며, 익명처리 후 <span class="text_color">CSone로 소유권이 귀속</span>됩니다.</h6>
					<h6>3. 게시물 삭제가 필요한 경우에는 <span class="text_color">관리자(CSone001@CSone.co.kr)</span>로 문의해주시기 바랍니다.</h6>
					</div>
				</div>
			</div>		
		</section>
		<section id="withdraw_input">
			<div class="div_withdraw" id="scone_id">
				<input type="text" name="input_id" value="${sessionScope.loginUser.id}" id="input_id" readonly="readonly" class="input_withdraw">
			</div>
			<div id="div_draw_pw"></div>
			<div class="div_withdraw" id="scone_pw">
				<input type="password" placeholder="비밀번호" id="input_pw" class="input_withdraw" name="input_pw">
				<span class="error">필수 정보입니다.</span>
			</div>
			
			
			
			<div id="pw_hr_under"><hr></div>
			
			
			<div><div><a href="#" id="btn_draw_ck2">취소</a></div><a href="#" id="btn_draw_ck">회원탈퇴</a></div>
			<br>
			<br>
			<br>
			<br>
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