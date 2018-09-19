<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<script type="text/javascript" src="layui/layui.js"></script>
</head>
<body>
	 <form class="layui-form" action="">
		<div class="layui-form-item">
		    <label class="layui-form-label">订单编号</label>
		    <div class="layui-input-block">
		      <input type="text" name="" placeholder="请输入订单编号" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">桌号</label>
		    <div class="layui-input-block">
		      <input type="text" name="" placeholder="请输入桌号" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">会员卡号</label>
		    <div class="layui-input-block">
		      <input type="text" name="" placeholder="请输入会员卡号" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">   
		    <div class="layui-inline">
		      <label class="layui-form-label">入店时间</label>
		      <div class="layui-input-inline">
		        <input type="text" name="date" id="date" lay-verify="date" placeholder="2018-9-16" autocomplete="off" class="layui-input">
		      </div>
		    </div>   
		  </div>
		  <div class="layui-form-item">   
		    <div class="layui-inline">
		      <label class="layui-form-label">结算时间</label>
		      <div class="layui-input-inline">
		        <input type="text" name="date" id="date" lay-verify="date" placeholder="2018-9-16" autocomplete="off" class="layui-input">
		      </div>
		    </div>   
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">完成状态</label>
		    <div class="layui-input-block">
		      <select name="interest">
		        <!-- <option value=""></option> -->
		        <option value="0" selected="">已完成</option>
		        <option value="1">未完成</option>       
		      </select>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">订单总金额</label>
		    <div class="layui-input-block">
		      <input type="text" name="" placeholder="订单总金额" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">是否打折</label>
		    <div class="layui-input-block">
		      <input type="radio" name="discount" value="是" title="是" checked="">
		      <input type="radio" name="discount" value="否" title="否">
		    </div>
		  </div>  
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn">立即提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div>
	 </form>
</body>
<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  //日期
  laydate.render({
    elem: '#date'
  });
  

});
</script>
</html>