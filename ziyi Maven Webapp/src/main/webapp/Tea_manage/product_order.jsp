
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
			function addCount(a){
			var  b= parseInt($("#"+a).val());
				var d=b+1;
				
				  $.ajax({
		  	 url:"Product_changeNum",
		  	 data:"number="+d+"&name="+a,
		  	 type:"POST",
		  	 success(c){
		  	 if(null!=c&&c!=0){
		 
			  $("#"+a).attr("value",d);
		  	 }
		  	 else{
		  	 
		  	 alert("数量修改失败！");
		  	 } 

	}
    })
				
			
			}
			
			function delCount(a){
			var  b= parseInt($("#"+a).val());
			if(b<=0){
				b=0;
			}else{
			var d=b-1;
			}
			 $.ajax({
		  	 url:"Product_changeNum",
		  	 data:"number="+d+"&name="+a,
		  	 type:"POST",
		  	 success(c){
		  	 if(null!=c&&c!=0){
		 
			  $("#"+a).attr("value",d);
		  	 }
		  	 else{
		  	 
		  	 alert("数量修改失败！");
		  	 } 

	}
    })
			
					
			
			}
		 function changeNum(a){
		
			var  b= parseInt($("#"+a).val());
			alert(b);
		 $.ajax({
		  	 url:"Product_changeNum",
		  	 data:"number="+b+"&name="+a,
		  	 type:"POST",
		  	 success(c){
		  	 if(null!=c&&c!=0){
		 
			  $("#"+a).attr("value",b);
			  	window.location.reload();
		  	 }
		  	 else{
		  	 
		  	 alert("数量修改失败！");
		  	 } 

	}
    })

			
		
		} 
			
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
	<script type="text/javascript">
						
	function ShowElement(element,pid) {
        var oldhtml = element.innerHTML;
		var id= parseInt(pid);
	
		
        //创建新的input元素
        var newobj = document.createElement('input');
        //为新增元素添加类型
        newobj.type = 'text';
        //为新增元素添加value值
        newobj.value = oldhtml;
        //为新增元素添加光标离开事件
        newobj.onblur = function() {
        
            //当触发时判断新增元素值是否为空，为空则不修改，并返回原有值 
            element.innerHTML = this.value == oldhtml ? oldhtml : this.value;
            
             $.ajax({
		  	 url:"Product_updateName",
		  	 data:"ids="+id+"&name="+this.value,
		  	 type:"POST",
		  	 success(a){
		  	 if(null!=a&&a!=0){
		  	alert("修改成功");
			  
		  	 }
		  	 else{
		  	 
		  	 alert("修改失败！");
		  	 } 

	}
    })
            //当触发时设置父节点的双击事件为ShowElement
            element.setAttribute("ondblclick", "ShowElement(this,id);");
             
        }
        
       
        //var id=document.getElementById("sellingid");

        //设置该标签的子节点为空
        element.innerHTML = '';
        //添加该标签的子节点，input对象
        element.appendChild(newobj);
        //设置选择文本的内容或设置光标位置（两个参数：start,end；start为开始位置，end为结束位置；如果开始位置和结束位置相同则就是光标位置）
        newobj.setSelectionRange(0, oldhtml.length);
        //设置获得光标
        newobj.focus();

        //设置父节点的双击事件为空
        newobj.parentNode.setAttribute("ondblclick", "");
			
			   
	
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
                      <i class="layui-icon"><span>+</span></i>新增用户
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
								<th>商品价格</th>
								<th>商品数量</th>
								<th>添加人员</th>
								<th>商品种类</th>
															 
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach  items="${productList}" varStatus="i"  var ="product" >
						
							<tr class="table-row" >
								<td><input type="checkbox" name="id"></td>
								<td>${product.sellingid}</td>
								<td  ondblclick="ShowElement(this,'${product.sellingid}')">${product.name}</td>
								
								<td id="pid" style="display:none" value="${product.sellingid}"> ${product.sellingid}</td>
								<td>${product.price}￥</td> 
								<td><input id="del" style="width: 15px;margin-right: 30px; ;"  onclick="delCount('${product.name}')" type="button"  value="-" >
								<input type="text"  style="width: 45px;"  id="${product.name}" value="${product.number}"   onblur="changeNum('${product.name}')"/>
								<input type="button"  id="add" style="width: 15px; margin-left: 30px;" value="+"  onclick="addCount('${product.name}')"></td>								
								
								<td>
									<c:if test="${product.userid==1}">admin</c:if>
									<c:if test="${product.userid==2}">user</c:if>
								</td>	
									<td>
									<c:if test="${product.typeid==1}">茶</c:if>
									<c:if test="${product.typeid==2}">小吃</c:if>
									<c:if test="${product.typeid==3}">果盘</c:if>
									<c:if test="${product.typeid==4}">饮料</c:if>
									<c:if test="${product.typeid==5}">酒水</c:if>
									<c:if test="${product.typeid==6}">其他</c:if>
									
								</td>	 
								<td>
									 <a href="#" target="" class="layui-btn layui-btn-normal layui-btn-mini">预览</a>
									<a href="javascript:editbtn(this,${user.uid});" class="layui-btn layui-btn-mini edit">编辑</a>
									<a href="javascript:void(0);" onclick="delUser(this,${product.sellingid})" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini del">删除</a>
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
		  	 url:"Product_delProduct",
		  	 data:"sellingid="+uid,
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
					    ,pages:${allPage}//总页数
					    ,groups: 4//连续显示分页数
					    ,curr: ${PageNo} //当前页数
					    ,jump: function(obj, first) { //obj（当前分页的所有选项值）、first（是否首次，一般用于初始加载的判断）
						 
								var PageNo = obj.curr;
								
								
								/*console.log(curr); //得到当前页，以便向服务端请求对应页的数据。
								console.log(obj.limit); //得到每页显示的条数*/
								if(!first) {
								 window.location.href = "UserInfo_showProduct?pageNo="+PageNo;
								
									//layer.msg('第 '+ obj.curr +' 页');
								}
							}
					  });

					   //添加用户
					    function addNews(edit){
					        var index = layui.layer.open({   
					            type : 2,
					            content : "admin_edituser.jsp",
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