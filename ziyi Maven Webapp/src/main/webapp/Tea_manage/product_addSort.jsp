<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>智慧校园</title>
    <meta charset="utf-8">
        <title>用户信息</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="format-detection" content="telephone=no">

        <link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
        <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    </head>

    <body>
        <div style="margin: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>商品分类-添加商品</legend>
            </fieldset>

            <form class="layui-form"   id="myForm"  action=""  >
              
                <div class="layui-form-item">
                    <label class="layui-form-label" >类型名称</label>
                    <div class="layui-input-block">
                    <input  type="hidden" name="uid"  value="86" />
                        <input type="text" name="name" lay-verify="title" autocomplete="off" value="" class="layui-input">
                    </div>
                </div>
                
                 
                <div class="layui-form-item">
                    <div class="layui-input-block">
                    <input  class="layui-btn"  type="button"  onclick="addSort()" value="立即提交"/> 
                        <!-- <button class="layui-btn" onclick="updateUser()" >立即提交</button> -->
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="plugins/layui/layui.js"></script>
         <script src="js/aa.js"></script>
        <script>
            layui.use(['form', 'layedit', 'laydate'], function() {
                var form = layui.form(),
                    layer = layui.layer,
                    layedit = layui.layedit,
                    laydate = layui.laydate;

                //创建一个编辑器
                var editIndex = layedit.build('LAY_demo_editor');
                //自定义验证规则
                form.verify({
                    title: function(value) {
                        if(value.length < 1) {
                            return '请将内容填写完整';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    content: function(value) {
                        layedit.sync(editIndex);
                    }
                });



                //监听提交
              form.on('submit(demo1)', function(data) {
              
              layer.alert(JSON.stringify(data.field), {
						title: '最终的提交信息'
					})
                   $.ajax({
                    url:"Product_addSort",
                    data: $("#myForm").serialize(),//表单数据
                    type:"POST",
                    success:function(d){
                        if(d!=0){
                            layer.msg('保存成功！');//保存成功提示
                        }
                       else{
                       layer.msg('修改失败！');//保存成功提示
                       }
                        layer.closeAll('myForm');//关闭弹窗
                    }
                }); 
             
                    
                });   
               
            }); 
        </script>
        <script type="text/javascript" src="plugins/layui/layui.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript"  >
        
        
			 function addSort(){
			
			 
			  
			  $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "Product_addSort" ,//url
                data: $('#myForm').serialize(),
                success: function (a) {
               
                    console.log(a);//打印服务端返回的数据(调试用)
                    if (a==1) {
                        alert("添加成功！");
                        window.parent.location.reload();
			parent.layer.closeAll('iframe');

                    }
                    else{
                    	alert("添加失败！");
                    	window.parent.location.reload();
			parent.layer.closeAll('iframe');

                    }
                    ;
                },
                error : function() {
                    alert("异常！");
                },
                  
             
                
            });
            
			    
			  
               /*  $("#myForm").ajaxSubmit(function () {
                    alert("提交成功2");
                });
                return false; */
			 
				/* alert("ssssssss");
       			 $('#myForm').ajaxSubmit({
                url:'Edit_UserInfos',
                type:'post',
                dataType:'json',
                data:$("#myForm").serialize(),
                success:function(a){
                alert(a);
                    //回调函数 
                }
            }); */


        };
        
        
        </script>
    </body>

</html>