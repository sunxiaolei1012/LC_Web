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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script type="text/javascript">
		function Update(){
		var ids=document.getElementById("id").value;
		  alert(ids);
			var contents=document.getElementById("content").value;
			alert(contents);
			$.ajax({
				url:"Update_updateContentss",
				data:"content="+contents+"&id="+ids,
				type:"POST",
				success:function(a){
				if(a==0){
				alert("修改失败！");
				}
				else{
				alert("修改成功");
				}
				window.close();
				
				}
			
			
			})
			
	//window.location.href = "Update_updateContent?content="+contents+"&id="+ids; 
		
		//window.close();
		}
	
	
	</script>
  </head>

  <body>
  	<input type="text"  id="id" name="id" value="${list.get(0).id}">
  修改内容：</br> <textarea name="content" id="content" style="width:200px;height:80px;">${list.get(0).content}</textarea>
  		
   					<button onclick="Update()">提交</button>
  </body>
</html>
