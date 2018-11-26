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
		<script src="layui/layui.js"></script>
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
				<input type="hidden" name="id" value="${users.userid }">
				<input type="hidden" name="userrole" value="${users.userrole }">
				<div class="layui-form-item">
					<label class="layui-form-label">用户账号</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" readonly unselectable="on"  autocomplete="off" value="${users.name}" class="layui-input">
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">用户密码</label>
					<div class="layui-input-block">
						<input type="text" name="password" lay-verify="title" autocomplete="off" value="${users.password}" class="layui-input">
					</div>
				</div>
			
				<div class="layui-form-item">
					<label class="layui-form-label">用户角色</label>
					<div class="layui-input-block">
						<select name="userrole">
							<c:if test="${users.userrole==1 }">
										<option value="1" selected="">管理员</option>
										<option value="3" >服务员</option>
										<option value="2">吧台</option>
							</c:if>
							<c:if test="${users.userrole==2 }">
										<option value="1" >管理员</option>
										<option value="2" selected="">吧台</option>
										<option value="3" >服务员</option>
							</c:if>
							<c:if test="${users.userrole==3 }">
										<option value="1" >管理员</option>
										<option value="2">吧台</option>
										<option value="3" selected="">服务员</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="save('xiu','user')">立即提交</button>
					</div>
				</div>
			</form>
		</div>
		
	</body>
<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
 
});
</script>
</html>