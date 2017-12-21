<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawLineChart1);
google.charts.setOnLoadCallback(drawLineChart2);
google.charts.setOnLoadCallback(drawLineChart3);
google.charts.setOnLoadCallback(drawLineChart4);
google.charts.setOnLoadCallback(drawPieChart1);
google.charts.setOnLoadCallback(drawPieChart2);
google.charts.setOnLoadCallback(drawPieChart3);
google.charts.setOnLoadCallback(drawPieChart4);
google.charts.setOnLoadCallback(drawPieChart5);
google.charts.setOnLoadCallback(drawPieChart6);

var request = ${request}

function drawLineChart1() {
		var json = ${jsonNew};
		var data = new google.visualization.DataTable(json)
		
		var options = {
			title:'날짜별 조회'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawLineChart2() {
		var json = ${jsonAll};
		var data = new google.visualization.DataTable(json)
		
		var options = {
			title:'달별 조회'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawLineChart3() {
		var json = ${salesNew};
		var data = new google.visualization.DataTable(json)
		
		var options = {
			title:'날짜별 판매 금액 조회 (단위 : k(천 원))'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('sales_chart1'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawLineChart4() {
		var json = ${salesAll};
		var data = new google.visualization.DataTable(json)
		
		var options = {
			title:'달별 판매 금액 조회 (단위 : M(백만 원))'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('sales_chart2'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawPieChart1() {
		var json = ${newGenderPie};
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        title: '성별',
	        titleTextStyle: {
	            fontSize: '15'
	        }
	      };

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart1'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawPieChart2() {
		var json = ${newAgePie};
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        title: '연령별',
	        titleTextStyle: {
	            fontSize: '15'
	        }
	      };

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart2'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawPieChart3() {
		var json = ${newRegionPie};
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        title: '지역별',
	        titleTextStyle: {
	            fontSize: '15'
	        }
	      };

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart3'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawPieChart4() {
		var json = ${genderPie};
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        title: '성별',
	        titleTextStyle: {
	            fontSize: '15'
	        }
	      };

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart4'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}


function drawPieChart5() {
		var json = ${agePie};
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        title: '연령별',
	        titleTextStyle: {
	            fontSize: '15'
	        }
	      };

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart5'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

function drawPieChart6() {
		var json = ${regionPie};
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        title: '지역별',
	        titleTextStyle: {
	            fontSize: '15'
	        }
	      };

		var chart = new google.visualization.PieChart(document.getElementById('pie_chart6'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
}

</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">CHART</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<c:choose>
						<c:when test="${request==1}">
							<li class="breadcrumb-item active">Member Chart</li>	
						</c:when>
						<c:otherwise>
							<li class="breadcrumb-item active">Order Chart</li>	
						</c:otherwise>
					</c:choose>
				</ol>
			</div>
		</div>
		
		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<div id="new">
								<div class="card-block">
									<c:choose>
										<c:when test="${request==1}">
											<label class="h4">신규 가입 회원</label>
											<div id="curve_chart" class="jsonNew"></div>
										</c:when>
										<c:otherwise>
											<label class="h4">최근 7일 주문 조회</label>
											<div id="curve_chart"></div>
											<div id="sales_chart1"></div>
										</c:otherwise>
									</c:choose>
									<div class="form-group"></div>
									<div class="row">
										<div class="col-md-4"><div id="pie_chart1"></div></div>
										<div class="col-md-4"><div id="pie_chart2"></div></div>
										<div class="col-md-4"><div id="pie_chart3"></div></div>
									</div>
								</div>
						</div>
						<div id="all">
								<div class="card-block">
									<c:choose>
										<c:when test="${request==1}">
											<label class="h4">전체 회원</label>
											<div id="curve_chart2" class="jsonAll"></div>
										</c:when>
										<c:otherwise>
											<label class="h4">달별 주문 조회</label>
											<div id="curve_chart2"></div>
											<div id="sales_chart2"></div>
										</c:otherwise>
									</c:choose>
									<div class="form-group"></div>
									<div class="row">
										<div class="col-md-4"><div id="pie_chart4"></div></div>
										<div class="col-md-4"><div id="pie_chart5"></div></div>
										<div class="col-md-4"><div id="pie_chart6"></div></div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

	</div>
	<footer class="footer"> © 2017 Material Pro Admin by wrappixel.com </footer>
</body>
</html>