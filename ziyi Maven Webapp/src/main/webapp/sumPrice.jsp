<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sumIC.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />
		<link rel="stylesheet" type="text/css" href="icheck/minimal/red.css">
		<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
    </head>
 <script type="text/javascript" src="js/ExcelUtil.js"></script>
    <script>
        function exportExcel() {
            ExcelUtils.exportExcel("tableContent");
        }
    </script>
    <body>
    <div class="admin-main">
     				<button onclick="exportExcel()">导出表格</button>
		    <div class="layui-inline">
		      <label class="layui-form-label">日期范围</label>
		      <div class="layui-input-inline">
		        <input type="text" class="layui-input" id="test6" placeholder=" ~ ">
		      </div>
		    </div>
     	<fieldset class="layui-elem-field">
				<legend>营业报表</legend>
				 <div class="layui-field-box">
  <table class="site-table table-hover" id="tableContent" >
  		<tr>
  			<th>名称</th>
  			<th>现金</th>
  		</tr>
  		
  		<tr>
  	
  		<td>现金消费</td>
  		<td>${maps["1"]}</td>
  		</tr>
  		<tr>
  		<td>Ic卡消费</td>
  		<td>${maps["2"]}</td>
  			</tr>
  		<tr>
  		<td>支付宝消费</td>
  		<td>${maps["3"]}</td>
  			</tr>
  		<tr>
 		<td>微信消费</td>
  		<td>${maps["4"]}</td>
  			
	</tr>
 </table>
  </body>
  <script type="text/javascript" src="js/layer.js"></script>
		<script type="text/javascript" src="icheck/icheck.js"></script>
		<script type="text/javascript" src="layui/layui.js"></script>
  	<script>
	 layui.use('laydate', function(){
  var laydate = layui.laydate;
  		
  		laydate.render({
  		  elem: '#test6'
   		 ,range: '~'
   		 ,done: function(value, date, endDate){
//点击日期、清空、现在、确定均会触发。回调返回三个参数，分别代表：生成的值、日期时间对象、结束的日期时间对象
        if(value){
            let strArr = value.split('~');
            var begintime = strArr[0];
            var endtime = strArr[1];
            alert(begintime)
            alert(endtime)
           
            window.location.href='Order_sumPrice?begintime='+begintime+'&endtime='+endtime;
            
        }else{
            var begintime='';
            var endtime='';
        }
 
    }
   		 
   		}); 
 	 });	
</script>
</html>
