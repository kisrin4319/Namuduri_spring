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

$(document).ready(function(){
	getLineChart1();
	getLineChart2();
	getSalesChart1();
	getSalesChart2();
	getPieChart1();
	getPieChart2();
	getPieChart3();
	getPieChart4();
	getPieChart5();
	getPieChart6();
});

function getLineChart1(){
	
	var json = ${jsonNew};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        legend: 'none'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
	}
}

function getLineChart2(){
	
	var json = ${jsonAll};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        legend: 'none'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
	}
}

function getSalesChart1(){
	
	var json = ${salesNew};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        legend: 'none'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('sales_chart1'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
	}
}

function getSalesChart2(){
	
	var json = ${salesAll};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable(json)
		
		var options = {
	        legend: 'none'
	      };

		var chart = new google.visualization.LineChart(document.getElementById('sales_chart2'));
		
		chart.draw(data, options);
		window.addEventListener('resize', function() { chart.draw(data, options); }, false);
	}
}

function getPieChart1(){
	
	var json = ${newGenderPie};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
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
}

function getPieChart2(){
	
	var json = ${newAgePie};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
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
}

function getPieChart3(){
	
	var json = ${newRegionPie};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
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
}

function getPieChart4(){
	
	var json = ${genderPie};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
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
}


function getPieChart5(){
	
	var json = ${agePie};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
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
}

function getPieChart6(){
	
	var json = ${regionPie};
	
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
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
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</div>
		</div>
		
		<div class="col-lg-12">
			<div class="card">
				<div class="card-block">
					<div class="table-responsive">
						<div id="new">
								<div class="card-block">
									<c:if test="${request==1}">
										<label class="h4">신규 가입 회원</label>
									</c:if>
									<c:if test="${request==2}">
										<label class="h4">최근 7일 주문 조회</label>
									</c:if>
									<div id="curve_chart"></div>
									<div id="sales_chart1"></div>
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
									<c:if test="${request==1}">
										<label class="h4">전체 회원</label>
									</c:if>
									<c:if test="${request==2}">
										<label class="h4">달별 주문 조회</label>
									</c:if>
									<div id="curve_chart2"></div>
									<div id="sales_chart2"></div>
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