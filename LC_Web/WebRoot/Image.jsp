<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Image.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
    .file {
        position: relative;
        display: inline-block;
        background: #D0EEFF;
        border: 1px solid #99D3F5;
        border-radius: 4px;
        padding: 4px 12px;
        overflow: hidden;
        color: #1E88C7;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
    }
 
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
    }
 
    .file:hover {
        background: #AADFFD;
        border-color: #78C3F3;
        color: #004974;
        text-decoration: none;
    }
 
    #preview {
        width: 150px;
        height: 150px;
        overflow: hidden;
    }
 
    #preview img {
        width: 100%;
        height: 100%;
    }
</style>

  </head>
  <script type="text/javascript">
  	$('[type=file]').change(function (e) {                                            
            var file = e.target.files[0]                                          // 得到输入框中的内容，并定义给一个变量
            preview1(file)                                                         //并执行preview1方法
        })
function preview1(file) {
        haveImg = true;
        var img = new Image(), url = img.src = URL.createObjectURL(file)            //把定义的值传到这个方法中，并转化成图片
        var $img = $(img)
        img.onload = function () {
            URL.revokeObjectURL(url)
            $('#preview').empty().append($img);                                     //并在id为preview的div中显示图片
        }
    }
  	function uploadFile() {
        var pic = $("#pic").get(0).files[0];                                     // 获取input中存入的值（此处为图片的另一种格式）
        var formData = new FormData();                                           // 定义一个formdata表单，并把得到的值存到表单中
        formData.append("file", pic);
        $.ajax({                                                                 // 此处为ajax请求，（请求的url下面会给出）
            type: "POST",
            url: htturl+"uploadImage1",
            data: formData,
            async: false,
            processData: false, //必须false才会自动加上正确的Content-Type
            dataType: 'json',
            contentType: false,//必须false才会避开jQuery对 formdata 的默认处理
            success: function (res) {
                picc = res.data;
            },
            error: function (xhr, textStatus) {
                ShowFailure('错误,上传失败')
                console.log(xhr)
                console.log(textStatus)
            }
 
        });
 
    }
  	
  
  </script>
  
  <body>
   <div class="form-group">
            <div class="col-sm-2">
 
            </div>
            <div class="col-sm-10" style="width: 20%; margin-left: 50px">
                <div id="preview" style="width: 150px;height:150px;border:1px solid gray;">
                </div>
                <div class="file" style="z-index: 999;margin-left: 30px">选择图片
                    <input type="file" name="file" id="pic">
                </div>
                
                 <div class="file" style="z-index: 999;margin-left: 30px">选择图片
                    <input type="button" name="uploadFile" id="uploadFile" onclick="uploadFile()">保存
                </div>
            </div>
        </div>

  </body>
</html>
