<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.points_table thead {
	width: 100%;
}

.points_table tbody {
	height: 562px;
	overflow-y: auto;
	width: 100%;
}

.points_table thead tr{
	width: 99%;
}

 .points_table tr{
 	width: 100%;
 }

.points_table thead, .points_table tbody, .points_table tr, .points_table td, .points_table th{
	display: inline-block;
}

.points_table thead{
	background: #5bc0de;
	color: #fff;
}

.points_table tbody td, .points_table thead > tr> th{
	float: left;
	border-bottom-width: 0;
}

.points_table>tbody>tr>td, .points_table>tbody>tr>th, .points_table>tfoot>tr>td, .points_table>tfoot>tr>th, .points_table>thead>tr>td, .points_table>thead>tr>th{
	padding: 8px;
	height: 50px;
	text-align: center;
	line-height: 32px;
}

.odd {
	background: #ffffff;
	color: #000;
}

.even {
	background: #efefef;
	color: #000;
}

.points_table_scrollbar{
	height: 612px;
	overflow-y: scroll;
}

.points_table_scrollbar::-webkit-scrollbar-track{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.9);
	border-radius: 10px;
	background-color: #444444;
}

.points_table_scrollbar::-webkit-scrollbar{
	width: 1%;
	min-width: 5px;
	background-color: #5bc0de;
}

.points_table_scrollbar::-webkit-scrollbar-thumb{
	border-radius: 10px;
	background-color: #5bc0de;
	background-image: -webkit-linear-gradient(90deg, transparent, rgba(0, 0, 0, 0.4) 50%, transparent, transparent)
}

</style>
</head>
<body>
<div class="container">
	<div class="row">
		<h2 style="text-align: -webkit-center; padding-top: 30px;">Q&A</h2>
	<ul class="breadcrumbs-list" style="text-align: -webkit-center;">
		<li>
			<a title="Return to Home" href="<%=cp%>/main.do" style="font-style: oblique;">HOME</a>
		</li>
		<li>
			<a title="Go to Shopping" href="<%=cp%>/books/booksList.do" style="font-style: oblique;">SHOP</a>
		</li>
	</ul>
		<hr><br/><br/>



		<table class="points_table">
			<thead>
				<tr style="background-color: #5bc0de;">
					<th class="col-xs-1">#</th>
					<th class="col-xs-7">Team</th>
					<th class="col-xs-1">S</th>
					<th class="col-xs-1">M</th>
					<th class="col-xs-1">L</th>
					<th class="col-xs-1">O</th>
				</tr>
			</thead>

			<tbody class="points_table_scrollbar">
				<tr class="odd">
					<td class="col-xs-1">1</td>
					<td class="col-xs-7">Test Points</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">2</td>
					<td class="col-xs-7">Test Points 2</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>
				
				<tr class="odd">
					<td class="col-xs-1">3</td>
					<td class="col-xs-7">Test Points 3</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">4</td>
					<td class="col-xs-7">Test Points 4</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">5</td>
					<td class="col-xs-7">Test Points 5</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">6</td>
					<td class="col-xs-7">Test Points 6</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">7</td>
					<td class="col-xs-7">Test Points 7</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">8</td>
					<td class="col-xs-7">Test Points 8</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">9</td>
					<td class="col-xs-7">Test Points 9</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">10</td>
					<td class="col-xs-7">Test Points 10</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">11</td>
					<td class="col-xs-7">Test Points 11</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">12</td>
					<td class="col-xs-7">Test Points 12</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">13</td>
					<td class="col-xs-7">Test Points 13</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">14</td>
					<td class="col-xs-7">Test Points 14</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">15</td>
					<td class="col-xs-7">Test Points 15</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">16</td>
					<td class="col-xs-7">Test Points 16</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">17</td>
					<td class="col-xs-7">Test Points 17</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">18</td>
					<td class="col-xs-7">Test Points 18</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="odd">
					<td class="col-xs-1">19</td>
					<td class="col-xs-7">Test Points 19</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>

				<tr class="even">
					<td class="col-xs-1">20</td>
					<td class="col-xs-7">Test Points 20</td>
					<td class="col-xs-1">10</td>
					<td class="col-xs-1">0</td>
					<td class="col-xs-1">5</td>
					<td class="col-xs-1">1</td>
				</tr>
			</tbody>
		</table>
	<br/><br/>
	</div>
</div>
</body>
</html>