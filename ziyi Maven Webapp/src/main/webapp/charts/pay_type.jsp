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
		<!-- 各支付类型月营业额显示 -->
		<div class="changeshow">
			<form class="layui-form">
				<div class="layui-form-item">
				    <label class="layui-form-label">月营业额</label>
				    <div class="layui-input-block">
				    	<!-- 关闭状态是图表显示，开启状态是表格显示 -->
				      <input type="checkbox" name="zzz" lay-skin="switch" lay-filter="switchTest" lay-text="图表显示|表格显示">
				    </div>
				</div>
		    </form>
		</div>
		<div id="chartshow" class="chartshow">
			<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		</div>
		<div id="tableshow" class="tableshow showclass">
			<fieldset class="layui-elem-field">
			    <legend>月营业额
			       
		</legend>
				<table class="layui-table">
					<thead>
					    <tr>
						  <th>月份</th>
					      <th>现金</th>				       
					      <th>会员卡</th>				       
					      <th>支付宝</th>				       
					      <th>微信</th>				       
					      <th>操作</th>				       
					    </tr>
					</thead>
					<tbody>
					
					
					<c:forEach var="i" begin="0" end="11" step="1"> 

						<tr>
							<td>${i+1 }</td>
							<td>${xianjin[i] }</td>
							<td>${huiyuanka[i] }</td>
							<td>${zhifubao[i] }</td>
							<td>${weixin[i] }</td>
							<td><a href="javascript:daytype();" class="layui-btn layui-btn-mini">详情</a></td>
						</tr>
					</c:forEach>				
					</tbody>
				</table>
			</fieldset>
		</div>
         
	</div>
</body>
<!-- 弹出框：各支付方式日营业额详情 -->
<div id="dayshowtype" class="dayshowtype" style="display: none;">
	    <div class="changeshow">
			<form class="layui-form">
				<div class="layui-form-item">
				    <label class="layui-form-label">日营业额</label>
				    <div class="layui-input-block">
				    	<!-- 关闭状态是图表显示，开启状态是表格显示 -->
				      <input type="checkbox" name="zzz" lay-skin="switch" lay-filter="switchTest1" lay-text="图表显示|表格显示">
				    </div>
				</div>
		    </form>
		</div>
		<div id="daytypechart" class="daytypechart">
			<div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		</div>
		<div id="daytypetable" class="tableshow dayshow">
			<fieldset class="layui-elem-field">
			    <legend>日营业额
			    
			    	

</legend>
				<table class="layui-table">
					<thead>
					    <tr>
						  <th>日期</th>
					      <th>现金</th>				       
					      <th>会员卡</th>				       
					      <th>支付宝</th>				       
					      <th>微信</th>				       
					    </tr>
					</thead>
					<tbody>
						<tr>
							<td>1月1日</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
						</tr>
						<tr>
							<td>1月2日</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
						</tr>
						<tr>
							<td>1月3日</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
						</tr>
						<tr>
							<td>1月4日</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
							<td>1314</td>
						</tr>
					</tbody>
				</table>
				<div id="page1" class="page"></div>
			</fieldset>
		</div>
</div>
<script type="text/javascript">
    layui.use(['element','form','table','laydate','laypage'], function(){
    var element = layui.element
    ,form = layui.form
  	,layer = layui.layer
  	,table = layui.table
  	,laydate = layui.laydate
  	,laypage = layui.laypage;
	laypage.render({
	    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: 50 //数据总数，从服务端得到
	    ,limit:10
	  });
	laypage.render({
	    elem: 'page1' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: 50 //数据总数，从服务端得到
	    ,limit:10
	  });
  //监听指定开关
    form.on('switch(switchTest)', function(data){
	    //显示方式切换
	    if(this.checked=='true'){
	       $('#tableshow').toggleClass('showclass');
	       $('#chartshow').toggleClass('showclass');
	    }else{
	       $('#tableshow').toggleClass('showclass');
	       $('#chartshow').toggleClass('showclass');
	    }
    });
    //各支付方式每日营业额显示切换
    form.on('switch(switchTest1)', function(data){
    if(this.checked=='true'){
       $('#daytypechart').toggleClass('dayshow');
       $('#daytypetable').toggleClass('dayshow');
    }else{
      $('#daytypechart').toggleClass('dayshow');
       $('#daytypetable').toggleClass('dayshow');
    }
  });
});

	//支付方式月营业额
	var chart = Highcharts.chart('container',{
	credits: {
	     enabled: false
	},
	chart: {
		type: 'column'
	},
	title: {
		text: '各支付方式月营业额'
	},
	subtitle: {
		text: ''
	},
	xAxis: {
		categories: [
			'一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'
		],
		crosshair: true
	},
	yAxis: {
		min: 0,
		title: {
			text: '月营业额'
		}
	},
	tooltip: {  //提示
		// head + 每个 point + footer 拼接成完整的 table
		headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		'<td style="padding:0"><b>{point.y:.2f} 元</b></td></tr>',
		footerFormat: '</table>',
		shared: true,
		useHTML: true
	},
	plotOptions: {
		column: {
			borderWidth: 0
		}
	},
	series: [
	{
		name: '现金', //现金支付每月营业额
		data: [
			 <c:forEach var="i" items="${xianjin}">
				${i},
			</c:forEach>
]
	}
, {
		name: '会员卡',
		data: [
			<c:forEach var="i" items="${huiyuanka}">
				${i},
			</c:forEach>
		]
	}, {
		name: '支付宝',
		data: [
			<c:forEach var="i" items="${zhifubao}">
				${i},
			</c:forEach>
		]
	}, {
		name: '微信',
		data: [
		<c:forEach var="i" items="${weixin}">
			${i},
		</c:forEach>
		]
	}
	
	]
});

	//支付方式日营业额
	var chart = Highcharts.chart('container1',{
	credits: {
	     enabled: false
	},
	chart: {
		type: 'column'
	},
	title: {
		text: '各支付方式日营业额'
	},
	subtitle: {
		text: ''
	},
	xAxis: {
		categories: [
			'1日','2日','3日','4日','5日','6日','7日','8日','9日','10日','11日','12日','13日','14日','15日','16日',
			'17日','18日','19日','20日','21日','22日','23日','24日','25日','26日','27日','28日','29日','30日','31日'
		],
		crosshair: true
	},
	yAxis: {
		min: 0,
		title: {
			text: '日营业额（元）'
		}
	},
	tooltip: {  //提示
		// head + 每个 point + footer 拼接成完整的 table
		headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		'<td style="padding:0"><b>{point.y:.2f} 元</b></td></tr>',
		footerFormat: '</table>',
		shared: true,
		useHTML: true
	},
	plotOptions: {
		column: {
			borderWidth: 0
		}
	},
	series: [{
		name: '现金', //现金支付每月营业额
		data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4,49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4,49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6]
	}, {
		name: '会员卡',
		data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3,83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
	}, {
		name: '支付宝',
		data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2,48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2,48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0]
	}, {
		name: '微信',
		data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1,42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1,42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4]
	}]
});
	function daytype(){
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
		content: $('#dayshowtype'),   //引入html内容		 
	});
	}
</script>
</html>
