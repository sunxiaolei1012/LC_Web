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
		<title>添加用户</title>
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
				<legend>添加商品</legend>
			</fieldset>
			<form id="form2" class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品金额</label>
					<div class="layui-input-block">
						<input type="text" name="price" lay-verify="title" autocomplete="off" placeholder="请输入商品金额" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品单位</label>
					<div class="layui-input-block">
						<input type="text" name="unit" lay-verify="title" autocomplete="off" placeholder="请输入商品单位" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否折扣</label>
					<div class="layui-input-block">
						<input type="text" name="rebate" lay-verify="title" autocomplete="off" placeholder="请输入商品折扣" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">折扣比例</label>
					<div class="layui-input-block">
						<input type="text" name="proportion" lay-verify="title" autocomplete="off" placeholder="请输入折扣比例" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品类型</label>
					<div class="layui-input-block">
						<input type="text" name="typeid" lay-verify="title" autocomplete="off" placeholder="类型" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品说明</label>
					<div class="layui-input-block">
						<input type="text" name="xiangxi" lay-verify="title" autocomplete="off" placeholder="请输入商品说明" class="layui-input">
					</div>
				</div>
					<div class="layui-form-item">
					<label class="layui-form-label">商品数量</label>
					<div class="layui-input-block">
						<input type="text" name="number" lay-verify="title" autocomplete="off" placeholder="请输入商品数量" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="save('add','sellingtype')">立即提交</button>
					</div>
				</div>
			</form>
		</div>
		
	</body>
<script type="text/javascript">

</script>
</html>