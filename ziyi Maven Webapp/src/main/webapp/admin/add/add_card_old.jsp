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
		<title>激活会员卡</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<script type="text/javascript" src="../../js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="../../js/layui.js"></script>
		<script type="text/javascript" src="../../js/chen.js"></script>
		<script type="text/javascript" src="../../js/yu.js"></script>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend id="chongzhi">激活会员卡</legend>
			</fieldset>
			<form id="form2" class="layui-form" onsubmit="return false">
				<div class="layui-form-item">
				
				<label class="layui-form-label">卡号</label>
					<div class="layui-input-block">
						<input type="text" id="number" name="number" lay-verify="title" autocomplete="off" placeholder="请输入卡编号" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" id="tijiaos" lay-submit="" onclick="add_old('card','bo');" lay-filter="cardAdd" >立即提交</button>
						<button onclick="read_card()" class="layui-btn layui-btn-warm">读卡</button>
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
  
  //自定义验证规则
  form.verify({
  	// 验证
    title: function(value){
      if(value.length <= 0){
        return '卡名称不能为空';
      }
    },
    // 卡折率
  });
//   //监听提交
//   form.on('submit(cardAdd)', function(){
//    add_price('card','addprice');
//   });
});


</script>
</html>