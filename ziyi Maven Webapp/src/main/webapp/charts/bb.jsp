<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<script type="text/javascript" src="charts/js/highcharts.js"></script>
	<script type="text/javascript" src="charts/js/exporting.js"></script>
	<script type="text/javascript" src="charts/js/drilldown.js"></script>
	<script type="text/javascript" src="charts/js/highcharts-zh_CN.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>  
	<script type="text/javascript" src="layui/layui.js"></script>
	<style type="text/css">
		.changeshow{
			display: flex;
			flex-direction: row;
		}
		.changeshow .layui-btn{
			margin-left: 1%;
		}
		.showclass,.dayshow{
			display: none;
		}
	</style>
</head>
<body>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<p>111</p>
<table class="layui-table" id='tabmonth' lay-data="{limit:10,page:true,}">
					<thead>
					    <tr>
						  <th lay-data="{field:'id',sort: true}">月份</th>
					      <th lay-data="{field:'mmoney',sort: true}">销售额</th>				       
					      <th lay-data="{field:'eara'}">操作</th>				       
					    </tr>
					</thead>
					<tbody id='monthval'>
					    <c:forEach var="i" items="${list}"> 		
					  		<tr>				  		
						  		<td> ${i.month} </td>					  		
						  		<td> ${i.value}</td>
						  		<td><a href="javascript:daydetail(this,${i.month});" class="layui-btn layui-btn-mini">详情</a></td>
					  		</tr>
				  		</c:forEach>
				  		<%-- <a href="javascript:editbtn(this,${pay.typeid});" class="layui-btn layui-btn-normal layui-btn-mini">预览</a> --%>
						<!-- <tr>
							<td>1</td>
							<td>1314</td>
							<td><a href="javascript:moneydetail();" class="layui-btn layui-btn-mini">详情</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>1314</td>
							<td><a href="javascript:moneydetail();" class="layui-btn layui-btn-mini">详情</a></td>
						</tr> -->
					</tbody>
				</table>
</body>
<script  type="text/javascript">
Highcharts.chart('container', {
	chart: {
		type: 'column'
	},
	title: {
		text: '2015年1月-5月，各浏览器的市场份额'
	},
	subtitle: {
		text: '点击可查看具体的版本数据，数据来源: <a href="https://netmarketshare.com">netmarketshare.com</a>.'
	},
	xAxis: {
		type: 'category'
	},
	yAxis: {
		title: {
			text: '总的市场份额'
		}
	},
	legend: {
		enabled: false
	},
	plotOptions: {
		series: {
			borderWidth: 0,
			dataLabels: {
				enabled: true,
				format: '{point.y:.1f}%'
			}
		}
	},
	tooltip: {
		headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	},
	series: [{
		name: '浏览器品牌',
		colorByPoint: true,
		data: [
			
			<c:forEach var="i" items="${list }">
			{
				name: ${i.month},
				y: ${i.value},
				drilldown: ${i.month}
			},
			</c:forEach>
			]
	}],
	drilldown: {
		series: [
			
			<c:forEach var="i" items="${list }">
			{
				name: ${i.month},
				id: ${i.month},
				data: [
					<c:forEach var="is" items="${i.day_value }">
					[
						' ${is.key}',
						${is.value}
						
					],
					</c:forEach>
				]
			},
			</c:forEach>
			
			]
	}
});
</script>
</html>