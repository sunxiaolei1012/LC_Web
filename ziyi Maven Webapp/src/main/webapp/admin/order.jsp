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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
</head>   
<body>
	<div class="admin-main">
		<blockquote class="layui-elem-quote">	 
			<form class="layui-form layui-inline" style="margin-top: 1%;">
				<div class="layui-form-item">
					<div class="layui-inline">				     
				        <label class="layui-form-label">日期范围</label>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="starttime" placeholder="开始时间" value="">
				        </div>
				        <div class="layui-form-mid">~</div>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="endtime" placeholder="结束时间" value="">
				        </div>
				    </div> 				    
					<div class="layui-inline">
						<label class="layui-form-label">搜索</label>
						<div class="layui-input-inline">
							<input type="text" name="search" placeholder="请输入搜索内容"
								class="layui-input" id="search" value=" ">
						</div>
						<button type="button" class="layui-btn" id="searchbtn"
							onclick="searOrder()">
							<i class="layui-icon">&#xe615;</i>搜索
						</button>
					</div>				
				</div>
			</form>
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>订单记录</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-filter="ordershow">
					<thead>
						<tr>
						    <th lay-data="{field:'orderid'}">订单编号</th>
							<th lay-data="{field:'time', sort: true}">订单时间</th>
							<th lay-data="{field:'money'}">订单金额</th>
							<th lay-data="{field:'operation'}">操作</th>
						</tr>
					</thead>
					<tbody>
 					<c:forEach  items="${order}" var="o">
						 <tr>
						 	<td>${o.number }</td>
						 	<td>${o.checkouttime}</td>
						 	<td> ${o.pay_price} </td>
						 	<td><a href="javascript:;" class="layui-btn layui-btn-xs" onclick="press(${o.number})">打印</a></td>
						 </tr>
 					</c:forEach>
					</tbody>
				</table>
				<div id="page" class="page"></div>
		</fieldset>
	</div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script>		      
		layui.use([ 'laypage','laydate', 'form', 'table' ],function() {
							var $ = layui.jquery, 
							laypage = layui.laypage, 
							laydate=layui.laydate,
							form = layui.form, 
							table = layui.table; 							 
							//日期
					         var start = laydate.render({  
					                elem: '#starttime',
					                done:function(value,date){
					                    endMax = end.config.max; //最大范围是结束时间的最大范围
					                    end.config.min = date;   //结束时间的最小日期是开始时间的选择日期 
					                    end.config.min.month = date.month -1;
					                }
					            });
					         var end = laydate.render({  
					               elem: '#endtime',
					               done:function(value,date){
					                   if($.trim(value) == ''){
					                       var curDate = new Date();
					                       date = {'date': curDate.getDate(), 'month': curDate.getMonth()+1, 'year': curDate.getFullYear()};
					                   }
					                   start.config.max = date;  //开始日期的最大范围是结束时间的选择日期
					                   start.config.max.month = date.month -1;
					               }
					            });					 
							
							table.init("ordershow");
							 //page					 
							 laypage.render({
								 elem:'page'
								 ,count:30  //总条数							      
							 })							 
						});
		//搜索
		function searOrder() {
			var searchval = $.trim($('#search').val());
			
			var begintime = $("#starttime").val();
			var endtime = $("#endtime").val();
				alert(begintime);
			 window.location.href = "Order_select_orderStatus?begintime="+begintime+"&endtime="+endtime+"&orderId="+searchval;
				
// 			window.location.href = "";
		}
		function press(number){
			alert(number);
		
			  $.ajax({
				  	 url:"dayin_number?number="+number,
				  	 type:"POST",
				  	   success(c){
				  	 if(null!=c&&c!=0){
				 
					alert(c);
				  	 }
				  	 else{
				  	 
				  	 alert("打印失败！");
				  	 } 

			}
		    })
			console.log('打印订单');
		}
	</script>

</body>

</html>