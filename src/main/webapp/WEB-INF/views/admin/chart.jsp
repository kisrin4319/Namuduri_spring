<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

var list = "${list}"

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  
  var data = google.visualization.DataTable(
		  {
			  "cols": [
			        {"id":"","label":"Topping","pattern":"","type":"string"},
			        {"id":"","label":"Slices","pattern":"","type":"number"}
			      ],
			  "rows": [
			        {"c":[{"v":"Mushrooms","f":null},{"v":3,"f":null}]},
			        {"c":[{"v":"Onions","f":null},{"v":1,"f":null}]},
			        {"c":[{"v":"Olives","f":null},{"v":1,"f":null}]},
			        {"c":[{"v":"Zucchini","f":null},{"v":1,"f":null}]},
			        {"c":[{"v":"Pepperoni","f":null},{"v":2,"f":null}]}
			      ]
			}
  );
  var options = {
          title: "제목옵션",
          width: 900, // 넓이 옵션
          height: 300, // 높이 옵션
  };
  
  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

  chart.draw(data, options);
}
document.write(list);

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

		<div id="curve_chart"></div>

		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

	</div>
	<footer class="footer"> © 2017 Material Pro Admin by wrappixel.com </footer>
</body>
</html>