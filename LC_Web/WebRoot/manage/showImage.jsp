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
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="layui/css/layui.css" media="all" />
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="layui/layui.js" ></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/sxl.js" ></script>
	<script type="text/javascript">
		function openwin(x)  
	{ 
		var str=x; 
		window.open(str,'newwindow','height=600,width=800,top=200,left=600,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no，depended=yes')
		} 
			//window.open('page.html', 'newwindow', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')   //该句写成一行代码
	</script>  
	
	


  </head>
  	  <body>
  	  	<!-- <div class="layui-inline">	
						<label class="layui-form-label">搜索员工</label>
						<div class="layui-input-inline">
							<input type="text" name="search" placeholder="请输入搜索内容"
								class="layui-input" id="search" value="">
						</div>
						<button type="button" class="layui-btn" id="searchbtn"
							onclick="seaPeo()">
							<i class="layui-icon">&#xe615;</i>搜索
						</button>
				    </div>		 -->
  	  	<div class="layui-inline">
  	  	
  	  		<form action="check_checkImage" method="post" >
  	  		<label class="layui-form-label">搜索页面</label>
  	  		<div class="layui-input-inline">
    	<input type="text"   name="jspname"  placeholder="请输入搜索内容"class="layui-input" id="search" value=""> 
    		</div>
    	<input type="submit"  class="layui-btn" value="开始查找">
							
    	</form>
    		</div>
    	
  	 
  	  			<table  class="layui-table" lay-size=""  >
  	  				<tr bgcolor="009688">
  	  					<th>id</th>
  	  					<th>标题</th>
  	  					<th>内容</th>
  	  					<th>所属页面</th>
  	  					<th>操作</th>
  	  				</tr>
  	  				
  	  		<c:forEach items="${list}" varStatus="i" var="list">		
  	  			<tr>
  	  				<td>${list.id}</td>
  	  				<td>${list.name}</td>
  	  				<td><img src="image/${list.route}"  ></td>
  	  				<td>${list.jspname}</td>
  	  				<td>
  	  				<a class="layui-btn layui-btn-xs" lay-event="edit" href="javascript:void(0)" onClick="openwin('check_changeContent?id=${list.id}')">修改</a> 
  	  				<a class="layui-btn-danger layui-btn-mini" lay-event="del" href="javascript:void(0)" onClick="delImage(id=${list.id})">删除</a> 
 				
  	  				</td>
  	  				
  	  			</tr>	
  	  			</c:forEach>
  	  			
  	  			</table>

  			
  </body>
</html>
