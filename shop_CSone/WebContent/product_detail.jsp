<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- referer: 로그인하기 전의 url 주소를 가져온다! -->
<%
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Yeon+Sung');
body, ul{
	padding: 0;
	margin: 0;
}
body *:not(.fa){
	/*font-family: 'Noto Sans KR', sans-serif;*/
	font-family: 'Yeon Sung', cursive;
}
	#pd_body {
		padding: 0 auto;
		margin: 0 auto;
		
	}
	/* product 창 */
	.product_all {
		z-index: 10000;
		position: fixed;
		top:0px;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background: rgba(0,0,0,0.1);
		padding-top: 100px;
		display: block;
		
	}
	.product_in {
		border: 2px solid #a79c8e;
		border-radius: 15px;
		text-align: center;
		width: 1000px;
		height: 450px;
		background-color: #f2e9e1;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -300px;
		margin-left: -500px;
	}
	
	.product_left {
		font-size: 16px;
		text-align: left;
		color: white;
		background-color: #f9cdad;
		border-radius: 14px 14px 0 0;
	}
	
	.wrap_prd {
		padding: 40px 40px;
	}
	
	.draw {
		padding: 0 10px;
	}
	
	.close_btn {
		padding: 0 10px;
		float: right;
		color: white;
	}
	#pd_body h3 {
		font-weight: bold; 
	}
	#pd_body h3 > span{
		color: #fd999a;
	}
	.product_img {
		margin:0;
		margin-left: 20px;
		padding: 40px 40px;
		float: left;
	}
	.product_img> img{
		width: 300px;
    	height: 350px;
	}
	.product_text {
		margin: 0;
	}
	.option {
		cursor: pointer;
	}
	.option > * {
		list-style: none;
	}
	.cnt{
		line-height: 6;
	    margin: 20px 20px;
	    width: 100px;
	    height: 100px;
	    border: 1px solid pink;
	    border-radius: 100%;
	    background: pink;
	    display: inline-block;
		cursor: pointer;
	}
	.basket:hover{
		background-color: #ed8194;
		border-color: #ed8194;
	}
	.wish {
		background-color: #ace4ec;
		border-color: #ace4ec;
	}
	.wish:hover {
		background-color: #19d2ec;
		border-color: #19d2ec;
	}
	.close_btn {
		cursor: pointer;
	}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".close_btn").click(function(){
		location.href="<%=referer%>";
	});
});
</script>
</head>
<body id="pd_body">
<!-- 상세페이지 -->
<div class="product_all">
	<div class="product_in">
	<div class="product_left"><span class="draw">상품명</span><span class="close_btn"><i class="fa fa-close"></i></span></div>
		<div class="product_img"><img alt="" src="img/${productview.p_img}">
		</div>
	<!-- 상품옵션 전체영역 -->
	<div class="wrap_prd">
		<h3>${productview.p_name}<span> (${productview.p_detail})</span></h3>
		<div class="product_text">
		<span style="margin: 20px 10px">"${productview.p_text}"</span>
		</div>
		<div class="option" style="margin-top: 20px;">
		<ul><li class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>SIZE</li>
			<li class="content">
			<select>
			<option value="*"  link_image="">- [필수] 옵션을 선택해 주세요 -</option>
			<option value="**"  link_image="">-------------------</option>
			<option value="5p"  link_image="">5 peace</option>
			<option value="10p"  link_image="">10 peace</option>
			<option value="1c"  link_image="">1 cake</option>
			<option value="5c"  link_image="">5 cake</option>
			<option value="10c"  link_image="">10 cake</option>
			</select><p class="value"></p>
		</li></ul>
		</div>
		
		<div>
			<div class="cnt basket">장바구니</div>
			<div class="cnt wish">찜하기</div>
		</div>
		
	</div>
	
	</div>
</div> 
</body>
</html>
