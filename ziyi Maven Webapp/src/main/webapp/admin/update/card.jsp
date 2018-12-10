<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
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
				<input type="hidden" name="id" value="${card.cardid }">
				
				<div class="layui-form-item">
					<label class="layui-form-label">卡状态</label>
					<div class="layui-input-block">
						<select id="selectbox" name="status" lay-filter="cardSta">
							<c:if test="${card.status ==0 }">
								<option value="0" selected>在售</option>
								<option value="1">在用</option>
								<option value="2">收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${card.status ==1 }">
								<option value="0">在售</option>
								<option value="1" selected>在用</option>
								<option value="2">收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${card.status ==2 }">
								<option value="0">在售</option>
								<option value="1">在用</option>
								<option value="2" selected>收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${card.status ==3 }">
								<option value="0">在售</option>
								<option value="1">在用</option>
								<option value="2">收回</option>
								<option value="3" selected>挂失</option>
							</c:if>

						</select>
					</div>
				</div>
				
				<div class="layui-form-item">
					<label class="layui-form-label">卡编号</label>
					<div class="layui-input-block">
						<input type="text" name="number" lay-verify="title" autocomplete="off" value="${card.number}" class="layui-input">
					</div>
				</div>
					<div class="layui-form-item">
					<label class="layui-form-label">卡类型</label>
					<div class="layui-input-block">
						<select name="ctid">
							<c:forEach var="c" items="${card_type}">
								<c:if test="${c.ctid==card.ctid }">
									<option value="${c.ctid }" selected="">${c.cardtype }--${c.rebate }</option>
								</c:if>
								<c:if test="${c.ctid!=card.ctid }">
									<option value="${c.ctid }">${c.cardtype }--${c.rebate }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" autocomplete="off" value="${card.name}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机</label>
					<div class="layui-input-block">
						<input type="text" name="phone" lay-verify="title" autocomplete="off" value="${card.phone}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">地址</label>
					<div class="layui-input-block">
						<input type="text" name="address" lay-verify="title" autocomplete="off" value="${card.address}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="idcard" lay-verify="title" autocomplete="off" value="${card.idcard}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">总金额</label>
					<div class="layui-input-block">
						<input type="text" name="price" lay-verify="title" autocomplete="off" value="${card.price}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">已消费金额</label>
					<div class="layui-input-block">
						<input type="text" name="spend" lay-verify="title" autocomplete="off" value="${card.spend}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">剩余金额</label>
					<div class="layui-input-block">
						<input type="text" name="remain" lay-verify="title" autocomplete="off" value="${card.remain}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="save('xiu','card')">立即提交</button>
					</div>
				</div>
			</form>
		</div>
	</body>
<script type="text/javascript">
layui.use('form', function(){
		
			});
</script>
</html>