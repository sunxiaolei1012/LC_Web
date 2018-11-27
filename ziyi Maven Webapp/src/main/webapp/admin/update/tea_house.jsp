<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8">
		<title>表单</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>		
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<script type="text/javascript" src="js/chen1.js"></script>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>编辑</legend>
			</fieldset>

			<form id="form2" class="layui-form">
				<input type="hidden" name="id" value="${house.houseid }">
				<div class="layui-form-item">
					<label class="layui-form-label">桌位名称</label>
					<div class="layui-input-block">
						<input type="text" name="housename" lay-verify="title" autocomplete="off" value="${house.housename }" class="layui-input">
					</div>
				</div>
					<div class="layui-form-item">
					<label class="layui-form-label">桌位状态</label>
					<div class="layui-input-block">
						<select name="sta">
							<c:if test="${house.status==0 }">
								<option value="0" selected="">空闲</option>
								<option value="1" >占用</option>
								<option value="2">预约</option>
								<option value="3">其他</option>
							</c:if>
								<c:if test="${house.status==1 }">
								<option value="0" >空闲</option>
								<option value="1"  selected="">占用</option>
								<option value="2">预约</option>
								<option value="3">其他</option>
							</c:if>	
								<c:if test="${house.status==2 }">
								<option value="0" >空闲</option>
								<option value="1" >占用</option>
								<option value="2" selected="">预约</option>
								<option value="3">其他</option>
							</c:if>	
							<c:if test="${house.status!=0 &&house.status!=1&&house.status!=2 }">
								<option value="0" >空闲</option>
								<option value="1" >占用</option>
								<option value="2" >预约</option>
								<option value="3" selected="">其他</option>
							</c:if>	
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">桌位位置</label>
					<div class="layui-input-block">
						<input type="text" name="position" lay-verify="title" autocomplete="off" value="${house.position }" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="save('xiu','teahouse')">立即提交</button>
					</div>
				</div>
			</form>
		</div>
		
	</body>
<script type="text/javascript">
layui.use('form', function(){
			var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
			  form.render();
			});
</script>
</html>