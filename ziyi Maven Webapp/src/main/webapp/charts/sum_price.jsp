<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.changeshow {
	display: flex;
	flex-direction: row;
	padding-top: 1%;
}

.changeshow .layui-form {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

.changeshow .layui-btn {
	margin-left: 1%;
}

.showclass, .dayshow {
	display: none;
}

#btnshow {
	display: none;
	padding-left: 30px;
	padding-right: 30px;
	margin-top: 5px
}
</style>
<script>
	/* function cc()
	{
		var year = ${year};//2020
		<select>
		for (var i = 2018; i <= year; i++) {
			if(i == year)
				{
				<option value=i select>i</option>
				//默认选中
				}
			else
				{
				<option value=i>i</option>
				}
		}
		</select>
		
	} */
	
	</script>
</head>

<body>
	<div class="container">
		<!-- 月营业总额显示 -->
		<div class="changeshow">
			<form class="layui-form" lay-filter="renderForm">
				<div class='layui-form-item'>
					<label class='layui-form-label' style='padding-left: 0;'>选择年份</label>
					<div class='layui-input-block'>
						<select id="selectYear" lay-filter='yearSelect'>
							<!-- <option value='2018' checked=''>2018</option>
					        <option value='2019'>2019</option>
					        <option value='2019'>2020</option> -->
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">营业总额</label>
					<div class="layui-input-block">
						<!-- 关闭状态是图表显示，开启状态是表格显示 -->
						<input type="checkbox" name="zzz" lay-skin="switch"
							lay-filter="switchTest" lay-text="图表显示|表格显示">
					</div>
				</div>
			</form>
			<button class="layui-btn layui-btn-radius layui-btn-sm" id="btnshow"
				onclick='backmonth()'>返回</button>
		</div>
		<div id="chartshow" class="chartshow">
			<div id="container"
				style="min-width: 310px; height: 600px; margin: 0 auto"></div>
		</div>
		<div id="tableshow" class="tableshow showclass">
			<fieldset class="layui-elem-field">
				<legend>营业总额</legend>
				<table class="layui-table" id='tabmonth'>
					<thead>
						<tr>
							<th>月份</th>
							<th>月营业额</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id='monthval'>
						<c:forEach var="i" items="${list}">
							<tr>
								<td>${i.month}</td>
								<td>${i.value}</td>
								<td><a href="javascript:daydetail(${i.month});"
									class="layui-btn layui-btn-mini">详情</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</fieldset>
		</div>
	</div>
</body>

<script>
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
       backmonth();
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
  //
  form.on('select(yearSelect)', function(data){
          console.log(data.value);
	     //window.localtion.href='charts_sumprices?year='+data.value;
	     
	  });
});

var tabold;
//月营业额详情
function daydetail(b){
	//原月营业额内容
	 tabold=$('#tabmonth').html();
	 console.log(tabold);
	 <c:forEach var="i" items="${list}" > 
		var c = ${i.month};
		if(c == b)
			{	 
			     $('#btnshow').css('display','block');
				 $('#tabmonth tr').remove();
				 $('#tabmonth thead').html('<tr><th>日期</th><th>日营业额</th></tr>');
	 			<c:forEach var="is" items="${i.day_value}" >
	 		        var str=str+"<tr><td>"+${i.month}+"月"+${is.key}+"日"+"</td><td>"+${is.value}+"</td></tr>";	 
			    </c:forEach>  
			    $("#tabmonth tbody").html(str);	  			    
			}
	 </c:forEach> 
}
//显示切换
function backmonth(){
	$('#tabmonth').html(tabold);
	$('#btnshow').css('display','none');
}

var oChart1;
$(document).ready(function(){
	//年份选择
	changeYear();
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
   
})


//
function changeYear(){
		var datetime = new Date();
		//当前年
	    var nowyear = datetime.getFullYear();
	    //window.localtion.href=''; 
// 	     var backyear = ${year};
        for(var i = 2018;i<=2022;i++){
        	 
     	   if(nowyear == i){  
     		   $('#selectYear').append("<option value='"+i+"' selected>"+i+"</option>");
     	   }else{    		   
     		   $('#selectYear').append("<option value='"+i+"' >"+i+"</option>");
     	   }
        }
        formrender();
    }
    
function formrender(){
	layui.use('form',function(){
		var form = layui.form;
		form.render('select','renderForm');
	})
}

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