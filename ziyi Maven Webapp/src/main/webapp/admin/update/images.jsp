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
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<style type="text/css">
			.imagess{
				width: 200px;
				height: auto;
			}
		</style>
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>编辑</legend>
			</fieldset>
			<form id="form2" class="layui-form">
				<c:choose>
				   <c:when test="${empty image}">  
				   	<div class="layui-upload">
						  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
						  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
						    预览图：
						    <div class="layui-upload-list" id="demo2"></div>
						 </blockquote>
						</div>
				   </c:when>
				   <c:otherwise> 
				   	<div class="layui-upload">
						  <button type="button" class="layui-btn" id="test2">多图片上传</button> 
						  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
						    预览图：
						    <div class="layui-upload-list" id="demo2"></div>
						 </blockquote>
						</div>
				   	<div class="layui-form">
  <table class="layui-table">
    <colgroup>
      <col width="200">
      <col width="200">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>图片</th>
        <th>操作</th>
      </tr> 
    </thead>
    <tbody>
     	<c:forEach var="cs" items="${image}">
		     	<tr>
		        <td><img alt="" src="upload/${cs.url }" class="imagess"></td>
		        <td><a href="javascript:del_image('${cs.id }','${cs.url }')" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a></td>
		      </tr>
				   	
					</c:forEach>
      
    </tbody>
  </table>
</div>
				   
				  
				   </c:otherwise>
				</c:choose>
			</form>
		</div>
		<script src="js/layui.js" charset="utf-8"></script>
	</body>
	<script type="text/javascript">
		function del_image(id,url)
				{
					if(confirm('确认删除吗?'))
						window.location='image_del?id='+${id}+'&url='+url+'&imageid='+id;
				
				}
				
					function del_images(id,url)
				{
					if(confirm('确认删除吗?'))
					{
						 $.ajax({
					       type:"post",
					       url:'image_del?id='+id+'&url='+url,
					       dataType:"json",
					       cache:false,
					       async: false,
					       success:function(d){
					       		alert(d.msg);
					       }
					       })
					}
				
				}
	</script>
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //多图片上传
  upload.render({
    elem: '#test2'
    ,url: 'image_image?id='+${id}
    ,multiple: true
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img imagess" >')
      });
    }
    ,done: function(res){
    	 alert(res.msg);
    	 window.location="image_selling?id="+${id};
    }
  });
  });
  </script>
</html>