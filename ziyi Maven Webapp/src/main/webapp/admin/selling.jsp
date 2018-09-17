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
				<a href="javascript:add('selling_list');" class="layui-btn layui-btn-small" id="add">
					<i class="layui-icon">&#xe608;</i> 添加商品
				</a>
			</blockquote>
			<fieldset class="layui-elem-field">
				<legend>商品列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
									<thead>
										<tr>
											<th>商品名称</th>
											<th>商品金额</th>
											<th>商品单位</th>
											<th>是否折扣</th>
											<th>折扣比例</th>
											<th>商品类型</th>
											<th>商品说明</th>
											<th>商品数量</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
						<c:forEach var="i" items="${selling}">
									<tr>
										<td>${i.name}</td>
										
										<td>${i.price}</td>
										<td>${i.unit}</td>
										<td>
											<c:if test="${i.rebate==0 }">
													否
											</c:if>
											<c:if test="${i.rebate==1 }">
													是
											</c:if>
											</td>
										<td>${i.proportion}</td>
										
										<c:forEach var="c" items="${typeid}">
											<c:if test="${c.type_id==i.typeid }">
												<td>${c.type_name}</td>
											</c:if>
										</c:forEach>
										<td>${i.xiangxi}</td>
										<td>${i.number}</td>
										<td>
										<a href="javascript:update('card','${i.sellingid}');" class="layui-btn layui-btn-mini">编辑</a>
										<a href="javascript:del('card','${i.sellingid }')" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
										</td>
									</tr>
						</c:forEach>
						</tbody>
					</table>
				<div id="page" class="page">
				</div>
			</fieldset>
			
		</div>
	
		<script type="text/javascript" src="http://res.layui.com/layui/release/layer/dist/layer.js?v=3111"></script>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<script type="text/javascript" src="js/chen.js"></script>
		<script>
			layui.config({
				base: 'plugins/layui/modules/'
			});

			layui.use(['icheck', 'laypage','layer'], function() {
				var $ = layui.jquery,
					laypage = layui.laypage,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
				$('input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				});

				//page
				laypage({
					cont: 'page',
					pages: ${zong} //总页数
						,
					groups: 5 //连续显示分页数
						,
					curr:${page},
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							window.location.href='http://localhost/ziyi/admin_card?page='+obj.curr;
							layer.msg('第 '+ obj.curr +' 页');
							
						}
					}
				});

			
			});
		</script>
		
		</body>

</html>