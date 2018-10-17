<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Table</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	</head>
	<script type="text/javascript">
	

	</script>
	<body>
		<div class="admin-main">
		<blockquote class="layui-elem-quote">
<!-- 				<a href="javascript:add_user();" class="layui-btn layui-btn-small" id="add"> -->
				<a href="javascript:add('tea_house');" class="layui-btn layui-btn-small" id="add">
					<i class="layui-icon">&#xe608;</i> 添加信息
				</a>
			</blockquote>
			<fieldset class="layui-elem-field">
				<legend>桌位列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
									<thead>
										<tr>
											<th>桌位名称</th>
											<th>桌位状态</th>
											<th>桌位层级</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
						<c:forEach var="i" items="${list}">
									<tr>
										<td>${i.housename}</td>
										<c:if test="${i.status == 0}">
											<td>空闲</td>
										</c:if>
										<c:if test="${i.status == 1}">
											<td>占用</td>
										</c:if>
										<c:if test="${i.status == 2}">
											<td>预约</td>
										</c:if>
										<c:if test="${i.status == 3}">
											<td>其他</td>
										</c:if>
										<td>${i.position}</td>
										<td>
										<a href="javascript:update('teahouse','${i.houseid }');" class="layui-btn layui-btn-mini">编辑</a>
										<a href="javascript:del('teahouse','${i.houseid }')" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
										</td>
									</tr>
						</c:forEach>
						</tbody>
					</table>
					
				</div>
			</fieldset>
		</div>

		<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<script type="text/javascript" src="js/chen.js"></script>
			<script>
			 layui.use(['element', 'layer'], function () {
					  var element = layui.element;
					  var layer = layui.layer;
					  var $ = layui.jquery;

					   //添加
					    function addNews(edit){
					        var index = layui.layer.open({
					            title : "添加信息",
					            type : 2,
					            content : "workadd.jsp",
					            
					        });
					        layui.layer.full(index);
					        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域
					        $(window).on("resize",function(){
					            layui.layer.full(index);
					        })
					    }
					    $(".add").click(function(){
					        addNews();
					    });
					  					   
                        // 表格中编辑按钮
					});
		</script></body>

</html>