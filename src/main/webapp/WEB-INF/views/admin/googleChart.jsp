<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>google chart API</title>
 
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 
<script type="text/javascript">
function ajaxData() {
    $.ajax({
        url: './chartData.do',
        type: 'post',
        async: false,
        success: function(lists) {
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var dataChart = [['Task', 'Hours per Day']];
                if(lists.length != 0) {
                    $.each(lists, function(i, item){
                        dataChart.push([item.key, item.value]);
                    });
                }else {
                    dataChart.push(['입력해주세요', 1]);
                }
                var data = google.visualization.arrayToDataTable(dataChart);
                var view = new google.visualization.DataView(data);
                var options = {
                        title: "날짜별 누적 회원 수",
                        width: 1000, // 넓이 옵션
                        height: 450, // 높이 옵션
                };
                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(view, options);
            }
        }
    });
}
$(document).ready(function(){
    ajaxData();
});
</script>
</head>
<body>
    <div id="piechart"></div>
    <input type="button" value="데이터호출" onclick="ajaxData()"/>
</body>
</html>