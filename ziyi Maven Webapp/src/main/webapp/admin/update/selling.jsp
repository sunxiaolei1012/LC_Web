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
			<script type="text/javascript" src="js/chen.js"></script>
			<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>编辑</legend>
			</fieldset>

			<form id="form2" class="layui-form">
				<input type="hidden" name="id" value="${sl.sellingid }">
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" autocomplete="off" value="${sl.name}" class="layui-input">
					</div>
				</div>
					<div class="layui-form-item">
					<label class="layui-form-label">商品类型</label>
					<div class="layui-input-block">
						<select name="typeid">
						    	<c:forEach var="cs" items="${ty}">
						    		<c:if test="${cs.type_id ==sl.typeid}">
						    			<option value="${cs.type_id }" selected="" >${cs.type_name }</option>
						    		</c:if>
						    		<c:if test="${cs.type_id !=sl.typeid}">
						    			<option value="${cs.type_id }" >${cs.type_name }</option>
						    		</c:if>
						    		
								</c:forEach>
						</select>		
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品价钱</label>
					<div class="layui-input-block">
						<input type="text" name="price" lay-verify="title" autocomplete="off" value="${sl.price}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品单位</label>
					<div class="layui-input-block">
						<input type="text" name="unit" lay-verify="title" autocomplete="off" value="${sl.unit}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">是否打折</label>
					<div class="layui-input-block">
						<select name="rebate">
							<c:if test="${sl.rebate == 0 }">
								<option value="1" selected="">不打折</option>
								<option value="0">打折</option>
							</c:if>
							<c:if test="${sl.rebate == 1 }">
								<option value="0">不打折</option>
								<option value="1"  selected="">打折</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">折率</label>
					<div class="layui-input-block">
						<input type="text" name="proportion" lay-verify="title" autocomplete="off" value="${sl.proportion}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">详细说明</label>
					<div class="layui-input-block">
						<input type="text" name="xiangxi" lay-verify="title" autocomplete="off" value="${sl.xiangxi}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品数量</label>
					<div class="layui-input-block">
						<input type="text" name="number" lay-verify="title" autocomplete="off" value="${sl.number}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="save('xiu','selling')">立即提交</button>
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