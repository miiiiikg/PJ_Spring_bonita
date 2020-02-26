<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
	<style type="text/css">
		div {
			display: block;

		}
		div.content_wrap {
			width: 100%;
			background-color: white;
		}
		div.content {
			width: 1400px;
			margin: 0 auto;
			box-sizing: border-box;
			/*height: 300px;*/ /*임시로 고정 나중에 삭제할것!*/
			/*border: 1px solid red;*/
		}
		* {box-sizing: border-box;}
		body {font-family: Verdana, sans-serif;}
		.mySlides {display: none;}
		img {vertical-align: middle;}

		/* Slideshow container */
		.slideshow-container {
		  max-width: 1000px;
		  position: relative;
		  margin: auto;
		}

		/* Caption text */
		.text {
		  color: #000000;
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

		/*===================================================================================이미지*/

		.top-service {
			height: 60px;
			text-align: center;
			border-top: 1px solid #ddd;
			border-bottom: #ddd;
		}
		.container {
			position: relative;
			width: 1260px;
			margin:0 auto;
		}
		.dn {
			display: none !important;
		}
		.top-service ul.category.type-layer {
			float: left;
			list-style: none;
			margin-right: 2px;
			padding: 0;
		}
		.category.type-layer > li {
			margin-top: 18px;
			padding: 0;
			border: none;
			display: inline-block;
			overflow: hidden;
			padding-right: 20px;
		}
		.category.type-layer > li > a {
			display: inline-block;
			padding: 0 0px;
			font-size: 13px;
			/*font-weight: bold;*/
			line-height: 23px;
			height: 26px;
			margin : 0;
			letter-spacing: -0.7px;
		}
		/*=================================================================================상품판매*/

		.item-display-wrap {
			position: relative;
		}
		.item-display-wrap .btn-main-top-more {
			position: absolute;
			right: 10px;
			display: inline-block;
			vertical-align: top;
		}
		/*.normal-btn.small1 {
			height: 24px;

		}*/
		.list {
			position: relative;
			padding-top: 30px;
			width: 1260px;
			/*border: 1px solid red;*/
			margin: 0 auto;
		}
		.item-display .list ul li {
			display: inline-block;
			padding: 0 0 50px;
			font-size: 12px;
			text-align: center;
			vertical-align: top;
		}
		.item-display .list .space {
			/*border: 1px solid red;*/
			margin: 0 auto;
			padding: 0 10px;
		}
		.item-display .list ul li .thumbnail {
			overflow: hidden;
			text-align: center;
		}
		.item-display .list ul li .thumbnail a {
			display: inline-block;
			position: relative;
			vertical-align: top;
		}
		.item-display .thumbnail a > img {
			border: 1px solid #e9e9e9;
		}
		.item-display ul li .thumbnail a .hot {
			position: absolute;
			top: 0;
			left: 0;
			text-align: left;
		}
		.item-display ul li .txt {
			padding: 10px 6px 0;
		}
		.item-display ul li .txt a {
			display: inline-block;
			margin: 4px 0 0;
		}
		.item-display .list ul li .txt a > strong {
			font-size: 11px;
			text-align: left;
			color: #888;
		}
		.item-display .list ul li .price {
			padding: 12px 6px 0;
		}
		.item-display .list ul li .price .cost strong {
			font-size: 11px;
			font-weight: bold;
			line-height: 2em;
		}
		.item-display-wrap .btn-main-bottom-more {
			border-top: 1px solid #dbdbdb;
			bottom: 15px;
			right: 10px;
			width: 100%;
			display: block;
			cursor: pointer;
			color: #6c6c6c;
			font-size: 12px;
			font-weight: normal;
		}
		.item-display-wrap .btn-main-bottom-more em {
			position: relative;
			top: -1px;
			margin: 0 auto;
			display: block;
			height: 20px;
			padding-top: 4px;
			width: 100px;
			background: url(../img/더보기.png) no-repeat 70% 50%;
			border: 1px solid #dbdbdb;
			text-align: -10px;
			border-top: 1px solid #fff;
		}
		.goad-banner {
			padding: 50px 0 0;
			text-align: center;
		}




	</style>
</head>
<body>
	<%@ include file="include/modal.jsp" %>

	<div class="top-service">
		<div class="container">
			<div class="lnb">
				<h2 class="dn">사이드 카테고리</h2>
				<ul class="category type-layer">
					<li>
						<a href="#" class>BEST50</a>
					</li>
					<li>
						<a href="#" class>전체상품</a>
					</li>
					<li>
						<a href="#" class>스마트톡</a>
					</li>
					<li>
						<a href="#" class>SNS핫템</a>
					</li>
					<li>
						<a href="#" class>톡+케이스set</a>
					</li>
					<li>
						<a href="#" class>하드케이스</a>
					</li>
					<li>
						<a href="#" class>카드케이스</a>
					</li>
					<li>
						<a href="#" class>터프케이스</a>
					</li>
					<li>
						<a href="#" class>젤리케이스</a>
					</li>
					<li>
						<a href="#" class>터프케이스</a>
					</li>
					<li>
						<a href="#" class>젤리케이스</a>
					</li>
					<li>
						<a href="#" class>악세사리</a>
					</li>
					<li>
						<a href="#" class>하프미러</a>
					</li>
					<li>
						<a href="#" class>에어팟/버즈케이스</a>
					</li>
				</ul>
			</div>
			<ul class="board"></ul>
		</div>
	</div>
	<hr>
	<div class="content_wrap">
		<div class="content">


			<div class="slideshow-container">

				<div class="mySlides fade">
				  <div class="numbertext"></div>
				  <img src="${path}/resources/img/photo-1565536421961-1f165e0c981e.jpg" style="width:100%">
				  <div class="text"></div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext"></div>
				  <img src="${path}/resources/img/photo-1488137881216-5bea4b9bac2b.jpg" style="width:100%">
				  <div class="text"></div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext"></div>
				  <img src="${path}/resources/img/photo-1531646218238-b4f5b56a5ec7.jpg" style="width:100%">
				  <div class="text"></div>
				</div>

				<div class="mySlides fade">
				  <div class="numbertext"></div>
				  <img src="${path}/resources/img/photo-1580493128056-13d69c26d10f.jpg" style="width:100%">
				  <div class="text"></div>
				</div>

				
				<div class="mySlides fade">
				  <div class="numbertext"></div>
				  <img src="${path}/resources/img/photo-1498673394965-85cb14905c89.jpg" style="width:100%">
				  <div class="text"></div>
				</div>

			
				</div>
				<br>

			<div style="text-align:center">
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			  <span class="dot"></span> 
			</div>
		</div>
	</div>

	
	<div class="item-display-wrap js-main-wrap-7">
		<h2>
			<a href="#" class="btn-main-top-more normal-btn small1 m1"></a>
			<em></em>
		</h2>
		<div class="goad-banner">
			<img src="${path}/resources/img/제목을 입력해주세요._1 (1).png" alt="인기상품" title="인기상품">
		</div>
		<div class="goods-content7">
			<div class="item-display type-gallery">
				<div class="list">
			
					<ul>
					<c:forEach items ='${BestPdt}' var="pdt">	
						<li style="width: 33.1%">
							<div class="space">
								<div class="thumbnail">
									<a href="#">
										<img src="${path}/resources/img/케이스상품/${pdt.p_img}" alt="[하드+♥톡]비비드하트" title="[하드+♥톡]비비드하트">
										<span class="hot"></span>
									</a>
								</div>
								<div class="txt">
									<a href="#">
										<strong>${pdt.pmeno}</strong>
									</a>
								</div>
								<div class="price gd-default">
									<span class="cost">
										<strong >
											<fmt:formatNumber type="number" maxFractionDigits="3" value='${pdt.price}'/>원
										</strong>
									</span>
									<br>
								</div>
								<div class="display-field"></div>
							</div>
						</li>
					</c:forEach>						
					</ul>
						<a class="btn-main-bottom-more" data-page="2">
							<em></em>
						</a>
						
				</div>
			</div>
		</div>
		
		<div class="goad-banner">
			<img src="${path}/resources/img/제목을 입력해주세요._12.png" alt="신상품" title="신상품">
		</div>
			
		<div class="goods-content7">
			<div class="item-display type-gallery">
				<div class="list">
					
					<ul>
					<c:forEach items ='${newPdt}' var="pdt">	
						<li style="width: 33.1%">
							<div class="space">
								<div class="thumbnail">
									<a href="#">
										<img src="${path}/resources/img/케이스상품/${pdt.p_img}" alt="[하드+♥톡]비비드하트" title="[하드+♥톡]비비드하트">
										<span class="hot"></span>
									</a>
								</div>
								<div class="txt">
									<a href="#">
										<strong>${pdt.pmeno}</strong>
									</a>
								</div>
								<div class="price gd-default">
									<span class="cost">
										<strong >
											<fmt:formatNumber type="number" maxFractionDigits="3" value='${pdt.price}'/>원
										</strong>
									</span>
									<br>
								</div>
								<div class="display-field"></div>
							</div>
						</li>
					</c:forEach>			
					</ul>
					<a class="btn-main-bottom-more" data-page="2">
						<em></em>
					</a>
					
				</div>
			</div>
		</div>
		
	</div>
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

	$(document).ready(function(){
		$('.js-main-wrap-7 .btn-main-bottom-more').on('click',function(e){
			get_list7($(this).data('page'));
		});

	});

	function get_list7(page){
		$get('#', {'mode' : 'get_main', 'more' : page, 'sno': '11'}, function(data) {
			$(".goods-content11").html(data);
			if(typeof simpleHover == 'function') {
				simpleHover();
			}
			if (parseInt(page)+1 >5) {
				$('.js-main-wrap-11 .btn-main-bottom-more').hide();
			} else {
				$('.js-main-wrap-11 .btn-main-bottom-more').data('page',parseInt(page)+1);
			}
		});

	}
</script>
</html>