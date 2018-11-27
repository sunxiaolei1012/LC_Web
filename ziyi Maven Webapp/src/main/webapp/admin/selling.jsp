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
		<link rel="stylesheet" href="layui/css/layui.css" media="all" />
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
				<legend>商品列表
									
										</legend>
				<div class="layui-field-box">
					<table class="layui-table" lay-filter="goodshow" lay-data="{page:true,limit:10}">
									<thead>
										<tr>
											<th lay-data="{field:'name'}">商品名称</th>
											<th lay-data="{field:'price', sort: true}">商品金额</th>
											<th lay-data="{field:'unit'}">商品单位</th>
											<th lay-data="{field:'dis'}">是否折扣</th>
											<th lay-data="{field:'scale', sort: true}">折扣比例</th>
											<th lay-data="{field:'category'}">商品类型</th>
											<th lay-data="{field:'intro'}">商品说明</th>
											<th lay-data="{field:'number', sort: true}">商品数量</th>
											<th lay-data="{field:'operation'}">操作</th>
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
										<a href="javascript:image('${i.sellingid}');" class="layui-btn layui-btn-mini layui-btn-xs">编辑图片</a>
										<a href="javascript:update('selling','${i.sellingid}');" class="layui-btn layui-btn-xs">编辑</a>
										<a href="javascript:del('selling','${i.sellingid }')" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
										</td>
									</tr>
						</c:forEach>
						</tbody>
					</table>
				<div id="page" class="page">
				</div>
			</fieldset>
			
		</div>
	
		<script type="text/javascript" src="layui/layui.js"></script>
		<script type="text/javascript" src="js/chen1.js"></script>
		<script>
			/* layui.config({
				base: 'plugins/layui/modules/'
			});
 */
			layui.use(['element','laypage','layer','table'], function() {
				var $ = layui.jquery,
				    element = layui.element,
					laypage = layui.laypage,
					table = layui.table,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
				    table.init('goodshow');
				/* $('input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				}); */

				/* //page
				laypage({
					cont: 'page',
					pages: ${zong}, //总页数
					groups: 5, //连续显示分页数						
					curr:${page},
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							window.location.href='admin_selling?page='+obj.curr;
							layer.msg('第 '+ obj.curr +' 页');
							
						}
					}
				});
 */
			
			});
		</script>
		
		</body>

</html>