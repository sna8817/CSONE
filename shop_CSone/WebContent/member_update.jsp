<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_update</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
#body_join {
	padding-top: 150px;
}
	body {
		margin: 0;
		padding: 0;
		background-color: #fffcf0;
		font-family: 'Nanum Gothic', sans-serif;
	}
	a {
		text-decoration: none;
	}
	ul {
		list-style-type: none;
	}
	#signin_wrap {
		width: 460px;
		margin: 0 auto;
		padding-top: 50px;
	}
	h1 {
		text-align: center;
		color: #fec9c9;
	}
	input:focus {
		outline: none;
	}
	.div_input {
		background-color: white;
		border-bottom: 2px solid #dadada;
		width: 408px;
		height: 29px;
		margin-top: 30px;
		padding: 10px 35px 10px 15px;
		position: relative;
	}
	.input_signin {
		width: 408px;
		height: 16px;
		border-width: 0px;
		padding: 7px 0px 6px 0px;
		cursor: pointer;
	}
	label {
		font-size: 14px;
		position: absolute;
		z-index: 1;
		transition: all .4s cubic-bezier(.25,.8,.25,1);
		transition-duration: 0.3s;
		color: #979797;
		top: 14px;
		left: 15px;
	}
	.check {
		font-size: 12px;
		color: #fd999a;
		padding-left: 15px;
	}
	hr {
		margin: 20px auto;
		border: thin solid #fd999a;
	}
	#btn_member_login {
		width: 460px;
		height: 59px;
		font-size: 22px;
		text-align: center;
		background-color: #fd999a;
		color: white;
		display: block;
		padding-top: 2px;
		line-height: 55px;
		margin-top: 30px;
	}
	
	
	
	
	
	
	
#wrap_email input {
	width: 200px;
	height: 30px;
	box-sizing: border-box;
	padding: 5px 5px;
}
#wrap_email select {
	margin: 0 auto;
 	padding: 0 10px;
	width: 435px;
	height: 30px;
	box-sizing: border-box;
}
#wrap_email {
	padding: 5px;
	display: inline-block;
}

#wrap_email>* {
	float: left;
	margin-right: 10px;
}
.error {
	padding-top: 10px;
	color: red;
	font-size: 11px;
	display: none;
}
#wrap_addr {
	display: inline-block;
	box-sizing: border-box;
	padding: 5px;
}
#wrap_addr input {
	width: 220px;
	height: 30px;
	box-sizing: border-box;
	padding: 5px 5px;
}
#addr_find {
	border: 0;
	background-color: #fd999a;
	color: white;
}
#member_last_wrap {
	padding-top: 20px;
}



</style>


<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".input_signin").focus(function() {
			$(this).parent().css("border-bottom", "2px solid #fd999a");
			$(this).prev().css("top", "-18px").css("font-size","12px").css("color","#452018");
		});
		$(".input_signin").blur(function() {
			$(this).parent().css("border-bottom", "2px solid #dadada");
			var input_val = $(this).val();
			if(input_val==""){
				$(this).prev().css("top", "14px").css("font-size","14px").css("color","#979797");
				$(this).next().css("display","block");
			}else{
				$(this).next().css("display","none");
			}
			
		});
	
		
		
		/* $(".input_signin").blur(function(){
			var inputval = $(this).val();
			if(inputval == ""){
				$(this).next().css("display","block");
				$(this).parent().css("margin-bottom", "12px");
			} else{
				$(this).next().css("display","none");
				$(this).parent().css("margin-bottom", "5px");
			}
		}); */
	});
	
	
	
	
	
	
	
	
	
	
	$(document).ready(function(){
		$("#selmail").change(function(){
			/* input과 select는 .val()로 값을 받아온다. */
			/* #selmail의 value 값을 selmail 변수에 담아라! */
			var selmail = $("#selmail").val();
			
			if(selmail == "directVal"){
				/* 기존에 있던 값 지우기 */
				$("#email_url").val("");
				$("#email_url").focus();
			} else {
				/* #email_url의 value 속성에 selmail 변수에 값을 넣어라! */
				$("#email_url").val(selmail);
			}
		});
			
			
			
		/* 우편번호, 주소 클릭시 다음 우편번호 API 실행 */
		$(".addrbtn").click(function(){
			$("#addr_btn").click();	
		});
			
			
		/* 이메일 주소 자르기!! */
		/* ${sessionScope.loginUser.email} = asd123@navercom */
		/* @의 index값 추출 후, 0~@index값 까지 = email id값, @index~끝까지 =  emailurl */
		var email_info = "${sessionScope.loginUser.email}";
		var index = email_info.indexOf("@");
		var emailid = email_info.substring(0,index);
		var emailurl = email_info.substring(index + 1);
		alert(email_info + ", "+index+", "+emailid+", "+emailurl);
		
		$("#email_id").val(emailid);
		$("#email_url").val(emailurl);
		
	});
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 $(document).on("click", ".btn_agree", function(){
		/* 유효성 체크하는 값 받아오기 */
		var
		form = $("#frm_mem");
		mid= $(inputid);
		mpw= $(inputpw);
		mpw2= $(inputpw2);
		mname= $(inputname);
		mphone= $(inputphone);
		memail1= $(email_id);
		memail2= $(email_url);
		zipcode= $(sample6_postcode);
		maddr1= $(sample6_address);
		maddr2= $(sample6_address2);
		
		/* 유효성체크 */
		/* trim: 앞뒤 공백 제거 */
		var id=$.trim(mid.val());
		var regid = /^[a-zA-Z0-9]{4,12}$/; /* 4~12자 까지 영대소문자와 숫자만 입력가능 */
		if(id==""){
			mid.focus();
			mid.next().text("필수정보 입니다.").css("display","block");
			mid.parent().css("margin-bottom","30px");
			return false; /* 이걸해야 submit이 안됨! 꼭 해야함 */
		
		} else if (!regid.test(id)) {
			mid.focus();
			mid.next().text("4~12까지의 영문자와 숫자만 입력하세요.").css("display","block");
			mid.parent().css("margin-bottom","30px");
			return false; /* 이걸해야 submit이 안됨! 꼭 해야함 */
		}
		
		var pw = $.trim(mpw.val());
		var pw2 = $.trim(mpw2.val());
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;/* 영문자, 숫자 포함 특수문자 사용가능 8~20자리 */
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
		} else if(pw2 == ""){
			mpw2.focus();
			mpw2.next().text("필수정보 입니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		} else if(pw != pw2){
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지않습니다.").css("display","block");
			mpw2.parent().css("margin-bottom","30px");
			return false;
		}
		 
		var name = $.trim(mname.val());
		if(name = "") {
			mname.focus();
			mname.next().text("필수정보 입니다.").css("display","block");
			mname.parent().css("margin-bottom","30px");
			return false;
		}
		
		var phone = $.trim(mphone.val());
		var regphone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		/* var regphone = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; */
		/* var rephone = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/; */
		/* var regphone =/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; */
		
		if(phone == "") {
			mphone.focus();
			mphone.next().text("필수정보 입니다.").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
			
		} else if($.isNumeric(phone)==false){/* 숫자값만 들어왔는지 체크 */
			mphone.select();
			mphone.next().text("숫자만 임력하세요.").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
		} else if(!regphone.test(phone)){
			mphone.focus();
			mphone.next().text("올바른 값을 입력하세요").css("display","block");
			mphone.parent().css("margin-bottom","30px");
			return false;
		}
	 
		var mailid = $.trim(memail1.val());
		var mailurl = $.trim(memail2.val());
		/* var mail = meailid.val() + "@" + meailurl.val(); */
		var mail = mailid + "@" +mailurl;
		var regMail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(mailid == ""){
			mailid.focus();
			$("#selmail").next().text("필수정보 입니다.").css("display","block");
			memail1.parent().css("margin-bottom","30px");
			return false;
			
		} else if(mailurl==""){
			mailurl.focus();
			$("#selmail").next().text("필수정보 입니다.").css("display","block");
			memail2.parent().css("margin-bottom","30px");
			return false;
		} else if(!regMail.test(mail)){
			mailid.select();
			mail.next().text("Email형식이 올바르지 않습니다").css("display","block");
			/* mail.parent().css("margin-bottom","30px"); */
			return false;
		}
		
		
		var zipcodeVal =  $.trim(zipcode.val());
		var addr1 = $.trim(maddr1.val());
		var addr2 = $.trim(maddr2.val());
		
		if(zipcodeVal==""){
			
			zipcodeVal.parent().children().last().text("필수정보 입니다.").css("display","block");
			/* zipcodeVal.parent().css("margin-bottom","30px"); */
			return false;
		} else if (addr1== ""){
			
			addr1.parent().children().last().text("필수정보 입니다.").css("display","block");
			/* addr1.parent().css("margin-bottom","30px"); */
			return false;
		} else if (addr2==""){
			addr2.focus();
			addr2.parent().children().last().text("필수정보 입니다.").css("display","block");
		/* 	addr2.parent().css("margin-bottom","30px"); */
			return false;
		}
		
		
		
		/* 유효성체크 값이 유효한 값 확인 끝! */
		form.submit(); /* -->> DB로 보낸다!! */
		
	});
		
		
		
		
	
	
	
	
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>

    function sample6_execDaumPostcode() {

        new daum.Postcode({

            oncomplete: function(data) {

                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

 

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.

                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                var fullAddr = ''; // 최종 주소 변수

                var extraAddr = ''; // 조합형 주소 변수

 

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

                    fullAddr = data.roadAddress;

 

                } else { // 사용자가 지번 주소를 선택했을 경우(J)

                    fullAddr = data.jibunAddress;

                }

 

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.

                if(data.userSelectedType === 'R'){

                    //법정동명이 있을 경우 추가한다.

                    if(data.bname !== ''){

                        extraAddr += data.bname;

                    }

                    // 건물명이 있을 경우 추가한다.

                    if(data.buildingName !== ''){

                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);

                    }

                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.

                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');

                }

 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.

                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용

                document.getElementById('sample6_address').value = fullAddr;

 

                // 커서를 상세주소 필드로 이동한다.

                document.getElementById('sample6_address2').focus();

            }

        }).open();

    }

</script>
</head>
<body id="body_join">
	<div id="signin_wrap">
		<h1>회원정보 수정</h1>
		<section>
			<form name="frm_mem" action="memberupdateplay.bizpoll" method="POST" id="frm_mem">
				<div class="div_input" id="signin_id">
					<label for="inputid" id="la_id">아이디</label>
					<input type="text" id="inputid" class="input_signin" name="inputid" readonly="readonly" value="${sessionScope.loginUser.id}">
					<span class="error">필수 정보입니다.</span>
				</div>
				<!-- <div id="id_check" class="check">사용 가능한 아이디입니다.</div> -->
				<div class="div_input" id="signin_pw">
					<label for="inputpw" id="la_pw">비밀번호</label>
					<input type="password" 	id="inputpw" class="input_signin" name="inputpw">
					<span class="error">필수 정보입니다.</span>
				</div>
				<div class="div_input" id="signin_pw2">
					<label for="inputpw2" id="la_pw2">비밀번호 재확인</label>
					<input type="password" id="inputpw2" class="input_signin">
					<span class="error">필수 정보입니다.</span>
				</div>
				<!-- <div id="pw2_check" class="check">비밀번호가 일치합니다.</div> -->
				<div><hr></div>
				<div class="div_input" id="signin_name">
					<label for="inputname" id="la_name">이름</label>
					<input type="text" id="inputname" class="input_signin" name="inputname" value="${sessionScope.loginUser.name}">
					<span class="error">필수 정보입니다.</span>
				</div>
				<div class="div_input" id="signin_phone">
					<label for="inputphone" id="la_phone">전화번호</label>
					<input type="text" id="inputphone" class="input_signin" name="inputphone" value="${sessionScope.loginUser.phone}">
					<span class="error">필수 정보입니다.</span>
				</div>
				<!-- <div class="div_input" id="signin_address">
					<label for="inputaddress" id="la_address">주소</label>
					<input type="text" id="inputaddress" class="input_signin">
				</div>
				<div class="div_input" id="signin_email">
					<label for="inputemail" id="la_email">이메일</label>
					<input type="text"  id="inputemail" class="input_signin">
				</div> -->
				
		<div id="member_last_wrap">
		<div id="wrap_email">
		<input type="text" id="email_id" placeholder="ID" name="email_id" class="input_signin"> <span>
			@ </span> <input type="text" id="email_url" placeholder="URL" name="email_url" class="input_signin"> <select
			id="selmail">
			<option value="" selected="selected">Email 선택</option>
			<option value="directVal">직접 입력</option>
			<option value="naver.com">naver.com(네이버)</option>
			<option value="daum.net">daum.net(다음카카오)</option>
			<option value="gamil.com">gamil.com(구글)</option>
			<option value="nate.com">nate.com(네이트)</option>
		</select>
			<span class="error">필수 정보입니다.</span>
		</div>
				
			<div id="wrap_addr">
			<input type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly" name="sample6_postcode" class="input_signin" value="${sessionScope.loginUser.zipcode}">
			<input type="button" id="addr_find" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" placeholder="주소" readonly="readonly" name="sample6_address" class="input_signin" value="${sessionScope.loginUser.addr1}">
			<input type="text" id="sample6_address2" placeholder="상세주소" name="sample6_address2" class="input_signin" value="${sessionScope.loginUser.addr2}">
			<span class="error">필수 정보입니다.</span>
			</div>	
		</div>
				
				
				
				
				<div>
					<a href="#" id="btn_member_login" class="btn_agree">회원수정</a>
				</div>
			</form>
		</section>
		
		
		<hr>
	
	</div>
</body>
</html>
<%@ include file="include/footer.jsp" %>