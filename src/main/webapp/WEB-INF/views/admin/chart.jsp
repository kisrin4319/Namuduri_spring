<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

var json = ${json};

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var data = new google.visualization.DataTable(json)
	
	var options = {
        title: 'Company Performance',
        curveType: 'function',
        legend: { position: 'bottom' }
      };

	var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

	chart.draw(data, options);
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
						<!-- Nav tabs -->
						<ul class="nav nav-tabs profile-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#home" role="tab">tab1</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#profile" role="tab">tab2</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#settings" role="tab">tab3</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<!-- first tab -->
							<div class="tab-pane active" id="home" role="tabpanel">
								<div class="card-block">
									<div id="curve_chart" style="width: 900px; height: 500px"></div>
								</div>
							</div>
							<!--second tab-->
							<div class="tab-pane" id="profile" role="tabpanel">
								<div class="card-block"></div>
							</div>
							<!-- third tab -->
							<div class="tab-pane" id="settings" role="tabpanel">
								<div class="card-block"></div>
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