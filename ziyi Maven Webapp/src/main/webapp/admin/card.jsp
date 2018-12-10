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
<link rel="stylesheet" href="layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/global.css" media="all">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="css/table.css" />
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script>
	function seacard() {
		var searchval = $.trim($('#search').val());
		var selecval = $("#selectbox").val();
		if (searchval == ''||searchval == null) {
			alert('输入内容不能为空');
		} else {
			window.location.href = "admin_cardtype?id="+selecval+"&value="+searchval;

		}
	}
</script>
</head>

<body>
	<div class="admin-main">
		<blockquote class="layui-elem-quote">
			<!-- 				<a href="javascript:add_user();" class="layui-btn layui-btn-small" id="add"> -->
			<a href="javascript:adds('card');" class="layui-btn layui-btn-small"
				id="add"> <i class="layui-icon">&#xe608;</i> 开卡
			</a> <a href="javascript:add('add_card_price');"
				class="layui-btn layui-btn-small layui-btn-normal" id="add"> <i
				class="layui-icon">&#xe608;</i> 充值
			</a> <a href="javascript:add('add_card_old');"
				class="layui-btn layui-btn-small layui-btn-danger" id="add"> <i
				class="layui-icon">&#xe608;</i> 激活老卡
			</a>
			<form class="layui-form layui-inline" style="margin-top: 1%;">
				<div class="layui-form-item">
					<label class="layui-form-label">卡状态</label>
					<div class="layui-input-inline">
						<select id="selectbox" name="category" lay-filter="cardSta">
							<c:if test="${id ==-1 }">
								<option value="-1" selected>全部</option>
								<option value="0">在售</option>
								<option value="1">在用</option>
								<option value="2">收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${id ==0 }">
								<option value="-1">全部</option>
								<option value="0" selected>在售</option>
								<option value="1">在用</option>
								<option value="2">收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${id ==1 }">
								<option value="-1">全部</option>
								<option value="0">在售</option>
								<option value="1" selected>在用</option>
								<option value="2">收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${id ==2 }">
								<option value="-1">全部</option>
								<option value="0">在售</option>
								<option value="1">在用</option>
								<option value="2" selected>收回</option>
								<option value="3">挂失</option>
							</c:if>
							<c:if test="${id ==3 }">
								<option value="-1">全部</option>
								<option value="0">在售</option>
								<option value="1">在用</option>
								<option value="2">收回</option>
								<option value="3" selected>挂失</option>
							</c:if>

						</select>
					</div>
					<label class="layui-form-label">搜索卡</label>
					<div class="layui-input-inline">
						<input type="text" name="search" placeholder="请输入搜索内容"
							class="layui-input" id="search" value="${value}">
					</div>
					<button type="button" class="layui-btn" id="searchbtn"
						onclick="seacard()">
						<i class="layui-icon">&#xe615;</i>搜索
					</button>
				</div>
			</form>

		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>会员列表</legend>
			<div class="layui-field-box">
				<table class="layui-table" lay-filter="cardshow"
					lay-data="{page:true,limit:10}">
					<thead>
						<tr>
						    <th lay-data="{field:'state', sort: true}">卡状态</th>
							<th lay-data="{field:'id', sort: true}">卡编号</th>
							<th lay-data="{field:'cate'}">卡类型</th>
							<th lay-data="{field:'dis', sort: true}">卡折扣</th>
							<th lay-data="{field:'name'}">所属人</th>
							<th lay-data="{field:'phone'}">所属手机</th>
							<th lay-data="{field:'address'}">所属地址</th>
							<th lay-data="{field:'idcard'}">身份证号</th>
							<th lay-data="{field:'allm', sort: true}">总金额</th>
							<th lay-data="{field:'usem', sort: true}">已消费金额</th>
							<th lay-data="{field:'rem', sort: true}">剩余金额</th>
							<th lay-data="{field:'selltime', sort: true}">售卡时间</th>
							<th lay-data="{field:'edit'}">编辑</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${card}">
						
							<tr>
								
							<c:if test="${i.status ==0 }">
								<td>在售</td>
							</c:if>
							<c:if test="${i.status ==1 }">
								<td>在用</td>
							</c:if>
							<c:if test="${i.status ==2 }">
								<td>收回</td>
							</c:if>
							<c:if test="${i.status ==3 }">
								<td>挂失</td>
							</c:if>
								<td>${i.number}</td>
								<c:forEach var="c" items="${card_type}">
									<c:if test="${c.ctid==i.ctid }">
										<td>${c.cardtype}</td>
										<td>${c.rebate}</td>
									</c:if>
								</c:forEach>
								<td>${i.name}</td>
								<td>${i.phone}</td>
								<td>${i.address}</td>
								<td>${i.idcard}</td>
								<td>${i.price}</td>
								<td>${i.spend}</td>
								<td>${i.remain}</td>
								<td>${i.selltime}</td>
								<td><a href="javascript:update('card','${i.cardid}');"
									class="layui-btn layui-btn-xs">编辑</a> <a
									href="javascript:del('card','${i.cardid }')" data-id="1"
									data-opt="del" class="layui-btn layui-btn-danger layui-btn-xs">删除</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="page" class="page"></div>
		</fieldset>



	</div>
	<!-- 			<td> -->
	<!-- 									<a href="/detail-1" target="_blank" class="layui-btn layui-btn-normal layui-btn-mini">预览</a> -->
	<!-- 									<a href="/manage/article_edit_1" class="layui-btn layui-btn-mini">编辑</a> -->
	<!-- 									<a href="javascript:;" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a> -->
	<!-- 								</td> -->

	<!-- <script type="text/javascript" src="icheck/icheck.js"></script> -->
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript" src="js/chen1.js"></script>
	<script>
		/* layui.config({
			base: 'plugins/layui/modules/'
		}); */
		//
		var selectval;
		layui
				.use(
						[ 'laypage', 'layer', 'form', 'table' ],
						function() {
							var $ = layui.jquery, laypage = layui.laypage, form = layui.form, table = layui.table, layer = parent.layer === undefined ? layui.layer
									: parent.layer;
							/* $('input').iCheck({
								checkboxClass: 'icheckbox_flat-green'
							}); */
							table.init('cardshow');
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
										window.location.href='admin_card?page='+obj.curr;
										layer.msg('第 '+ obj.curr +' 页');
										
									}
								}
							});
							 */
							
							form.on("select(cardSta)", function(data) {
								var serval = $.trim($("#search").val());
								window.location.href = "admin_cardtype?id="+data.value+"&value="+serval;								 
							})

						});
	</script>

</body>

</html>