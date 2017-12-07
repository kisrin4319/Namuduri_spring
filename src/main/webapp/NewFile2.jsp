<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>WishList || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/bootstrap/img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300' rel='stylesheet' type='text/css'>
<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/venobox/venobox.css" type="text/css" media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/lib/css/preview.css" type="text/css" media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/checkBox.css">
<!-- modernizr css -->
<script src="<%=cp%>/bootstrap/js/vendor/modernizr-2.8.3.min.js"></script>
<style type="text/css">
.content_accordion {
	margin: 20px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Syllabus for CSS
					<!--small>Statistics Overview</small-->
				</h1>
				<!--ul class="nav nav-tabs">
                           <li class="active"><a href="#">Home</a></li>
                           <li><a href="#">SVN</a></li>
                           <li><a href="#">iOS</a></li>
                           <li><a href="#">VB.Net</a></li>
                           <li><a href="#">Java</a></li>
                           <li><a href="#">PHP</a></li>
                        </ul-->
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab"> Compulsory Subjects </a></li>
					<li><a href="#a" data-toggle="tab">Group A</a></li>
					<!--li class="dropdown">
                              <a href="#" id="myTabDrop1" class="dropdown-toggle" 
                                 data-toggle="dropdown">Java 
                                 <b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                 <li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a></li>
                                 <li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
                              </ul>
                           </li-->
					<li><a href="#b" data-toggle="tab">Group B</a></li>
					<li><a href="#c" data-toggle="tab">Group C</a></li>
					<li><a href="#d" data-toggle="tab">Group D</a></li>
					<li><a href="#e" data-toggle="tab">Group E</a></li>
					<li><a href="#f" data-toggle="tab">Group F</a></li>
					<li><a href="#g" data-toggle="tab">Group G</a></li>
					<li><a href="#h" data-toggle="tab">Group H</a></li>
					<li><a href="#i" data-toggle="tab">Group I</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="home">
						<div class="content_accordion">
							<div class="panel-group" id="accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#essay">1. Essay Compulsory (Total Marks-l00)</a>
										</h4>
									</div>
									<div id="essay" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#eng">2. ENGLISH (PRECIS & COMPOSITION) Compulsory (Total Marks-l00)</a>
										</h4>
									</div>
									<div id="eng" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#isl">3. Islamic Studies</a>
										</h4>
									</div>
									<div id="isl" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#eds">4. Everyday Science</a>
										</h4>
									</div>
									<div id="eds" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#ca">5. Current Affairs</a>
										</h4>
									</div>
									<div id="ca" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#pa">6. Pakistan Affairs</a>
										</h4>
									</div>
									<div id="pa" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="a">
						<div class="content_accordion">
							<div class="panel-group" id="ga">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ga" href="#aa">1. Accounting and Auditing </a>
										</h4>
									</div>
									<div id="aa" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ga" href="#eco">2. Economics</a>
										</h4>
									</div>
									<div id="eco" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ga" href="#pba">3. Public Administration</a>
										</h4>
									</div>
									<div id="pba" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ga" href="#ba">4.Business Administration</a>
										</h4>
									</div>
									<div id="ba" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="b">
						<div class="content_accordion">
							<div class="panel-group" id="gb">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#ps">1. Political Science </a>
										</h4>
									</div>
									<div id="ps" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#agr">2. Agriculture</a>
										</h4>
									</div>
									<div id="agr" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#for">3. Forestry </a>
										</h4>
									</div>
									<div id="for" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#soc">4.Sociology</a>
										</h4>
									</div>
									<div id="soc" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gb" href="#jou">5.Journalism</a>
										</h4>
									</div>
									<div id="jou" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="c">
						<div class="content_accordion">
							<div class="panel-group" id="gc">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gc" href="#pm">1. Pure Mathematics </a>
										</h4>
									</div>
									<div id="pm" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gc" href="#am">2. Applied Mathematics</a>
										</h4>
									</div>
									<div id="am" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gc" href="#cs">3. Computer Science </a>
										</h4>
									</div>
									<div id="cs" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gc" href="#stat">4.Statistics</a>
										</h4>
									</div>
									<div id="stat" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="d">
						<div class="content_accordion">
							<div class="panel-group" id="gd">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gd" href="#ps">1. Physics </a>
										</h4>
									</div>
									<div id="phy" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gd" href="#geo">2. Geology</a>
										</h4>
									</div>
									<div id="geo" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gd" href="#geog">3. Geography </a>
										</h4>
									</div>
									<div id="geog" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gd" href="#chem">4.Chemistry</a>
										</h4>
									</div>
									<div id="chem" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gd" href="#bot">5. Botany</a>
										</h4>
									</div>
									<div id="bot" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="e">
						<div class="content_accordion">
							<div class="panel-group" id="ge">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ge" href="#ihc">1. Islamic History & Culture </a>
										</h4>
									</div>
									<div id="ihc" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ge" href="#iph">2. Indo Pak History</a>
										</h4>
									</div>
									<div id="iph" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ge" href="#bh">3. British history </a>
										</h4>
									</div>
									<div id="bh" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ge" href="#ah">4. History of United States of America</a>
										</h4>
									</div>
									<div id="ah" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#ge" href="#eh">5. European History</a>
										</h4>
									</div>
									<div id="eh" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="f">
						<div class="content_accordion">
							<div class="panel-group" id="gf">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gf" href="#law">1. Law </a>
										</h4>
									</div>
									<div id="law" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gf" href="#ilaw">2. International Law</a>
										</h4>
									</div>
									<div id="ilaw" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gf" href="#claw">3. Constitutional Law </a>
										</h4>
									</div>
									<div id="claw" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gf" href="#mlaw">4. Mercantile Law</a>
										</h4>
									</div>
									<div id="mlaw" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gf" href="#mlj">5. Muslim Law and Jurisprudence</a>
										</h4>
									</div>
									<div id="mlj" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="g">
						<div class="content_accordion">
							<div class="panel-group" id="gg">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gg" href="#psy">1. Psychology </a>
										</h4>
									</div>
									<div id="psy" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gg" href="#phi">2. Philosophy</a>
										</h4>
									</div>
									<div id="phi" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="h">
						<div class="content_accordion">
							<div class="panel-group" id="gh">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gh" href="#sind">1. Sindhi </a>
										</h4>
									</div>
									<div id="sind" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gh" href="#bal">2. Balochi</a>
										</h4>
									</div>
									<div id="bal" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gh" href="#kpk">3. Pushto </a>
										</h4>
									</div>
									<div id="kpk" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gh" href="#pun">4.Punjabi</a>
										</h4>
									</div>
									<div id="pun" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--accordion end-->
					</div>
					<div class="tab-pane fade" id="i">
						<div class="content_accordion">
							<div class="panel-group" id="gi">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gi" href="#el">1. English Literature </a>
										</h4>
									</div>
									<div id="el" class="panel-collapse collapse in">
										<div class="panel-body">
											<p>
												Candidates will be required to write one or more essays in English. A wide choice of subject will be given. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gi" href="#urd">2. Urdu</a>
										</h4>
									</div>
									<div id="urd" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												The examination will be based upon a paper carrying 100 marks and will be geared to test the candidates' ability to handle grammatical structure, reading comprehension and analysis, and precise writing and composition. The candidates should be capable of: Using English correctly and efficiently as a vehicle of communication. Reading, comprehending and analyzing advanced texts. Grammar and Vocabulary The candidate's ability to handle the structure of English will be tested by framing items based upon grammatical categories that usually create problems for foreign students. There shall be no prescribed course for this purpose. Reading Comprehension and Analysis Two unseen passages shall be given with a fixed reading time and multiple choice questions would be placed at the end to be answered. The passage for comprehension shall be fairly technical. The passages would be selected from writings on economic, social, cultural subjects and international affairs. Precise Writing
												The candidates will be required to present an acceptable precis of a given passage. The unseen passage will be selected from current, economic, social, cultural and international affairs. <a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gi" href="#per">3. Persian </a>
										</h4>
									</div>
									<div id="per" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#gi" href="#arb">4. Arabic</a>
										</h4>
									</div>
									<div id="arb" class="panel-collapse collapse">
										<div class="panel-body">
											<p>
												<a href="" target="_blank">Learn more.</a>
											</p>
										</div>
									</div>
								</div>
							</div>
							<!--accordion end-->
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="<%=cp%>/bootstrap/js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="<%=cp%>/bootstrap/js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="<%=cp%>/bootstrap/js/owl.carousel.min.js"></script>
	<!-- jquery-ui js -->
	<script src="<%=cp%>/bootstrap/js/jquery-ui.min.js"></script>
	<!-- jquery Counterup js -->
	<script src="<%=cp%>/bootstrap/js/jquery.counterup.min.js"></script>
	<script src="<%=cp%>/bootstrap/js/waypoints.min.js"></script>
	<!-- jquery countdown js -->
	<script src="<%=cp%>/bootstrap/js/jquery.countdown.min.js"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="<%=cp%>/bootstrap/venobox/venobox.min.js"></script>
	<!-- jquery Meanmenu js -->
	<script src="<%=cp%>/bootstrap/js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="<%=cp%>/bootstrap/js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- scrollUp JS -->
	<script src="<%=cp%>/bootstrap/js/jquery.scrollUp.min.js"></script>
	<!-- plugins js -->
	<script src="<%=cp%>/bootstrap/js/plugins.js"></script>
	<!-- Nivo slider js -->
	<script src="<%=cp%>/bootstrap/lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="<%=cp%>/bootstrap/lib/home.js" type="text/javascript"></script>
	<!-- main js -->
	<script src="<%=cp%>/bootstrap/js/main.js"></script>
</body>
</html>