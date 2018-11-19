<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#constract_index > header {padding-top: 100px;}
#constract_index, #constract_index ul, #constract_index p {
	margin: 0;
	padding: 0;
}
#constract_index {
	/* background-color: #fffcf0; */
}
#constract_index a {
	text-decoration: none;
}
#constract_index ul {
	list-style: none;
}
hr {
	border: thin solid #fd999a;
}
.divsize {
	width: 768px;
	margin: 0 auto;
	box-sizing: border-box;
}
#header {
	height: 169px;
	padding-top: 62px;
	position: relative;
}
#scone_logo {
	margin: 0;
	padding: 0;
}
.n_logo {
	display: block;
	width: 240px;
	height: 70px;
	margin: 0 auto;
	box-sizing: border-box;
	background: url("img/logo_csone.png") 50% 100% no-repeat;
}
.lang {
	position: absolute;
	right: 0px;
	top: 14px;
}
#langselect {
	font-size: 12px;
	font-weight: 400;
	height: 30px;
	padding: 6px 8px 5px 7px;
	min-width: 98px;
	border: 1px solid #ccc;
	-webkit-appearance: none;
	background-color: white !important;
	width: 98px;
	background: url("img/sel_arr.gif") 100% 50% no-repeat;
}

 

/*container*/
#container {
	position: relative;
}
#join_content {
	width: 460px;
	margin: 0 auto;
}
.terms {
	margin-bottom: 20px;
	background-color: white;
	border: 1px solid #dadada;
}
.terms_p {
	position: relative;
	margin: 0px;
	padding: 15px;
	display: block;
}
.terms_span {
	position: relative;
	display: block;
	height: 58px;
}
.terms_span>input {
	position: absolute;
	right: 1px;
	top: 50%;
	width: 22px;
	height: 22px;
	margin-top: -11px;
	visibility: hidden;
}
.terms_span>input:checked +label {
	background-image: url("img/logo_check_on.gif");
}
.terms_span>label {
	font-size: 14px;
	font-weight: 700;
	top: -1px;
	height: 58px;
	line-height: 20px;
	display: block;
	cursor: pointer;
	background: url(img/logo_check_off.gif) 100% 50% no-repeat;
}
#terms_ul {
	padding-bottom: 7px;
}
#terms_ul>li {
	display: block;
	padding: 13px 15px 7px;
}
#terms_ul_li1 {
	border-top: 1px solid #f0f0f0;
}
.ul_li_span {
	position: relative;
	display: block;
	height: 24px;
}
.ul_li_span>input {
	position: absolute;
	right: 1px;
	top: 50%;
	margin-top: -11px;
	width: 22px;
	visibility: hidden;
}
.ul_li_span>input:checked +label {
	background-image: url("img/logo_check_on.gif");
}
.ul_li_span>label {
	background: url("img/logo_check_off.gif") 100% 50% no-repeat;
	display: block;
}
.label1 {
	height: 24px;
	font-size: 14px;
	font-weight: 700;
	line-height: 24px;
	position: absolute;
	color: #333;
	top: 0px;
	left: 0px;
	width: 100%;
}
.span_only {
	color: #fd999a;
	font-size: 12px;
	font-weight: 400;
	font-weight: bold;
}
.span_select {

	color: #f9cdad;

	font-size: 12px;

	font-weight: 400;

	font-weight: bold;

}

 

.terms_box {

	box-sizing: border-box;

	position: relative;

	height: 88px;

	margin-top: 11px;

	padding: 8px 10px;

	border: 1px solid #f0f0f0;

	background-color: #f7f7f7;

	overflow: auto;

}

 

.article {

	margin-top: 0px;

}

 

h3.article_title {

	font-size: 12px;

	font-weight: 700;

	line-height: 16px;

	color: #666;

	margin: 0;

	padding: 0;

	padding-bottom: 8px;

}

 

.article>p {

	display: block;

	font-size: 12px;

	line-height: 16px;

	color: #666;

}

 

.btn_type {

	width: auto;

	margin: 0px 5px;

	font-size: 20px;

	font-weight: 600;

	line-height: 61px;

	display: block;

	box-sizing: border-box;

	height: 61px;

	padding-top: 1px;

	text-align: center;

}

 

.btn_agree {

	color: #fff;

	border: 1px solid #fd999a;

	background-color: #fd999a;

}

 

.btn_default {

	color: #333;

	border: 1px solid #e7e7e7;

	background-color: #fff;

}

 

.btn_double_area {

	margin: 30px -5px 0px;

	overflow: hidden;

}

 

.btn_double_area>span {

	display: block;

	float: left;

	width: 50%;

}

 

.group_join {

	margin: 20px 0 65px;

	text-align: center;

	color: #666;

	font-size: 12px;

}

 

.group_join>a {

	text-decoration: underline;

	color: #333;

}

 


#err_check_msg {
	display: inline-block;
	width: 428px;
	height: 24px;
	font-size: 11px;
	font-weight: 700;
	line-height: 24px;
	color: #f46665;
	padding: 0px 15px;
	text-align: center;
}
#err_check {
	display: none;
}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"> 

	$(document).ready(function(){
		$("#cbox").click(function(){
			/* checked ⇒ nonchecked
			   nonchecked ⇒ checked */
			var ckAll = $("#cbox").is(":checked");
			/* 전체체크 ⇒ ckAll true
			   전체체크X ⇒ ckAll false  */
			/* alert("상태: "+ckAll);
			true일때 전부다 키고, false 일때 전부다 끈다. */

			if(ckAll == true) {
				alert("상태: "+ckAll);
			 /* $("#li1box").prop("checked", true);
				$("#li2box").prop("checked", true);
				$("#li3box").prop("checked", true);
				$("#li4box").prop("checked", true); */
				$(".ckboxs").prop("checked", true);
			} else {
				alert("상태: "+ckAll);
			 /* $("#li1box").prop("checked", false);
				$("#li2box").prop("checked", false);
				$("#li3box").prop("checked", false);
				$("#li4box").prop("checked", false); */
				$(".ckboxs").prop("checked", false);
			}
		});

		

		/* 선택버튼 전부 다 클릭시 전체버튼 클릭 */
		$(document).on("click", ".ckboxs", function(){
			var ck1 = $("#li1box").is(":checked");
			var ck2 = $("#li2box").is(":checked");
			var ck3 = $("#li3box").is(":checked");
			var ck4 = $("#li4box").is(":checked");

			if(ck1 == true && ck2 == true && ck3 == true && ck4 == true) {
				$("#cbox").prop("checked", true);
			}else {
				$("#cbox").prop("checked", false);
			}
		});

		

		/* 동의버튼 클릭 시 */
		$(".btn_agree").click(function(){
			var filsu1 = $("#li1box").is(":checked");
			var filsu2 = $("#li2box").is(":checked");

			/* alert(filsu1+","+filsu2); */
			if(filsu1 == true && filsu2 == true) {
				location.href = "member_join.jsp"
				/* $(".btn_agree").attr("href","http://localhost:8081/shop_csone/member.html"); */
			} else {
				$("#err_check").css("display", "block");
			}
		});
	});
</script>
</head>
<body id="constract_index">
	<header>
		<div id="header" class="divsize">
			<h1 id="scone_logo">
				<a href="http://localhost:8081/shop_csone/include/header.html" class="n_logo"></a>
			</h1>
			<div class="lang">
				<select id="langselect">
					<option>한국어</option>
					<option>English</option>
					<option>中國語</option>
				</select>
			</div>
		</div>
	</header>

	<article>
		<div id="container" class="divsize">
			<form id="join_content">
				<div class="terms">
					<p class="terms_p">
						<span class="terms_span"> <input type="checkbox" id="cbox">
							<label for="cbox"> 이용약관, 개인정보 수집 및 이용, <br> 위치정보
								이용약관(선택), 프로모션 안내<br> 메일 수신(선택)에 모두 동의합니다.
						</label>
						</span>
					</p>
					<ul id="terms_ul">
						<li id="terms_ul_li1"><span class="ul_li_span">
						 <input type="checkbox" id="li1box" class="ckboxs">
						  <label for="li1box" class="label1"> CSONE 이용약관 동의<span class="span_only">(필수)</span>
							</label>
						</span>
							<div class="terms_box">
								<div class="article">
									<h3 class="article_title">여러분을 환영합니다.</h3>
									<p>
										CSONE 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 <br>다양한CSONE
										서비스의 이용과 관련하여 CSONE 서비스를 제공하는CSONE 주식회사(이하 ‘CSONE’)와 이를 이용하는 CSONE
										서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, <br> 아울러 여러분의 CSONE 서비스
										이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
									</p>
									<br>
									<h3 class="article_title">제 2 조 (목적)</h3>
									<p></p>
									<br>
								</div>
							</div>
						</li>
						<li id="terms_ul_li2">
						 <span class="ul_li_span">
						 <input type="checkbox" id="li2box" class="ckboxs">
						  <label for="li2box" class="label1"> 개인정보 수집 및 이용에 대한 안내
						  	<span class="span_only">(필수)</span>
						  </label>
						</span>
							<div class="terms_box">
								<div class="article">
									<p>
										정보통신망법 규정에 따라CSONE에 회원가입 신청하시는 분께 수집하는 개인<br> 정보의 항목,
										개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 <br> 안내 드리오니 자세히 읽은 후
										동의하여 주시기 바랍니다.
									</p>
									<br>
									<h3 class="article_title">1. 수집하는 개인정보</h3>
									<p>
										이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의CSONE <br>서비스를 회원과
										동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, <br>블로그 등과 같이 개인화 혹은
										회원제 서비스를 이용하기 위해 회원가입을 할<br> 경우,CSONE는 서비스 이용을 위해 필요한 최소한의
										개인정보를 수집합니다.
									</p>
								</div>
							</div>
						</li>
						<li id="terms_ul_li3">
						 <span class="ul_li_span"> 
							<input type="checkbox" id="li3box" class="ckboxs"> 
								<label for="li3box" class="label1"> 위치정보 이용약관 동의
								<span class="span_select">(선택)</span>
							</label>
						</span>
							<div class="terms_box">
								<div class="article">
									<p>위치정보 이용약관에 동의하시면, <strong>위치를 활용한 광고 정보 수신</strong> 등을 포함하<br>는CSONE 위치기반 서비스를 이용할 수 있습니다.</p>
									<br>
									<h3 class="article_title">제 1 조 (목적)</h3>
									<p>이 약관은CSONE 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치<br> 기반서비스사업과관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임
									<br> 사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
									</p>
								</div>
							</div></li>
						<li id="terms_ul_li4">
						 <span class="ul_li_span">
							<input type="checkbox" id="li4box" class="ckboxs">
							<label for="li4box" class="label1">이벤트 등 프로모션 알림 메일 수신
							<span class="span_select">(선택)</span>
							</label>
						 </span>
					   </li>
					</ul>
				</div>
				<div id="err_check">
					<span id="err_check_msg">CSONE 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
				</div>
				<div class="btn_double_area">
					<span><a href="#" class="btn_type btn_default">비동의</a></span>
					<span><a href="member.bizpoll" class="btn_type btn_agree">동의</a></span>
				</div>
			</form>
			<div class="group_join">
				회사, 동아리 등 단체에서 사용할 ID가 필요하세요? <a href="#">단체 회원 가입</a>
			</div>
		</div>
	</article>


</body>
</html>
<%@ include file="include/footer.jsp" %>