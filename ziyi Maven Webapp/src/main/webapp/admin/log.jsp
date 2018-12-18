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
  ${ type }
	<div class="admin-main">
		<blockquote class="layui-elem-quote">	 
			<form class="layui-form layui-inline" style="margin-top: 1%;">
				<div class="layui-form-item">
					<div class="layui-inline">				     
				        <label class="layui-form-label">日期范围</label>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="starttime" placeholder="开始时间" value="${begintime }">
				        </div>
				        <div class="layui-form-mid">~</div>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="endtime" placeholder="结束时间" value="${endtime }">
				        </div>
				    </div>
				    <div class="layui-inline">
				         <label class="layui-form-label">操作选择</label>
						 <div class="layui-input-inline"> 
							 <select id="selectbox" name="category" lay-filter="logSta">
							       <%--  <c:if test="${type}==0">	
										<option value="0" selected>全部</option>
										<option value="1">登录</option>
										<option value="2">预约</option>
										<option value="3">点单</option>
										<option value="4">换桌</option>							 
										<option value="5">添加</option>
										<option value="6">减少</option>
										<option value="7">结账</option>							 
										<option value="8">取消订单</option>							 
										<option value="9">充值</option>
										<option value="10">其他</option>
									</c:if> --%>
									
									
							 </select>
						</div>
				    </div>
					<div class="layui-inline">
						<label class="layui-form-label">搜索</label>
						<div class="layui-input-inline">
							<input type="text" name="search" placeholder="请输入搜索内容"
								class="layui-input" id="search" value="${value }">
						</div>
						<button type="button" class="layui-btn" id="searchbtn"
							onclick="searLog()">
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
						    <th lay-data="{field:'name'}">记录</th>
							<th lay-data="{field:'time', sort: true}">操作时间</th>
							<th lay-data="{field:'operation'}">操作类型</th>
						</tr>
					</thead>
					<tbody>
 
						<c:forEach items="${list}" var="v">
							<tr>
								<td>${v.value}</td>
								<td>${v.time }</td>
								<td>${v.type }</td>
							</tr>
						
						</c:forEach>
 
					</tbody>
				</table>
				<div id="page" class="page"></div>
		</fieldset>
	</div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script>	
	    $(document).ready(function(){
	    	seclectAdd();
	    })
	    function seclectAdd(){
	    	var arr =['全部','登录','预约','点单','换桌','添加','减少','结账','取消订单','充值','其他'];
	    	var seclectBox = $("#selectbox");
	    	var type = 0;
	    	if(${!empty type})
	    		type=${type}+1;
	    	for(var i=0;i<11;i++){
	    		if(type-1==i){
	    			seclectBox.append('<option value="'+i+'" selected>'+arr[i]+'</option>');
	    		}else{
	    			seclectBox.append('<option value="'+i+'">'+arr[i]+'</option>');
	    		}    		
	    	}
	    	layui.use('form',function(){
	    		var form = layui.form;
	    		form.render('select','logSta');
	    	})
	    }
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
// 					                    starttime = value;
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
// 					                   endtime = value;
					               }
					            });					 
							
							table.init('logshow');
							 //page					 
							 laypage.render({
								 elem:'page'
								 ,count:${sum}  //总条数
							     ,limit:20
							     //,limits:[10, 20, 30]
							     ,first: '首页'
							     ,last: '尾页'
							     ,layout:['prev', 'page', 'next','skip','count']  //排版
							     ,curr:${page}  //当前页
							     ,jump: function(obj, first){  //obj（当前分页的所有选项值）、first（是否首次，一般用于初始加载的判断）
							     if(!first){
							    	var searchval = $.trim($('#search').val());
							    	var selectval = $("#selectbox").val();	
							    	var begintime = $("#starttime").val();
									var endtime = $("#endtime").val();
							      	window.location.href='log_get?page='+obj.curr+'&begintime='+begintime+'&endtime='+endtime+'&type='+selectval+'&value='+searchval;							       
							      }
							    }
							 })
							//选择框
							form.on("select(logSta)", function(data) {
								var searchval = $.trim($("#search").val());
								var begintime = $("#starttime").val();
								var endtime = $("#endtime").val();
								window.location.href = "log_get?begintime="+begintime+"&endtime="+endtime+"&type="+data.value+"&value="+searchval;
							})

						});
		//搜索
		function searLog() {
			var searchval = $.trim($('#search').val());
			var selectval = $("#selectbox").val();
			var begintime = $("#starttime").val();
			var endtime = $("#endtime").val();
			window.location.href = "log_get?begintime="+begintime+"&endtime="+endtime+"&type="+selectval+"&value="+searchval;
		}
	</script>

</body>

</html>