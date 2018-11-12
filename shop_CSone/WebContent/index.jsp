<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- index.jps 페이지에 header.jsp 포함시킴 -->
<%@ include file="include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CSONE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
#indexbody {padding-top: 190px;}

* {/* box-sizing: border-box; */}

body {font-family: Verdana, sans-serif;
	min-width: 1320px;
}
hr {
	border: thin solid #fd999a;
	}
.mySlides {display: none;}

.img_main {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px; 
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}






/* 베스트 상품 */
/* 글자들 */
	.title_home{
		margin: 0 auto;
		text-align: center;
		font-size: 30px;
		padding: 30px 0px 0px 0px;
		margin-left: -10%;
	}
	.best_inner {
		padding: 0 auto;
		margin: 0 auto;
		text-align: center;
		padding-left: 8%;
	}
	/* new! 글자에 색 바뀌는 거 넣는 거 */
	@keyframes textColorAnimation{
		0%{color:blue;}/* 시작부분: 0%=from */
		50%{color:green;}
		100%{color:red;}/* 끝부분: 100%=to */
	}
	.new_font{
		font-size: 15px;
		animation-name:textColorAnimation;/* 설정애니메이션이름 */
		animation-duration:2s;/* 1회 애니메이션 동작 시간 */
		animation-iteration-count:infinite;/*반복횟수:무한반복  */
	}
	
	
	
	/* 상품부분 */
	.all_item{
		/* padding-left: 50px; */
	}
	
	.best_item{
		display: inline-block;
		margin: 0 auto;
		/* padding: 10px 150px; */
		margin-left: 180px;
	}
	.card_img {
		/* width: 296px;
		height: 240px; */
		width: 296px;
		height: 385px;
	}
	.area_thumbnail {
		box-sizing: border-box;
		display: inline-block;
		padding: 20px 40px;
	}
	.best_prise {
		float: right;
	}
	
	
	
	
	
/* 좋아요 */
.btn_like {
  position: relative;
  /* margin: 100px auto; */
  margin-left: 30%;
  display: inline-block;
  width: 44px;
  height: 44px;
  border: 1px solid #e8e8e8;
  border-radius: 44px;
  font-family: notokr-bold,sans-serif;
  font-size: 14px;
  line-height: 16px;
  background-color: #fff;
  color: #DD5D54;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
  cursor: pointer;
}

.btn_like:hover {
  border: 1px solid rgba(228,89,89,0.3);
  background-color: rgba(228,89,89,0.02);
  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
}

.btn_unlike .img_emoti {
    background-position: -30px -120px;
}

.img_emoti {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
    text-indent: -9999px;
    vertical-align: top;
    width: 20px;
    height: 17px;
    margin-top: 1px;
    background-position: 0px -120px;
    text-indent: 0;
}

.btn_like .ani_heart_m {
    margin: -63px 0 0 -63px;
}

.ani_heart_m {
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 125px;
    height: 125px;
    margin: -63px 0 0 -63px;
    pointer-events: none;
}

.ani_heart_m.hi {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
    -webkit-background-size: 9000px 125px;
    background-size: 9000px 125px;
    animation: on_m 1.06s steps(72);
}

.ani_heart_m.bye {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
    -webkit-background-size: 8250px 125px;
    background-size: 8250px 125px;
    animation: off_m 1.06s steps(66);
}

@keyframes on_m {
  from { background-position: 0 }
  to { background-position: -9000px }
}

@keyframes off_m {
  from { background-position: 0 }
  to { background-position: -8250px }
}	

/* modal 창 */
	/* modal 창 */
	.modal_all {
		z-index: 10000;
		position: fixed;
		top:0px;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background: rgba(0,0,0,0.1);
		padding-top: 100px;
		display: none;
		
	}
	.modal_in {
		border: 2px solid #a79c8e;
		border-radius: 15px;
		text-align: center;
		width: 1000px;
		height: 700px;
		background-color: #f2e9e1;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -350px;
		margin-left: -500px;
	}
	.modal_up {
		font-size: 16px;
		text-align: left;
		color: white;
		background-color: #f9cdad;
		border-radius: 14px 14px 0 0;
	}
	.draw {
		padding: 0 10px;
	}
	
	.close_btn {
		padding: 0 10px;
		float: right;
		color: white;
	}
	h3 > span {
		color: #fd999a;
		font-weight: bold; 
	}
	.modal_img {
		margin: 15px auto;
		padding: 0 auto;
		width: 537x;
		height: 537px;
		float: left;
	}
	.modal_img> img{
		width: 400px;
		height: 400px;
	}
	.yesno_btn {
		margin-left: 28%;
	}
	.yes_btn{
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
	.no_btn {
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
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	/* Model창 켜고 끄기 */
	$(".card_img").click(function(){
		$(".modal_all").css("display", "block");
	});
	$(".close_btn").click(function(){
		
		$(".modal_all").css("display", "none");
	});
	$(".no_btn").click(function(){
		$(".modal_all").css("display", "none");
		
	});
	});
</script>
</head>
<body id="indexbody">
<form action="">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 4</div>
  <img class="img_main" src="img/main_01.jpg" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 4</div>
  <img class="img_main" src="img/main_02.png" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 4</div>
  <img class="img_main" src="img/main_03.jpg" style="width:100%">
  <div class="text">Caption Three</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 4</div>
  <img class="img_main" src="img/main_04.png" style="width:100%">
  <div class="text">Caption Four</div>
</div>

</div>
<br>

<div style="text-align:center;">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</form>

		<!-- 베스트 아이템 -->
		<div id="best_item" class="all_item">
			<!-- 글자  -->
			<h4 class="title_home">
			<span class="best_inner">BEST상품</span>
			</h4>
			<form>
				<div class="best_item">
			<c:forEach items="${bestlist}" var="bestDto">
						<div class="area_thumbnail">
								<strong class="title">${bestDto.p_name}</strong>
							<div class="thumbnail">
								<img class="card_img" src="img/${bestDto.p_img}">
								<!-- 상세페이지 -->
								 <div class="modal_all">
								 <div class="modal_in">
								  <div class="modal_up"><span class="draw">${bestDto.p_name}</span><span class="close_btn"><i class="fa fa-close"></i></span></div>
								  <div class="modal_img"><img alt="" src="img/${bestDto.p_img}"><h3>${bestDto.p_name}<span> (${bestDto.p_detail}) </span></h3></div>
								  <div class="modal_text">
								   <h4>"${bestDto.p_text}"</h4>
							 	  </div>
								 </div>
								</div> 
								<!-- <img alt="상품1" src="img/main1.png" width="296" height="240" class="imege">	 -->
							</div>
							<div class="area_title">
								<%-- <strong class="best_prise">${bestDto.p_price}</strong> --%>
								<div class="like">
								<fmt:setLocale value="ko_kr"/><!-- ko_kr: 원화, en_ur: 달러, ja_jp: 엔화 -->
								<span>가격: <fmt:formatNumber value="${bestDto.p_price}" type="currency"/></span>
<%-- 								<span>가격: <fmt:formatNumber value="0.25" type="percent"/></span>
								<span>가격: <fmt:formatNumber value="3.141589" pattern="#.##"/></span> --%>
								<button type="button" class="btn_like">
								<span class="img_emoti">좋아요</span>
  								<span class="ani_heart_m"></span>
								</button>
								<span>${bestDto.p_goodcnt}</span>
								</div>
							</div>
						</div>
					<!-- <div class="area_status"></div> -->
		</c:forEach>
				</div>
		</form>
		</div>
		
		<br>
		
		<!-- new 아이템 -->
		<div id="best_item" class="all_item">
			<!-- 글자  -->
			<h4 class="title_home">
			<span class="best_inner">NEW 상품</span>
			</h4>
			<form>
			<div class="best_item">
			<c:forEach items="${newlist}" var="newDto">
						<div class="area_thumbnail">
								<strong class="title">${newDto.p_name}</strong>
							<div class="thumbnail">
								<img class="card_img" src="img/${newDto.p_img}">
								<!-- <img alt="상품1" src="img/main1.png" width="296" height="240" class="imege">	 -->
							</div>
							<div class="area_title">
								<%-- <strong class="best_prise">${bestDto.p_price}</strong> --%>
								<div class="like">
								<fmt:setLocale value="ko_kr"/><!-- ko_kr: 원화, en_ur: 달러, ja_jp: 엔화 -->
								<span>가격: <fmt:formatNumber value="${newDto.p_price}" type="currency"/></span>
<%-- 								<span>가격: <fmt:formatNumber value="0.25" type="percent"/></span>
								<span>가격: <fmt:formatNumber value="3.141589" pattern="#.##"/></span> --%>
								<button type="button" class="btn_like">
								<span class="img_emoti">좋아요</span>
  								<span class="ani_heart_m"></span>
								</button>
								<span>${newDto.p_goodcnt}</span>
								</div>
							</div>
						</div>
					<!-- <div class="area_status"></div> -->
		</c:forEach>
		</div>
		</form>
		</div>


</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"> 
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}



$('button').click(function(){
	  if($(this).hasClass('btn_unlike')){
	    $(this).removeClass('btn_unlike');
	    $('.ani_heart_m').removeClass('hi');
	    $('.ani_heart_m').addClass('bye');
	  }
	  else{
	    $(this).addClass('btn_unlike');
	    $('.ani_heart_m').addClass('hi');
	    $('.ani_heart_m').removeClass('bye');
	  }
	});
</script>
</html>
<%@ include file="include/footer.jsp" %>