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
		<title>添加桌位</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<script type="text/javascript" src="../../js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="../../js/chen.js"></script>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>添加桌位信息</legend>
			</fieldset>
			<form id="form2" class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label">桌子名称</label>
					<div class="layui-input-block">
						<input type="text" name="housename" lay-verify="title" autocomplete="off" placeholder="请输入桌位名称" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">桌子位置</label>
					<div class="layui-input-block">
						<input type="text" name="position" lay-verify="title" autocomplete="off" placeholder="请输入位置" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="save('add','teahouse')">立即提交</button>
					</div>
				</div>
			</form>
		</div>
		
	</body>
<script type="text/javascript">

</script>
</html>