<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'monthPrice.jsp' starting page</title>
    
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
    <a href="m_monthPrices">查询每月的营业额</a>
    <br/>
        <a href="m_sumSellingType">查询库存</a>
         <br/>
       <a href="m_PayTypePrice">统计每天不同支付方式支付金额</a>
        <br/>
        <a href="m_YingYePrice">每个月营业额</a>
          <br/>
        <a href="m_sumlistNumber">每个月营业额</a>
       
       
  </body>
</html>
