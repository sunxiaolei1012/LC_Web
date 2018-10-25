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
    
    <title>My JSP 'error.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="utf-8">
	<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico"  >
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            /* css 代码  */
        </style>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
          
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/drilldown.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
        <script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
    </head>
    <body onload="che()">
        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
       <div>${dayPrice}.day</div>
    </body>
    <script type="text/javascript">
    	function adc()
    	{
    			
		
		
		
    	}
    
    function che()
    {
    Highcharts.chart('container', {
   
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '库存统计'
		    },
		 
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: '单位：元'
		        }
		    },
		    legend: {
		        enabled: false
		    },
		    plotOptions: {
		        series: {
		            borderWidth: 0,
		            dataLabels: {
		                enabled: true,
		                format: '{point.y:.1f}'
		            }
		        }
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
		    },
		    series: [{
		        name: '商品种类',
		        colorByPoint: true,
		        data: [
		          <c:forEach  items="${selling_type}" varStatus="i"  var ="sort" >
    		 
    		 	{
		            name: '${sort.type_name}',
		            y: 100,
		            drilldown: ${sort.type_id},
		        }
    		</c:forEach> 
		         ]
		    }],
		    drilldown: {
		    
		         
		        series: [<c:forEach  items="${selling_type}" varStatus="i"  var ="sort" >{
		  
		            name:  ${sort.type_id},
		            id:  ${sort.type_id},
		         
		            data: [
		           
		            <c:forEach items="${selling_list}" var="day"  varStatus="i">
		               [
		              <c:if test="${day.typeid eq sort.type_id}">
		                  '${day.name}',
		                    ${day.number}
		                   </c:if>
		                ],
		                 </c:forEach>
		                
		            ]
		        },</c:forEach>  ]
		   }
		})
    
    }
    	
    </script>
</html>