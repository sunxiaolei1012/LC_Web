<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>Table</title>
<link rel="stylesheet" href="../layui/css/layui.css" media="all" />
<link rel="stylesheet" href="../css/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="../css/table.css" />
<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
</head>

<body>
	<div class="admin-main">
		<blockquote class="layui-elem-quote">			 
			<form class="layui-form layui-inline" style="margin-top: 1%;">
				<div class="layui-form-item">
					<div class="layui-inline">				     
				        <label class="layui-form-label">日期选择</label>
				        <div class="layui-input-inline">
				         <input type="text" class="layui-input" id="dateTime" placeholder=" ~ ">
				        </div>
				    </div>
				    <div class="layui-inline">					 
						<label class="layui-form-label">员工类型</label>
						<div class="layui-input-inline">
							<select id="selectbox" name="category" lay-filter="peoSta">
								<option value="0">全部</option>
								<option value="1">服务员</option>
								<option value="2">收银员</option>
							</select>
						</div>
					</div>
					<div class="layui-inline">	
						<label class="layui-form-label">搜索员工</label>
						<div class="layui-input-inline">
							<input type="text" name="search" placeholder="请输入搜索内容"
								class="layui-input" id="search" value="">
						</div>
						<button type="button" class="layui-btn" id="searchbtn"
							onclick="seaPeo()">
							<i class="layui-icon">&#xe615;</i>搜索
						</button>
				    </div>		
					
				</div>
			</form>

		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>员工业绩</legend>
			<div class="layui-field-box">
				<table class="layui-table" id="peoTable" lay-filter="peoShow" 
					lay-data="{page:true,limit:10}">
					<thead>
						<tr>
							<th lay-data="{field:'id', sort: true}">员工工号</th>
							<th lay-data="{field:'name'}">员工姓名</th>
							<th lay-data="{field:'orderNum', sort: true}">操作订单数</th>							 
							<th lay-data="{field:'performance', sort: true}">总业绩</th>							 
							<th lay-data="{field:'edit'}">详情</th>
						</tr>
					</thead>
					<tbody>
												 
					</tbody>
				</table>
		</fieldset>
	</div>
</body>
<div id="detailFram" style="display:none;">
      
			<div class="layui-field-box">
				<table class="layui-table" id="everyPeo" lay-filter="everyShow" lay-data="{page:true,}">
					<thead>
						<tr>
							<th lay-data="{field:'ordnum',sort:true,width:185}">订单编号</th>
							<th lay-data="{field:'ordtime',sort:true,width:200}">订单日期</th>
							<th lay-data="{field:'ordmon',sort:true,width:185}">订单金额</th>							 							 
						</tr>
					</thead>
					<tbody>
						 		 
					</tbody>
				</table>
	 
</div>
<script type="text/javascript" src="../layui/layui.js"></script>
<!-- 	<script type="text/javascript" src="../js/chen1.js"></script> -->
	<script>
		layui.use(
						['element','laypage','laydate', 'layer', 'form', 'table' ],
						function() {
							var $ = layui.jquery, element=layui.element,laypage = layui.laypage,laydate = layui.laydate, form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer
									: parent.layer;
							laydate.render({
						  		  elem: '#dateTime'
						   		 ,range: '~'
						   		 ,done: function(value, date, endDate){
						          //点击日期、清空、现在、确定均会触发。回调返回三个参数，分别代表：生成的值、日期开始时间对象、结束的日期时间对象
						        if(value){						            
						            console.log(value);
						            console.log(date);
						            console.log(date.year);
						            console.log(endDate);
						        }else{
						             layer.msg('未选择时间！');
						        }
						 
						    }
						   		 
						   		}); 
							//转换静态表格
							table.init('peoShow');
							table.init('everyShow');
							//选择框触发事件
							form.on("select(peoSta)", function(data) {
								 console.log(data.value);
								 tableShow(6);
								 tableRender();	
							})
						});
		//表格数据
		function tableShow(n){
			var tabHTML = "";
	    	for(var i = 0;i<n;i++){
	    		tabHTML+='<tr>'+
					'<td>'+(i+1)+'</td>'+								
					'<td>name1</td>'+								
					'<td>100</td>'+								
					'<td>1000</td>'+								
					'<td><a href="javascript:detail('+i+');" class="layui-btn layui-btn-xs">详情</a></td>'+
				'</tr>';	    		
	    	}
	    	$('#peoTable tbody').html(tabHTML);
		}
		//表格重新渲染
		function tableRender(){
			layui.use('table',function(){
	    		var table = layui.table;
	    		table.init('peoShow');
	    	})
		}
		function tableRender1(){
			layui.use('table',function(){
	    		var table = layui.table;
	    		table.init('everyShow');
	    		//table.render();
	    	})
		}
		
	    $(document).ready(function(){
	    	tableShow(10);
	    })
	    //搜索
	    function seaPeo() {
			var searchval = $.trim($('#search').val());
			var selecval = $("#selectbox").val();
			if (searchval == ''||searchval == null) {
				alert('输入内容不能为空');
			} else {
				tableShow(3);
				tableRender();				  
			}
		}
	    //详情
	    //员工编号：peoId  查看的时间节点：timeDate
		function detail(peoId){
	    	var everyHtml = "";
	    	for(var i = 0;i<4;i++){
	    		everyHtml+='<tr>'+
					'<td>'+(i+1)+'</td>'+								
					'<td>20181005</td>'+								
					'<td>1000</td>'+								
				'</tr>';
	    	}
	    	$("#everyPeo tbody").html(everyHtml);
	    	tableRender1();
	    	layer.open({
    			title:'业绩详情',
				type: 1,
				shade: false,
// 				btn:['确认','取消'],
				btnAlign:'c',
				offset:'t',   //弹出框位置
// 				closeBtn:1,      //按钮位置
                anim: 1,         //弹窗弹出动画
                maxmin:true,
                fixed:false,
				skin: 'layui-layer-molv', //加上边框
				area: ['600px', '600px'], //宽高
				content: $("#detailFram"),
	    	});
	    }
	</script>
</html>