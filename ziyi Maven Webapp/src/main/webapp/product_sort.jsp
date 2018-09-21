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
    
	<meta charset="UTF-8">
		<title>商品列表</title>
		<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="css/global.css" media="all">
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="css/table.css" />
		<link rel="stylesheet" type="text/css" href="icheck/minimal/red.css">
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/layer.js"></script>
		<script type="text/javascript" src="icheck/icheck.js"></script>
		<script type="text/javascript" src="plugins/layui/layui.js"></script>
		<!-- <script type="text/javascript" src="js/admin_useredit.js"></script> -->
	</head>
	<script type="text/javascript">
			
		  function editbtn(edit,uid)
                     { 
                     var id=uid;
                    
                     	layer.open({
					      type: 2,
					      title: "编辑",				       
					      area: ['600px', '400px'],
					      content: "Check_userByuid?uid="+id,
					      cancel: function (index, layero) {
					        $(".dw-refresh").trigger('click');
					        return true;
					      }
					    });
                     }

	</script>
	<body>
		<div class="admin-main">

			<form class="layui-form" action="">
                <div class="layui-form-item" style="text-align:center;">
                  <div class="layui-inline">
                    <div class="layui-input-inline">
                      <input autocomplete="off" class="layui-input" placeholder="请输入关键字" type="text" name="name" value="">
                    </div>
                  </div>
                  <div class="layui-inline" style="text-align:left;">
                    <div class="layui-input-inline">
                      <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                    </div>
                  </div>
                </div>
              </form>
              <hr>
              <div class="layui-btn-group">
                  <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog add">
                      <i class="layui-icon"><span>+</span></i>新增商品
                  </button>
                  <button class="layui-btn layui-btn-xs layui-btn-danger delAll_btn" dw_url="">
                      <i class="layui-icon">&#xe640;</i>批量删除
                  </button>
                  <button class="layui-btn layui-btn-xs dw-refresh">
                      <i class="layui-icon">&#x1002;</i>刷新
                  </button>
              </div>
              <hr>
			<fieldset class="layui-elem-field">
				<legend>商品列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover" id="test">
						<thead>
							<colgroup>
		                      <col width="150">
		                      <col width="150">
		                      <col width="200">
		                      <col>
		                      <col>
		                    </colgroup>
							<tr>
								<th class="selectAll"><input type="checkbox" id="selected-all"></th>
								<th>id</th>
								<th>商品名称</th>
								
															 
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach  items="${sort}" varStatus="i"  var ="sort" >
						
							<tr class="table-row" >
								<td><input type="checkbox" name="id"></td>
								<td>${sort.type_id}</td>
								<td>${sort.type_name}</td>
								
								
								<td>
									 <a href="#" target="" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
									<a href="javascript:editbtn(this,${user.uid});" class="layui-btn layui-btn-mini edit">编辑</a>
									<a href="javascript:void(0);" onclick="delUser(this,${user.uid})" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini del">删除</a>
								</td>
							</tr>
				</c:forEach>
							 				 
						</tbody>
					</table>


				</div>
			</fieldset>
			<center>
			<div class="admin-table-page">
				<div id="page" class="page">
				
				</div>
			</div>
			</center>
	    </div>
		
       <!--   <script type="text/javascript" src="js/useredit.js"></script>   -->
        <script type="text/javascript" src="js/edit.js"></script>
	<script type="text/javascript">
		function delUser(nowTr,uid){
		
		if(confirm("确认删除该用户？")){;
		  $.ajax({
		  	 url:"Check_DelUser",
		  	 data:"uid="+uid,
		  	 type:"POST",
		  	 success(a){
		  	 if(null!=a&&a!=0){
		  	
			   $(nowTr).parent().parent().remove();
		  	 }
		  	 else{
		  	 
		  	 alert("删除失败！");
		  	 }
		  	 
		  
		  }
		  
		  })
		  }
		}
	layui.use(['element', 'layer','laypage'], function () {
					  var element = layui.element;
					  var layer = layui.layer;
					  var laypage = layui.laypage;
					  var $ = layui.jquery;
					 //执行一个laypage实例
					  laypage({
					    cont: 'page'
					    ,pages: ${allPage}//总页数
					    ,groups: 4//连续显示分页数
					    ,curr: ${PageNo} //当前页数
					    ,jump: function(obj, first) { //obj（当前分页的所有选项值）、first（是否首次，一般用于初始加载的判断）
						 
								var PageNo = obj.curr;
								
								
								/*console.log(curr); //得到当前页，以便向服务端请求对应页的数据。
								console.log(obj.limit); //得到每页显示的条数*/
								if(!first) {
								 window.location.href = "Check_checkAllUser?pageNo="+PageNo;
								
									//layer.msg('第 '+ obj.curr +' 页');
								}
							}
					  });

					   //添加用户
					    function addNews(edit){
					        var index = layui.layer.open({
					            title : "添加信息",
					            type : 2,
					            content : "Tea_manage/product_list.jsp",
					            success : function(layero, index){
					                // var body = layui.layer.getChildFrame('body', index);
					                // if(edit){
					                //     body.find(".newsName").val(edit.newsName);
					                //     body.find(".abstract").val(edit.abstract);
					                //     body.find(".thumbImg").attr("src",edit.newsImg);
					                //     body.find("#news_content").val(edit.content);
					                //     body.find(".newsStatus select").val(edit.newsStatus);
					                //     body.find(".openness input[name='openness'][title='"+edit.newsLook+"']").prop("checked","checked");
					                //     body.find(".newsTop input[name='newsTop']").prop("checked",edit.newsTop);
					                //     form.render();
					                // }
					                setTimeout(function(){
					                    layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
					                        tips: 3
					                    });
					                },500)
					            }
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
				 
	                   
	                    
					});
	
	
	</script>
		 
	</body>

</html>