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
</head>   
<body>
	<div class="admin-main">
		<!-- <blockquote class="layui-elem-quote">	 		 
		</blockquote> -->
		<fieldset class="layui-elem-field">
			<legend>旧卡管理</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-filter="cardshow">
					<thead>
						<tr>   
						    <th lay-data="{field:'orderid', sort: true}">卡编号</th>							
							<th lay-data="{field:'money'}">操作人</th>
							<th lay-data="{field:'edit'}">编辑</th>							
						</tr>
					</thead>
					<tbody>
 					<c:forEach var="is" items="${list }">
 						<tr>
<%-- 						 	<td>${is.number }</td> --%>
							<td>${is.number }</td>
						 	<td>${is.value}</td>
						 	<td>
						 	  <a href="javascript:;" class="layui-btn layui-btn-xs" onclick="editfun()">编辑</a> 
						 	  <a href="javascript:;" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
							</td>
						 </tr>
 					</c:forEach>
						 
					</tbody>
				</table>
				<div id="page" class="page"></div>
			</div>
		</fieldset>
	</div>
	<div id="editTable" style="display:none;">
	<br>
	     <div>
	     	<form action="" class="layui-form">
	     		<div class="layui-form-item">
					<label class="layui-form-label">卡编号</label>
					<div class="layui-input-block">
						<input type="text" name="cardtype" value="" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">操作人</label>
					<div class="layui-input-block">
						<input type="text" name="cardname"  value="" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">操作时间</label>
					<div class="layui-input-block">
						<input type="text" name="cardtime"  value="" class="layui-input">
					</div>
				</div>				 
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="">立即提交</button>
					</div>
				</div>
	     	</form>
	     </div>
	</div> 
	<script type="text/javascript" src="../layui/layui.js"></script>
	<script>		      
		layui.use([ 'laypage','laydate', 'form', 'table' ],function() {
							var $ = layui.jquery, 
							laypage = layui.laypage, 
							laydate=layui.laydate,
							form = layui.form, 
							table = layui.table; 							 							 
							table.init("cardshow");
							 //page					 
							 laypage.render({
								 elem:'page'
								 ,count:30  //总条数
							      
							 })						 
						});		
	   function editfun(){
		   layer.open({
			   title:'旧卡修改',
			   type: 1,
				shade: false,
// 				btn:['确认','取消'],
// 				btnAlign:'c',
				// offset:'t',   //弹出框位置
				closeBtn:1,      //按钮位置
               anim: 1,         //弹窗弹出动画
               maxmin:true,
               fixed:true,
				skin: 'layui-layer-molv', //加上边框
				area: ['500px', '600px'], //宽高
				content: $("#editTable"),   //引入html内容
		   });
	   }
	</script>

</body>

</html>