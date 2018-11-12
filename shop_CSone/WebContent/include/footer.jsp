<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style type="text/css">
	/* footer */
	#footer_body hr {
		border: thin solid #fd999a;
		box-sizing: border-box;
		margin: 0;
		padding: 0;
	}
  	#goon{
		margin: 0;
		padding: 0;
		background-color: #fffcf0;
		height: 30px;
	} 
	 
	#footer_body{
		background-color: white;
		/* background-color: #fffcf0; */
		margin: 0 auto;
		padding: 0 auto;
	}
	#footer-wrapper{
		min-width: 1320px;
		display: block;
		margin: 0 auto;
		padding: 0 auot;
	}
	#footer-inner-wrapper{
		/* padding-left: 30%; */
		text-align: center;
	}
	#footer-inner-wrapper img{
		display: inline-block;
	}
	#footer-inner-wrapper> table{
		/* padding-left: 10%; */
		text-align: center;
		display: inline-block;
	}
	
	.footer-th{
		/* padding-left: 30px; */
		text-align: center;
	}
	#footer_body p{
		/* padding-left: 10%; */
		font-size: 11px;
	}
	
	
	
	#footer {
		padding: 15px 0;
	}
	#footer * {
		font-size: 11px;
		line-height: normal;
		list-style: none;
		color: #333;
	}
	#footer > ul {
		text-align: center;
		margin: 0 auto 9px;
	}
	#footer > ul  li {
		display: inline-block; /* float: left;-display: block인 대신 */
		border-left: 1px solid #fec9c9;
		padding: 0 5px 0 7px;
	}
	#footer > ul li:first-child {
		border-left: 0px!important; /* 최우선으로 CSS 적용(root) */
									/* 남발해서 사용 X */
									/* CSS 속성으로 해결하고, 최후에 사용할 것을 권장 */
	}
	#footer_body #address {
		margin: 0 auto;
		text-align: center;
	}
	#footer_body #address * {
		font: 9px verdana;
	}
	#footer_body #addr_logo {
		/* width: 63px;
		height: 11px; */
		width: 40px;
		height: 30px;
	}
	#address a {
		font-weight: bold;
	}
	#footer_body a:hover {
		text-decoration: underline;
	}
	#footer > ul > li a:hover {
		color: #fec8c9;
	}
</style>
</head>
<body id="footer_body">
	<div id="goon">
	<div id="footer" class="divsize">
			<ul>
				<li><a href="http://localhost:8081/shop_csone/constract.html">이용약관</a></li>
				<li><strong><a href="#">개인정보처리방침</a></strong></li>
				<li><a href="#">책임의 한계와 법적고지</a></li>
				<li><a href="#">회원정보 고객센터</a></li>
			</ul>
			<div id="address">
				<span><a href="http://localhost:8081/shop_csone/include/header.html">
				<img id="addr_logo" src="img/logo_csone_s.png" width="40" height="40"></a></span>
				<span>Copyright</span>
				<span>ⓒ <strong><a href="#">sconeCorp.</a></strong></span>
				<span>All Rights Reserved.</span>
			</div>
	</div>
	</div>
		<hr>
	<footer>
		<div id="footer-wrapper">
			<div id="footer-inner-wrapper">
			<table>
				<thead>
					<tr>
					<th><img alt="" src="img/QRcoding.jpg"></th>
					<th class="footer-th">공지사항</th>
					<th class="footer-th">기관소개</th>
					<th class="footer-th">찾아오시는 길</th>
					</tr>
				</thead>
			</table>
			<p>광주광역시 북구 중흥동 712-3 한경빌딩 5층</p>
			<p>062-720-4800</p>
			<p>http://www.edupoll.net/</p>
			</div>
			
		</div>
		
	</footer>
</body>
</html>