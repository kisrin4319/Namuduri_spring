<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      /* function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      } */
      
      function drawChart() {
    	  var list = '${list}';
    	  var data = new google.visualization.DataTable(
    		{
    			cols: [{id: 'task', label: 'Employee Name', type: 'string'},
    		       		{id: 'startDate', label: 'Start Date', type: 'date'}],
    			rows: [
    					//리스트를 이런식으로....
    					{c:[{v: 'Mike'}, {v: new Date(2008, 1, 28), f:'February 28, 2008'}]},
    		            {c:[{v: 'Bob'}, {v: new Date(2007, 5, 1)}]},
    		            {c:[{v: 'Alice'}, {v: new Date(2006, 7, 16)}]},
    		            {c:[{v: 'Frank'}, {v: new Date(2007, 11, 28)}]},
    		            {c:[{v: 'Floyd'}, {v: new Date(2005, 3, 13)}]},
    		            {c:[{v: 'Fritz'}, {v: new Date(2011, 6, 1)}]}
    		           ]
    		}
    	  );
    	  
    	  var options = {
    	          title: "${title}",
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
				<h3 class="text-themecolor">Dashboard</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</div>
		</div>

		<div id="curve_chart" style="width: 900px; height: 500px"></div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

	</div>
	<footer class="footer"> © 2017 Material Pro Admin by wrappixel.com </footer>
</body>
</html>