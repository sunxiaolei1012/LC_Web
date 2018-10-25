<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PayTypePrice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/sxl.js"></script>
		<script type="text/javascript" src="js/layer.js"></script>
		<script type="text/javascript" src="icheck/icheck.js"></script>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
  <script type="text/javascript" src="js/ExcelUtil.js"></script>
    <script>
        function exportExcel() {
            ExcelUtils.exportExcel("tableContent");
        }
    </script>
    <script type="text/javascript">
    	function editbtn(edit,uid)
                     { 
                     var typeid=uid;
                    
                     	layer.open({
					      type: 2,
					      title: "编辑",				       
					      area: ['600px', '400px'],
					      content: "m_checkByType?typeid="+typeid,
					      cancel: function (index, layero) {
					        $(".dw-refresh").trigger('click');
					        return true;
					      }
					    });
					    
					}    
    	
    </script>
  
  <body>
  <button onclick="exportExcel()">导出表格</button>
  	<fieldset class="layui-elem-field">
				<legend>营业额</legend>
				 <div class="layui-field-box">
					<table class="site-table table-hover" id="tableContent" >
  		
  		<tr>
  		<th>商品类型</th>
  		<th>数量</th>
  		</tr>
  	
  		<c:forEach items="${list}"  var="pay" varStatus="i"  >
  		
  		<tr>
  		
  		<td> ${pay.name} </td>
  		
  		<td> ${pay.number}</td>
  		<%-- <td>
					<a href="javascript:editbtn(this,${pay.typeid});" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
					 <a href="javascript:void(0);" onclick="delUser(this,${product.sellingid})" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini del">删除</a>
			</td> --%>
  		</tr>
  		</c:forEach>
  		
  		
  	</table>
  
 </div>
  </fieldset>
   
  </body>
</html>
