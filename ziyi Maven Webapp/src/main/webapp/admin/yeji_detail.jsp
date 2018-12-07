<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>Table</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="css/table.css" />
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
</head>

<body>
<%--     <div>${person_score}</div> --%>
	<div class="admin-main">
		 <div id="">
      
			<div class="">
				<table class="layui-table" id="everyPeo" lay-filter="everyShow" lay-data="{}">
					<thead>
						<tr>
							<th lay-data="{field:'ordnum',sort:true}">订单编号</th>
							<th lay-data="{field:'ordtime',sort:true}">订单日期</th>
							<th lay-data="{field:'ordmon',sort:true}">订单金额</th>							 							 
						</tr>
					</thead>
					<tbody>
						 <c:forEach var="i" items="${person_score}">
					    	<tr>
						    	<td>${i.number }</td>
						    	<td>${i.ordertime }</td>
						    	<td>${i.pay_price }</td>
						    </tr>
				    	</c:forEach>		 
					</tbody>
				</table>	 
			</div>		 
	  </div>
  </div>
</body>

<script type="text/javascript" src="layui/layui.js"></script>
	<script>
		layui.use(['element', 'layer', 'form', 'table' ],function() {
					var $ = layui.jquery, 
					element=layui.element,
					form = layui.form, 
					table = layui.table, 
					layer = parent.layer === undefined ? layui.layer: parent.layer;	
					table.init('everyShow');
				});		 
	     
	</script>
</html>