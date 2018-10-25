<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<script type="text/javascript" src="charts/js/highcharts.js"></script>
	<script type="text/javascript" src="charts/js/exporting.js"></script>
	<script type="text/javascript" src="charts/js/drilldown.js"></script>
	<script type="text/javascript" src="charts/js/highcharts-zh_CN.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>  
	<script type="text/javascript" src="layui/layui.js"></script>
	<style type="text/css">
		.changeshow{
			display: flex;
			flex-direction: row;
		}
		.changeshow .layui-btn{
			margin-left: 1%;
		}
		.showclass,.dayshow{
			display: none;
		}
	</style>
</head>

<body>
	<div class="container">
		<!-- 月营业总额显示 -->
		<div class="changeshow">
			<form class="layui-form">
				<div class="layui-form-item">
				    <label class="layui-form-label">月营业总额</label>
				    <div class="layui-input-block">
				    	<!-- 关闭状态是图表显示，开启状态是表格显示 -->
				      <input type="checkbox" name="zzz" lay-skin="switch" lay-filter="switchTest" lay-text="图表显示|表格显示">
				    </div>
				</div>
		    </form>		    
		</div>
		<div id="chartshow" class="chartshow">
			<div id="container" style="min-width: 310px; height: 600px; margin: 0 auto"></div>
		</div>
		<div id="tableshow" class="tableshow showclass">
			<fieldset class="layui-elem-field">
			    <legend>月营业总额</legend>
				<table class="layui-table" id='tabmonth' lay-data="{limit:10,page:true,}">
					<thead>
					    <tr>
						  <th lay-data="{field:'id',sort: true}">月份</th>
					      <th lay-data="{field:'mmoney',sort: true}">销售额</th>				       
					      <th lay-data="{field:'eara'}">操作</th>				       
					    </tr>
					</thead>
					<tbody id='monthval'>
					    <c:forEach var="i" items="${list}" > 		
					  		<tr>				  		
						  		<td> ${i.month} </td>					  		
						  		<td> ${i.value}</td>
						  		<td><a href="javascript:daydetail(this,${i.month});" class="layui-btn layui-btn-mini">详情</a></td>
					  		</tr>
				  		</c:forEach>
				  		<%-- <a href="javascript:editbtn(this,${pay.typeid});" class="layui-btn layui-btn-normal layui-btn-mini">预览</a> --%>
						<!-- <tr>
							<td>1</td>
							<td>1314</td>
							<td><a href="javascript:moneydetail();" class="layui-btn layui-btn-mini">详情</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>1314</td>
							<td><a href="javascript:moneydetail();" class="layui-btn layui-btn-mini">详情</a></td>
						</tr> -->
					</tbody>
				</table>
				<!-- <div id="page" class="page"></div> -->
			</fieldset>
		</div>
         
	</div>
</body>
<!-- 弹出框详情：营业总额显示 -->
<div id="tabledetail" class="tabledetail" style="display: none;">
	    <div class="changeshow">
			<form class="layui-form">
				<div class="layui-form-item">
				    <label class="layui-form-label">日营业总额</label>
				    <div class="layui-input-block">
				    	<!-- 关闭状态是图表显示，开启状态是表格显示 -->
				      <input type="checkbox" name="zzz" lay-skin="switch" lay-filter="switchTest1" lay-text="图表显示|表格显示">
				    </div>
				</div>
		    </form>
		</div>
		<div id="daychart" class="daychart">
			<div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		</div>
		<div id="daytable" class="tableshow dayshow">
			<fieldset class="layui-elem-field">
			    <legend>日营业总额</legend>
				<table class="layui-table" lay-data="{limit:10,page:true,}">
					<thead>
					    <tr>
						  <th lay-data="{field:'day',sort: true}">日期</th>
					      <th lay-data="{field:'dmoney',sort: true}">销售额</th>				       
					    </tr>
					</thead>
					<tbody id="dayval">
						<!-- <tr>
							<td>1月1日</td>
							<td>1314</td>
						</tr>
						<tr>
							<td>1月2日</td>
							<td>1314</td>
						</tr> -->
					</tbody>
				</table>
				
				<!-- <div id="page1" class="page"></div> -->
			</fieldset>
			
		</div>
</div>

<script>



function daydetail(a,b){
	 <c:forEach var="i" items="${list}" > 
// 	 	alert(${i.month} == b);
		var c = ${i.month};
		if(c = b)
		{
			<c:if test="${i.month==b}">
			 <c:forEach var="is" items="${i.day_value}" >
			 	
			 	
			 	
			 	console.log(${is.value});	 
			 </c:forEach>
			 </c:if>
		}
	</c:forEach>
}


layui.use(['element','form','table','laydate','laypage'], function(){
  var element = layui.element
  ,form = layui.form
  ,layer = layui.layer
  ,table = layui.table
  ,laydate = layui.laydate
  ,laypage = layui.laypage;
	 
  //监听指定开关
  form.on('switch(switchTest)', function(data){
   //显示方式切换：关闭图表显示，开启表格显示
    if(this.checked=='true'){
       $('#tableshow').toggleClass('showclass');
       $('#chartshow').toggleClass('showclass');
    }else{
       $('#tableshow').toggleClass('showclass');
       $('#chartshow').toggleClass('showclass');
    }
  });
  //监听指定开关:每日营业额显示
  form.on('switch(switchTest1)', function(data){
    if(this.checked=='true'){
       $('#daychart').toggleClass('dayshow');
       $('#daytable').toggleClass('dayshow');
    }else{
       $('#daychart').toggleClass('dayshow');
       $('#daytable').toggleClass('dayshow');
    }
  });
});
var oChart1;
$(document).ready(function(){
	//营业额
	var oChart = Highcharts.chart('container', {
		credits: {  //logo
		     enabled: false
		},
		chart: {
			type: 'column'
		},
		title: {
			text: '茶室营业额'  //主标题
		},
		subtitle: {
			text: ''  //次标题
		},
		xAxis: {
			type: 'category'
		},
		yAxis: {
			title: {
				text: '营业额',
			},
			tickInterval:1000, //步长
			labels: { 
	            formatter:function (){ 
	                return this.value + '元' ; 
	            } 
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
					format: '{point.y:.2f}' //柱形图上数据
				}
			}
		},
		tooltip: {
			headerFormat: '<span style="font-size:11px">{series.name}</span><br>', 
			pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b> of total<br/>'
		},
		series: [
			 {
				 
			name: '月营业额',
			colorByPoint: true,
			data: [
				<c:forEach var="i" items="${list }">
				{
					name: ${i.month},
					y: ${i.value},
					drilldown: ${i.month}
				},
				</c:forEach>
				]
		}],
		drilldown: {
			series: [
				
				<c:forEach var="i" items="${list }">
				{
					name: ${i.month},
					id: ${i.month},
					data: [
						<c:forEach var="is" items="${i.day_value }">
						[
							' ${is.key}',
							${is.value}
							
						],
						</c:forEach>
					]
				},
				</c:forEach>
				
				]
		}
	});
	//日营业额图表
	 oChart1 = Highcharts.chart('container1', {
		credits: {
		     enabled: false
		},
		chart: {
			type: 'column'
		},
		title: {
			text: '日营业额图表'
		},
		subtitle: {
			text: ''
		},
		xAxis: {
			type: 'category',
			labels: {
				rotation: 0  // 设置轴标签旋转角度
			}
		},
		yAxis: {
			//min: 0,
			title: {
				text: '日营业额 (元)'
			},
			labels: { 
	            formatter:function (){ 
	                return this.value + '元' ; 
	            } 
			} 
		},
		legend: {
			enabled: false
		},
		tooltip: {
			pointFormat: '营业额: <b>{point.y:.2f} 元</b>'
		},
		series: [/* {
			name: '营业额',
			data: [
				[
						'1月1日',
						24.13
					],
					[
						'1月2日',
						17.2
					],
					[
						'1月3日',
						8.11
					],
					[
						'1月4日',
						5.33
					],
					[
						'1月5日',
						1.06
					],
					[
						'1月6日',
						0.5
					],[
						'1月7日',
						24.13
					],
					[
						'1月8日',
						17.2
					],
					[
						'1月9日',
						8.11
					],
					[
						'1月10日',
						5.33
					],
					[
						'1月11日',
						1.06
					],
					[
						'1月12日',
						0.5
					],[
						'1月13日',
						24.13
					],
					[
						'1月14日',
						17.2
					],
					[
						'1月15日',
						8.11
					],
					[
						'1月16日',
						5.33
					],
					[
						'1月17日',
						1.06
					],
					[
						'1月18日',
						0.5
					],[
						'1月19日',
						24.13
					],
					[
						'1月20日',
						17.2
					],
					[
						'1月21日',
						8.11
					],
					[
						'1月22日',
						5.33
					],
					[
						'1月23日',
						1.06
					],
					[
						'1月24日',
						0.5
					],[
						'1月25日',
						0.5
					],[
						'1月26日',
						24.13
					],
					[
						'1月27日',
						17.2
					],
					[
						'1月28日',
						8.11
					],
					[
						'1月29日',
						5.33
					],
					[
						'1月30日',
						1.06
					],
					[
						'1月31日',
						0.5
					], 
			],
			dataLabels: {
				enabled: true,
				rotation: 0, //柱形图上数据显示设置
				color: '#104E8B',
				align: 'right',
				format: '{point.y:.2f}', // :.1f 为保留 1 位小数
				y: 10
			}
		} */
		]
	});	 
})

//弹窗框
/* function moneydetail(monthid){
	$.ajax({
	       type:"post",
	       url:"charts_sumprice",
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){
	    	   //图表数据
	    	   var dataday=[];
	    	   var downSerise=[];
	    	   for(var i=0;i<d.length;i++){
	    		   if(monthid==d[i].month){
	    			   var valday = $('#dayval');
	    	    	   var htmlday = '';
		    		   for(var n=0;n<d[i].day_value.length;n++){
		    			   var j=n+1;
		    			   var sdataday = [
		    				   d[i].month+'月'+j+'日',
		    				   d[i].day_value.j,
		    				  
		    			   ];
		    			   dataday.push(sdataday);
		    			   
		    			   //表格
		    			   //表格数据
		    	    	  
		    	               //for(var i = 0;i<d.length;i++){
		    	            	   htmlday+='<tr>'+
		    							'<td>'+d[i].month+'月'+j+'日'+'</td>'+
		    							'<td>'+d[i].day_value.j+'</td>'+		    							
		    						'</tr>';
		    	               //}
		    	               valday.html(htmlday);
		    			   
		    		   }
		    		   
		    		   
	    		   }
	    	   }
	    	   var oSerise1 = {
	    			   name: '营业额',	    			   
	    			   data:dataday,
	    			   dataLabels: {
	    					enabled: true,
	    					rotation: 0, //柱形图上数据显示设置
	    					color: '#104E8B',
	    					align: 'right',
	    					format: '{point.y:.2f}', // :.1f 为保留 1 位小数
	    					y: 10
	    				}
	    			     			   
	    	   }; 
	    	   oChart1.addSeries(oSerise1);
	    	   //oChart.addSeriesAsDrilldown(odown);
	    	   
	    	   layer.open({
	    			title:'日营业额',
	    			type: 1,
	    			shade: false,
	    			//btn:['确定','取消'],
	    			//btnAlign:'c',
	    			// offset:'t',   //弹出框位置
	    			closeBtn:1,      //按钮位置
	    	        anim: 1,         //弹窗弹出动画
	    	        maxmin:true,
	    	        fixed:true,
	    			skin: 'layui-layer-molv', //加上边框
	    			area: ['1000px', '600px'], //宽高
	    			content: $('#tabledetail'),   //引入html内容		 
	    		});
	       }
	   
	   });
	
}
  */
</script>
</html>