<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />
		<link rel="stylesheet" type="text/css" href="icheck/minimal/red.css">
		
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>

		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>添加会员卡</legend>
			</fieldset>
			<form id="form2" class="layui-form">
				<div class="layui-form-item">
					<label class="layui-form-label">会员类型</label>
					<div class="layui-input-block">
					<select name="ctid">
							
									<option value="1" selected="1">A卡</option>
									<option value="2" >E卡</option>
									<option value="3" >C卡</option>
									<option value="4" >D卡</option>
								
						</select>
					</div> 
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">会员编号</label>
					<div class="layui-input-block">
						<input type="text" name="number" lay-verify="title" autocomplete="off" placeholder="请输入会员编号" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">会员名称</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入会员名称" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">电话号码</label>
					<div class="layui-input-block">
						<input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入电话号码" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">家庭地址</label>
					<div class="layui-input-block">
						<input type="text" name="address" lay-verify="title" autocomplete="off" placeholder="请输入家庭地址" class="layui-input">
					</div>
				</div>
    	   <div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
				<div class="layui-input-block">
						<input type="text" name="idcard" lay-verify="title" autocomplete="off" placeholder="请输入身份证号" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">开卡金额</label>
					<div class="layui-input-block">
						<input type="text" name="price" lay-verify="title" autocomplete="off" placeholder="请输入开卡金额" class="layui-input">
					</div>
				</div>
					
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="newCard()"> 立即提交  </button>
					</div>
				</div>
			</form>
		</div>
		
	</body>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/sxl.js"></script>
		<script type="text/javascript" src="js/layer.js"></script>
		<script type="text/javascript" src="icheck/icheck.js"></script>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
	    <script type="text/javascript">
			layui.use('form', function(){
			var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
			  form.render();
			});
</script>

</html>
