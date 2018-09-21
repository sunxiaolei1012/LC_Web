<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>智慧校园</title>
    <meta charset="utf-8">
        <title>用户信息</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">
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
     	<div class="layui-form-item">
		    <div class="layui-inline">
		      <label class="layui-form-label">日期范围</label>
		      <div class="layui-input-inline">
		        <input type="text" class="layui-input" id="test6" placeholder=" ~ ">
		      </div>
		    </div>
     	<fieldset class="layui-elem-field">
				<legend>商品列表</legend>
				 <div class="layui-field-box">
					<table class="site-table table-hover" id="tableContent" >
               <thead>
						<colgroup>
		                      <col width="150">
		                      <col width="150">
		                      <col width="200">
		                      <col>
		                      <col>
		                  </colgroup>
            <tr >
            	<th>会员编号</th>
            	<th>会员名称</th>
            	<th>会员余额</th>
            	<th>会员售卖时间</th>
            </tr>
            <c:forEach items="${sellCard}" var="card" varStatus="i">
            		<tbody>
            	<tr class="table-row">
            	<td>${card.number}</td>
            	<td>${card.name}</td>
            	<td>${card.remain}</td>
            	<td>${card.selltime}</td>
            	</tr>
            	</c:forEach>
				</table>   
				<div id="page" class="page"></div>      
				  </div>
			</fieldset>
				
		</div>	
	 </body>
       
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
           
            window.location.href='Card_sellCard?begintime='+begintime+'&endtime='+endtime;
            
        }else{
            self.data.start = '';
            self.data.end = '';
        }
 
    }
   		 
   		}); 
 	 });	
</script>
<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
			//自定义首页、尾页、上一页、下一页文本
  //不显示首页尾页
  laypage.render({
    elem: 'page'
    ,count:${totalCount}
    ,limit:2
    ,limits:[2, 4, 6]
    ,first: false
    ,last: false
    ,curr:${PageNo}
     ,jump: function(obj, first){
      if(!first){
      window.location.href='Card_sellCard?pageNo='+obj.curr;
       
      }
    }
  });
  });
  
		</script>
		
</html>