<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Table</title>
		<link rel="stylesheet" href="../layui/css/layui.css" media="all" />
		<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
	</head>
	 
	<body>
	    <br><br>
		<div id="formbox">
		    <form class="layui-form">
		          <div class="layui-form-item">
				    <label class="layui-form-label">店铺名称</label>
				    <div class="layui-input-block">
				      <input type="text" name="title" autocomplete="off" placeholder="请输入" class="layui-input" id="title">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">店铺地址</label>
				    <div class="layui-input-block">
				      <input type="text" name="address" autocomplete="off" placeholder="请输入" class="layui-input" id="address">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">联系电话</label>
				    <div class="layui-input-block">
				      <input type="text" name="phone" autocomplete="off" placeholder="请输入" class="layui-input" id="phone">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button type="button" class="layui-btn" onclick="subChange()">提交</button>
				      <button type="reset" class="layui-btn layui-btn-primary">取消</button>
				    </div>
				  </div>
		    </form> 
	   </div>
		
		<script type="text/javascript" src="../layui/layui.js"></script>
		
			<script>
			 layui.use(['element', 'layer','form'], function () {
					  var element = layui.element;
					  var layer = layui.layer;
					  var $ = layui.jquery;
					  var form = layui.form;
					});
			 $(document).ready(function(){
				 navPress();
			 })
			 function navPress(){
				 $.ajax({
	       		       type:"post",
	       		       url:"dayin_properties",
	       		       dataType:"json",
	       		       cache:false,
	       		       async: false,
	       		       success:function(d){ 
	       		    	    $('#title').val(d.name);
	       		    	    $('#address').val(d.address);
	       		    	    $('#phone').val(d.tel);
	       		        } 
	       		    });  
	       		 
			 }
			 function subChange(){
				 var name = $('#title').val();
	    	     var address = $('#address').val();
	    	     var tel = $('#phone').val();
				 $.ajax({
	       		       type:"post",
	       		       url:"dayin_set?name="+name+"&address="+address+"&tel="+tel,
	       		       dataType:"json",
	       		       cache:false,
	       		       async: false,
	       		       success:function(d){
	       		    	   if(d.status=='true'||d.status==true){
	       		    		  layer.msg(d.msg,{time:2000});
	       		    	   }	       		    	    
	       		        } 
	       		    }); 
				 
			 }
		</script>
	</body>

</html>