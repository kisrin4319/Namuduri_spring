<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp  = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Contact || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<h2 style="text-align: -webkit-center; padding-top: 30px;">Contact Us</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
		</li>
		<li style="font-style: oblique;">Contact Us</li>
	</ul>
	<!-- Map Area Start -->
	<div class="map-area">
		<div id="map" style="width: 100%; height: 445px;"></div>
	</div>
	<!-- Map Area End -->
	<!-- Address Information Area Start -->
	<div class="address-info-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-4 hidden-sm">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span>
									<i class="fa fa-user-plus"></i>
								</span>
							</div>
							<div class="info">
								<h3>PHONE</h3>
								<p>+(02)-12345-6789-55</p>
								<p>+(05)-15689-5698-44</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="address-single">
						<div class="all-adress-info">
							<div class="icon">
								<span>
									<i class="fa fa-map-marker"></i>
								</span>
							</div>
							<div class="info">
								<h3>ADDRESS</h3>
								<p>Gangnam,Seoul</p>
								<p>Yeoksam, Korea.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="address-single no-margin">
						<div class="all-adress-info">
							<div class="icon">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="info">
								<h3>E-MAIL</h3>
								<p>khiclass@gmail.com</p>
								<p>www.namuduri.com</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Address Information Area End -->
	<!-- Contact Form Area Start -->
	<div class="contact-form-area">
		<div class="container">
			<div class="about-title">
				<h3>LEAVE A MESSAGE</h3>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form action="<%=cp %>/common/mailSending.do" method="POST">
						<div class="row">
							<div class="col-md-5">
								<div class="contact-form-left">
									<input type="text" placeholder="Your Name" name="name" id="name" />
									<input type="email" placeholder="Your Email" name="tomail" id="tomail" />
									<input type="text" placeholder="Your phone" name="phone" id="phone" />
								</div>
							</div>
							<div class="col-md-7">
								<div class="contact-form-right">
									<div class="input-message">
										<textarea name="message" id="message" placeholder="Your Message"></textarea>
										<input class="btn btn-default" type="submit" value="SEND" name="submit" id="submit">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Form Area End -->
	<!-- Daum Map js -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f795c8c60a133cd29eafa0c36afed33"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.4989567,127.03283520000002),
			level: 1
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.4989567,127.03283520000002); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</body>
</html>