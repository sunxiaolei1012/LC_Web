<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="layui/layui.js"></script>
	
	<script type="text/javascript" src="js/jquery.min.js"></script> 
	<script src="js/jquery.js" type="text/javascript"></script>
	
  </head>

  <body >
  <center>
			<h1>文件上传</h1>
				<h2><form action="upload_image" method="post" enctype="multipart/form-data">
					上传文件1：<input type="file" name="upload"> </br>
					上传文件2：<input type="file" name="upload"> </br>
					上传文件3：<input type="file" name="upload"> </br>
					<input type="submit" value="提交">${result}
				</form></h2>
				</center>
  </body>
</html>
