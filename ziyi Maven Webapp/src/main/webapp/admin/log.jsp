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
<link rel="stylesheet" href="../layui/css/layui.css" media="all" />
<link rel="stylesheet" href="../css/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="../css/table.css" />
<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
<script>
	function seacard() {
		var searchval = $.trim($('#search').val());
		var selecval = $("#selectbox").val();
		if (searchval == ''||searchval == null) {
			alert('输入内容不能为空');
		} else {
          console.log(searchval);
		}
	}
</script>
</head>

<body>
	<div class="admin-main">
		<blockquote class="layui-elem-quote">
			 
			<form class="layui-form layui-inline" style="margin-top: 1%;">
				<div class="layui-form-item">
					<div class="layui-inline">				     
				        <label class="layui-form-label">日期范围</label>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="starttime" placeholder="开始时间">
				        </div>
				        <div class="layui-form-mid">~</div>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="endtime" placeholder="结束时间">
				        </div>
				    </div>
				    <div class="layui-inline">
				         <label class="layui-form-label">操作选择</label>
						 <div class="layui-input-inline"> 
							 <select id="selectbox" name="category" lay-filter="logSta">							 
									<option value="-1" selected>全部</option>
									<option value="0">登录</option>
									<option value="1">预约</option>
									<option value="2">点单</option>
									<option value="3">换桌</option>							 
									<option value="4">添加</option>
									<option value="5">预约</option>
									<option value="6">减少</option>
									<option value="7">结账</option>							 
									<option value="8">取消订单</option>							 
									<option value="9">充值</option>
									<option value="10">其他</option>
							 </select>
						</div>
				    </div>
					<div class="layui-inline">
						<label class="layui-form-label">搜索</label>
						<div class="layui-input-inline">
							<input type="text" name="search" placeholder="请输入搜索内容"
								class="layui-input" id="search" value="">
						</div>
						<button type="button" class="layui-btn" id="searchbtn"
							onclick="seacard()">
							<i class="layui-icon">&#xe615;</i>搜索
						</button>
					</div>				
				</div>
			</form>

		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>操作日志</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-filter="logshow">
					<thead>
						<tr>
						    <th lay-data="{field:'name'}">姓名</th>
							<th lay-data="{field:'time', sort: true}">操作时间</th>
							<th lay-data="{field:'operation'}">操作类型</th>
<!-- 							<th lay-data="{field:'edit'}">编辑</th> -->
						</tr>
					</thead>
					<tbody>
						 <tr>
						    <td>1</td>
						    <td>20181217</td>
						    <td>全部</td>
						 </tr>
						  <tr>
						    <td>1</td>
						    <td>20181217</td>
						    <td>全部</td>
						 </tr>
						  <tr>
						    <td>1</td>
						    <td>20181218</td>
						    <td>全部</td>
						 </tr>
					</tbody>
				</table>
				<div id="page" class="page"></div>
		</fieldset>
	</div>
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script type="text/javascript" src="../js/chen1.js"></script>
	<script>		 
		var selectval;
		layui.use([ 'laypage','laydate', 'layer', 'form', 'table' ],function() {
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
							
							table.init('logshow');
							 //page
							 laypage.render({
								 elem:'page',
								 count:50
							 })
							//选择框
							form.on("select(logSta)", function(data) {
								var serval = $.trim($("#search").val());
								console.log(data.value +","+ serval);
							})

						});
	</script>

</body>

</html>