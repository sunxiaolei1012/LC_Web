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
		<title>添加新卡</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<script type="text/javascript" src="../../js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="../../js/layui.js"></script>
		<script type="text/javascript" src="../../js/chen1.js"></script>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>添加新卡</legend>
			</fieldset>
			<form id="form2" class="layui-form" onsubmit="return false">
<!-- 				<div class="layui-form-item"> -->
<!-- 					<label class="layui-form-label">卡编号</label> -->
<!-- 					<div class="layui-input-block"> -->
<!-- 						<input type="text" name="number" lay-verify="title" autocomplete="off" placeholder="请输入卡编号" class="layui-input"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="layui-form-item">
					<label class="layui-form-label">卡类型</label>
					<div class="layui-input-block">
						<select name="ctid">
							<c:forEach  var="cs"  items="${ctype}">
									<option value="${cs.ctid }">${cs.cardtype }------${cs.rebate }</option>
							</c:forEach>
									
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入姓名" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入手机号码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="idcard" lay-verify="title" autocomplete="off" placeholder="请输入身份证号码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-block">
						<input type="text" name="address" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">初始金额</label>
					<div class="layui-input-block">
						<input type="text" name="price" lay-verify="title" autocomplete="off" placeholder="请输入金额" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="cardAdd"  onclick="save('add','newcard')">立即提交</button>
					</div>
				</div>
			</form>
		</div>
		
	</body>
<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate','layer'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
});
</script>
</html>