<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

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
		height: 500px;
		background-color: #f2e9e1;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -350px;
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
	#pd_body h3 > span {
		color: #fd999a;
		font-weight: bold; 
	}
	.product_img {
		margin: 15px auto;
		padding: 40px 40px;
		width: 537x;
		height: 537px;
		float: left;
	}
	.product_img> img{
		width: 400px;
		height: 400px;
	}
	.product_text {
		padding: 0 auto;
		margin: 0 auto;
		padding-right: 40px;
		display: inline-block;
	}
	.option > * {
		list-style: none;
	}
</style>
</head>
<body id="pd_body">
<!-- 상세페이지 -->
<div class="product_all">
	<div class="product_in">
	<div class="product_left"><span class="draw">상품명</span><span class="close_btn"><i class="fa fa-close"></i></span></div>
		<div class="product_img"><img alt="" src="img/Cake_01.jpg">
		</div>
	<!-- 상품옵션 전체영역 -->
	<div class="wrap_prd">
		<h3>갸또쇼콜라<span> (Gateau au Chocolat)</span></h3>
		<div class="product_text">
		<h4>"리얼 초콜릿의 진하면서도 깊은 맛이 느껴지는 초코 케이크"</h4>
		</div>
		<div class="option">
		<ul><li class="title"><i class="fa fa-angle-right" aria-hidden="true"></i>옵션</li>
			<li class="content">
			<select>
			<option value="*"  link_image="">- [필수] 옵션을 선택해 주세요 -</option>
			<option value="**"  link_image="">-------------------</option>
			<option value="핑크"  link_image="">핑크</option>
			<option value="레드"  link_image="">레드</option>
			<option value="모카"  link_image="">모카</option>
			<option value="그레이"  link_image="">그레이</option>
			<option value="블랙"  link_image="">블랙</option>
			</select><p class="value"></p>
		</li></ul>
		</div>	
	</div>
	
	</div>
</div> 
</body>
</html>