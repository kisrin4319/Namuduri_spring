<?xml version="1.0" encoding="UTF-8" ?>
<%
	String cp = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=cp%>/css/body.css" rel="stylesheet" type="text/css" />
<link href="<%=cp%>/css/body2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- Container  -->
	<div id="container">
		<!-- Welcome Contents -->
		<div class="bg_welcome_1" style="background-color: rgb(230, 233, 246);">
			<div class="content_top" style="padding-right: 250px; padding-top: 0px; height: 300px; padding-bottom: 30px; width: 900px;">
				<!-- 상단 메인 이벤트 -->
				<!-- #####MainEventManage_START##### -->
				<!-- *** s:(자동화)메인 배너 *** -->
				<!-- #####wel_MainEventBanner_START##### -->
				<div id="mainEventDiv" class="box_welcome_event" style="padding-top: 400px;">
					<h2>메인 이벤트</h2>
					<ul class="section_list" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px;">
						<li class="section on" style="width: 100px;">
							<ul class="event_list">
								<li class="on">
									<!-- 컨텐츠 타입이 아닐경우 -->
									<div class="event_banner" style="height: 320px; margin-left: 15px; width: 900px;">
										<img src="images/eventbanner/bnL_39.jpg" width="175" alt="요즘 이 책" />
										<a class="link_book item_3" href="textbookDetail.do?goods_num=24">
											<!-- <em class="category">/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788935211777&orderClick=41b</em> -->
											<img src="/namuduri/admin/upload/textbook_1507408683032.jpg" alt="신과 함께 박스 세트(개정판)(전8권)" />
											<strong class="title">신과 함께 박스 세트(개정판)(전8권)</strong>
											<span class="info">몇번이나 보았지만 소장까지 하고 싶게 만드는 몇 안되는 웹툰입니다. - ma**ewjj님</span>
										</a>
										<a class="link_book item_3" href="textbookDetail.do?goods_num=11">
											<img src="/namuduri/admin/upload/textbook_1507382413535.jpg" alt="82년생 김지영(오늘의 젊은 작가 13)(양장본 HardCover)" />
											<strong class="title">82년생 김지영(오늘의 젊은 작가 13)(양장본 HardCover)</strong>
											<span class="info">받은 즉시 하루만에 다 읽었어요,! 여자로서 너무 공감가는 이야기에요- me**0512님</span>
										</a>
										<a class="link_book item_3" href="textbookDetail.do?goods_num=25">
											<!-- <em class="category">/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788957369265&orderClick=41d</em> -->
											<img src="/namuduri/admin/upload/textbook_1507409157260.jpg" alt="엄마 반성문" />
											<strong class="title">엄마 반성문</strong>
											<span class="info">전교 일등 남매 고교 자퇴 후 코칭 전문가 된 교장 선생님의 고백</span>
										</a>
										<a class="link_book item_3" href="textbookDetail.do?goods_num=16">
											<!-- <em class="category">/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9788957369265&orderClick=41d</em> -->
											<img src="/namuduri/admin/upload/textbook_1507401088893.jpg" alt="남아 있는 나날" />
											<strong class="title">남아 있는 나날</strong>
											<span class="info">2017 노벨 문학상 수상작가 "가즈오 이시구로" 대표작</span>
										</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="bg_welcome_5">
			<div class="content_chart">
				<!-- 베스트셀러 -->
				<!-- *** s:(자동화)베스트셀러 *** -->
				<!-- #####wel_BestSeller_START##### -->
				<!-- #####wel_BestSeller_START##### -->
				<!-- *** s:베스트셀러 *** -->
				<div class="box_welcome_chart" id="bestSeller">
					<h2 class="title_welcome_basic">베스트셀러</h2>
					<!-- *** s:(종합주간)베스트셀러 *** -->
					<div class="section first on">
						<div class="content" style="margin-left: 90px;">
							<ul class="list_welcome_chart">
								<li class="best1">
									<div class="icon">
										<strong class="rank">01</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=9">
											<img src="/namuduri/admin/upload/textbook_1507382326957.jpg" alt="살인자의 기억법" />
											<em> 김영하의 장편소설 『살인자의 기억법』. 《너의 목소리가 들려》 이후 일 년 반 만에 펴낸 장편소설로... </em>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=9">
											<strong>살인자의 기억법</strong>
										</a>
									</div>
									<div class="author">김영하</div>
								</li>
								<li class="best2">
									<div class="icon">
										<strong class="rank">02</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=10">
											<img src="/namuduri/admin/upload/textbook_1507382430757.jpg" alt="언어의 온도" />
											
												<em> 언어에는 따뜻함과 차가움, 적당한 온기 등 나름의 온도가 있다. 세상살이에 지칠 때 어떤 이는 친구... </em>
											
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=10">
											<strong>언어의 온도</strong>
										</a>
									</div>
									<div class="author">이기주</div>
								</li>
								<li class="best3">
									<div class="icon">
										<strong class="rank">03</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=11">
											<img src="/namuduri/admin/upload/textbook_1507382413535.jpg" alt="82년생 김지영(오늘의 젊은 작가 13)(양장본 HardCover)" />
											<div>
												<em> 문학성과 다양성, 참신성을 기치로 한국문학의 미래를 이끌어 갈 신예들의 작품을 엄선한 「오늘의 젊은... </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=11">
											<strong>82년생 김지영(오늘의 젊은 작가 13)(양장본 HardCover)</strong>
										</a>
									</div>
									<div class="author">조남주</div>
								</li>
								<li class="best4">
									<div class="icon">
										<strong class="rank">04</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=14">
											<img src="/namuduri/admin/upload/textbook_1507399691924.jpg" alt="말의 품격" />
											<div>
												<em>
													말의 품격
													<br />
													황소북스
												</em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=14">
											<strong>말의 품격</strong>
										</a>
									</div>
									<div class="author">이기주</div>
								</li>
								<li class="best5">
									<div class="icon">
										<strong class="rank">05</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=15">
											<img src="/namuduri/admin/upload/textbook_1507400395124.jpg" alt="나미야 잡화접의 기적(양장본)" />
											<div>
												<em> 『주진우의 이명박 추격기』는 지난 10년 동안 돈 앞에서는 사랑도, 자식도 없는 이명박의 사라진 돈... </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=15">
											<strong>나미야 잡화점의 기적(양장본)</strong>
										</a>
									</div>
									<div class="author">히가시노 게이고</div>
								</li>
								<li class="best6">
									<div class="icon">
										<strong class="rank">06</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=1">
											<img src="/namuduri/admin/upload/textbook_1507382478768.jpg" alt="빛 혹은 그림자" />
											<div>
												<em> </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=1">
											<strong>빛 혹은 그림자</strong>
										</a>
									</div>
									<div class="author">로런스 블록</div>
								</li>
								<li class="best7">
									<div class="icon">
										<strong class="rank">07</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=12">
											<img src="/namuduri/admin/upload/textbook_1507382580321.jpg" alt="명견만리: 정치, 생애, 직업, 탐구 편" />
											<div>
												<em> 강연과 다큐를 결합한 KBS의 렉처멘터리 《명견만리》는 김난도, 김영란, 최재천 등 각 분야의 최고... </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=12">
											<strong>명견만리: 정치, 생애, 직업, 탐구 편</strong>
										</a>
									</div>
									<div class="author">KBS 명견만리 제작팀</div>
								</li>
								<li class="best8">
									<div class="icon">
										<strong class="rank">08</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=2">
											<img src="/namuduri/admin/upload/textbook_1507382363122.jpg" alt="기사단장 죽이기. 1: 현현하는 이데아(양장본 HardCover)" />
											<div>
												<em> 무라카미 하루키가 7년 만에 선보인 본격 장편소설 『기사단장 죽이기』제1권. ‘이것이 하루키다!’라... </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=2">
											<strong>기사단장 죽이기. 1: 현현하는 이데아(양장본 HardCover)</strong>
										</a>
									</div>
									<div class="author">무라카미 하루키</div>
								</li>
								<li class="best9">
									<div class="icon">
										<strong class="rank">09</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=16">
											<img src="/namuduri/admin/upload/textbook_1507401088893.jpg" alt="남아  있는 나날" />
											<div>
												<em> 젊은 나날의 사랑은 지나갔지만, 남아 있는 나날에도 희망은 존재한다.... </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=16">
											<strong>남아 있는 나날</strong>
										</a>
									</div>
									<div class="author">가즈오 이시구로</div>
								</li>
								<li class="best10">
									<div class="icon">
										<strong class="rank">10</strong>
									</div>
									<div class="cover">
										<a href="textbookDetail.do?goods_num=17">
											<img src="/namuduri/admin/upload/textbook_1507401406257.jpg" alt="나는 나로 살기로 했다" />
											<div>
												<em> “어른이 되어보니 세상은 냉담한 곳이었다.” 김수현은 책을 펴내면서 이런 말을 했다. 부조리가 넘쳐... </em>
												<span></span>
											</div>
										</a>
									</div>
									<div class="title">
										<a href="textbookDetail.do?goods_num=17">
											<strong>나는 나로 살기로 했다</strong>
										</a>
									</div>
									<div class="author">김수현</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- *** //e:(종합주간)베스트셀러 *** -->
				</div>
			</div>
		</div>
		<div class="content_middle">
			<div class="main_both" style="margin-left: 30px;">
				<!-- 잇츠 베스트 -->
				<div class="box_welcome_best">
					<h2 class="title_welcome_basic">
						이주의 책
						<!-- <small>출판사가 추천하는 한주간의 책입니다.</small> -->
					</h2>
					<ul class="list_welcome_best">
						<li id="itsbest1">
							<a href="textbookDetail.do?goods_num=18">
								<img src="/namuduri/admin/upload/textbook_1507402217091.jpg" width="120" height="200" />
							</a>
						</li>
						<li id="itsbest2">
							<a href="textbookDetail.do?goods_num=19">
								<img src="/namuduri/admin/upload/textbook_1507402487739.jpg" width="120" height="200" />
							</a>
						</li>
						<li id="itsbest3">
							<a href="textbookDetail.do?goods_num=20">
								<img src="/namuduri/admin/upload/textbook_1507402586943.jpg" width="120" height="200" />
							</a>
						</li>
						<li id="itsbest4">
							<a href="textbookDetail.do?goods_num=21">
								<img src="/namuduri/admin/upload/textbook_1507402689531.jpg" width="120" height="200" />
							</a>
						</li>
						<li id="itsbest5">
							<a href="textbookDetail.do?goods_num=22">
								<img src="/namuduri/admin/upload/textbook_1507402808274.jpg" width="120" height="200" />
							</a>
						</li>
						<li id="itsbest6">
							<a href="textbookDetail.do?goods_num=23">
								<img src="/namuduri/admin/upload/textbook_1507403006824.jpg" width="120" height="200" />
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- .main_both -->
		</div>
		<!-- .content_middle -->
	</div>
	<!-- #container -->
	<!-- // Container -->
</body>
</html>