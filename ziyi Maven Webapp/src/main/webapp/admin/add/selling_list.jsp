<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="utf-8">
		<title>添加用户</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<script type="text/javascript" src="../../js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="../../plugins/layui/layui.js"></script>
		<script type="text/javascript" src="../../js/chen.js"></script>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	</head>

	<body>
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>添加商品</legend>
			</fieldset>
			<form id="form2" action="cmd_add_selling" method="post" class="layui-form" enctype="multipart/form-data">
				<div class="layui-form-item">
					<label class="layui-form-label">商品名称</label>
					<div class="layui-input-block">
						<input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品金额</label>
					<div class="layui-input-block">
						<input type="text" name="price" lay-verify="floatNum" autocomplete="off" placeholder="请输入商品金额" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品单位</label>
					<div class="layui-input-block">
						<input type="text" name="unit" lay-verify="units" autocomplete="off" placeholder="请输入商品单位" class="layui-input">
					</div>
				</div>
					<div class="layui-form-item">
					<label class="layui-form-label">是否打折</label>
					<div class="layui-input-block">
						<select name="rebate">
									<option value="0" selected="">打折</option>
									<option value="1">不打折</option>
						</select>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">折扣比例</label>
					<div class="layui-input-block">
						<input type="text" name="proportion" lay-verify="title" autocomplete="off" placeholder="请输入折扣比例" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">商品类型</label>
					<div class="layui-input-block">
						<select name="typeid">
						    	<c:forEach var="c" items="${typeid}">
						    		<option value="${c.type_id }" >${c.type_name }</option>
								</c:forEach>
						</select>		
						
					</div>
				</div>
				
				
				
				
				
				<div class="layui-form-item">
					<label class="layui-form-label">商品说明</label>
					<div class="layui-input-block">
						<input type="text" name="xiangxi" lay-verify="" autocomplete="off" placeholder="请输入商品说明" class="layui-input">
					</div>
				</div>
					<div class="layui-form-item">
					<label class="layui-form-label">商品数量</label>
					<div class="layui-input-block">
						<input type="text" name="number" lay-verify="num1" autocomplete="off" placeholder="请输入商品数量" class="layui-input">
					</div>
				</div>
				
				
				<div style="margin :0px auto; width:990px;">
				<input type="file" name="file" id="doc" multiple="multiple" style="width:150px;" onchange="javascript:setImagePreviews();" accept="image/*">
				<div id="dd" style=" width:990px;"></div>
				</div>
				
				
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input type="submit" class="layui-btn" value="立即提交">
						<button class="layui-btn" lay-submit="" lay-filter="goodsAdd" onclick="save('add','selling')">立即提交</button>
					</div>
				</div>
				
				
			</form>
		</div>
		
	</body>
<script type="text/javascript">
	layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	 
  
  
  
  
});

  //下面用于多图片上传预览功能
    function setImagePreviews(avalue) {

        var docObj = document.getElementById("doc");

        var dd = document.getElementById("dd");

        dd.innerHTML = "";

        var fileList = docObj.files;

        for (var i = 0; i < fileList.length; i++) {            



            dd.innerHTML += "<div style='float:left' > <img id='img" + i + "'  /> </div>";

            var imgObjPreview = document.getElementById("img"+i); 

            if (docObj.files && docObj.files[i]) {

                //火狐下，直接设img属性

                imgObjPreview.style.display = 'block';

                imgObjPreview.style.width = '150px';

                imgObjPreview.style.height = '180px';

                //imgObjPreview.src = docObj.files[0].getAsDataURL();

                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式

                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);

            }

            else {

                //IE下，使用滤镜

                docObj.select();

                var imgSrc = document.selection.createRange().text;

                alert(imgSrc)

                var localImagId = document.getElementById("img" + i);

                //必须设置初始大小

                localImagId.style.width = "150px";

                localImagId.style.height = "180px";

                //图片异常的捕捉，防止用户修改后缀来伪造图片

                try {

                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";

                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;

                }

                catch (e) {

                    alert("您上传的图片格式不正确，请重新选择!");

                    return false;

                }

                imgObjPreview.style.display = 'none';

                document.selection.empty();

            }

        }  



        return true;

    }

</script>
</html>