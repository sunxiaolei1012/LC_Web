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
				<a href="javascript:add('user');" class="layui-btn layui-btn-small" id="add">
					<i class="layui-icon">&#xe608;</i> 添加信息
				</a>
			</blockquote>
			<fieldset class="layui-elem-field">
			
				<legend>用户列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
									<thead>
										<tr>
											<th>员工姓名</th>
											<th>员工密码</th>
											<th>员工角色</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
						<c:forEach var="i" items="${list}">
									<tr>
										<td>${i.name}</td>
										<td>${i.password}</td>
										<c:if test="${i.userrole==1 }">
									       <td>管理员</td>
									   </c:if>
										<c:if test="${i.userrole==2 }">
									       <td>吧台</td>
									   </c:if>
									   <c:if test="${i.userrole==3 }">
									       <td>服务员</td>
									   </c:if>
										<td>
										<a href="javascript:update('user','${i.userid }');" class="layui-btn layui-btn-mini">编辑</a>
										<a href="javascript:del('user','${i.userid }')" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
										</td>
									</tr>
						</c:forEach>
						</tbody>
					</table>
					
				</div>
			</fieldset>
		</div>
<!-- 			<td> -->
<!-- 									<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a> -->
<!-- 									<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a> -->
<!-- 									<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a> -->
<!-- 								</td> -->
	
		<!-- <script type="text/javascript" src="icheck/icheck.js"></script> -->
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<script type="text/javascript" src="js/chen1.js"></script>
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