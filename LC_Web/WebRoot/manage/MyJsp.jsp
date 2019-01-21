<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  	  <body>
  	  
  	  	
  	  <form action="check_checkJspName" method="post" >
    	页面名称：<input type="text"   name="jspname"/> <input type="submit" value="开始查找">
    	</form>
    	
   	
    	<a href="check_checkJspName" >查找</a>
  </body>
</html>
