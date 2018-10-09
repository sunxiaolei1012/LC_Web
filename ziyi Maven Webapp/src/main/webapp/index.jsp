<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
	<!-- <link rel="stylesheet" type="text/css" href="css/layout.css"> -->
	<link rel="stylesheet" type="text/css" href="css/mui.css">
	<link rel="stylesheet" type="text/css" href="css/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/home.css">
	 
<script type="text/javascript" src="js/chen.js"></script>
	<script type="text/javascript">
		function load()
		{
			if(${empty user})
			{
				top.location.href="login.jsp";
			}
		}
	</script>
</head>
<body onload="load();tableShow()">
	<div class="mui-content">
	    <div class="nav-header">
			<ul class="layui-nav">
			  <li class="layui-nav-item">
			    <a href=""><img src="images/logo.png" class="layui-nav-img">紫怡茶道 POS 管理系统 V2018</a>
			  </li>			  
			  <li class="layui-nav-item mui-pull-right">
			    <a href="#"><img src="images/admin.png" class="layui-nav-img">
			    	<c:forEach var="i" items="${role}">
			    		<c:if test="${i.roleid == user.userrole }">
			    			${i.name }
			    		</c:if>
			    	</c:forEach>
			    </a>
			    <dl class="layui-nav-child">
			      <dd><a href="login.jsp">退出</a></dd>
			    </dl>
			  </li>
			</ul>
		</div>
		 
		<div class="content">
			<div class="middle">
				<div class="inner-middle">
					<!-- <div class="middle-content"> -->
					<div class="middle-top common-content">
						<ul class="new-min-title-list">

							<li><a href="#item1" class="mui-control-item mui-active"><span class="mui-icon iconfont icon-canzhuo"></span>餐桌管理</a></li>
							<li><a href="#item2" class="mui-control-item"><span class="mui-icon iconfont icon-daocha-copy"></span>店内下单</a></li>
<!-- 							<li><a href="#item3" class="mui-control-item"><span class="mui-icon iconfont icon-icon17"></span>订单管理</a></li> -->
<!-- 							<li><a href="javascript:main()" class=""><span class="mui-icon iconfont icon-shezhi"></span>系统设置</a></li> -->
							<li><a href="#" class=""><span class="mui-icon iconfont icon-logout"></span>退出登录</a></li>
						</ul>
			        </div>
					<div class="middle-center common-content">
						<div id="item1" class="mui-control-content mui-active">
							<div class="middle-center-top">
								<p class="titleName"><span style="font-size:30px;" class="iconfont iconfont icon-canzhuo"></span><span style="font-size: 22px;">&nbsp;餐桌管理</span></p>
							</div>
							<div class="middle-center-middle1">					
								<div class="middle-center-box">
								 	<div class="middle-center-tableLayout">
								 		<!-- <img class="tableImg" src="images/tableLayout.png"> -->
								 		<div class="middle-center-tableList">
								 		    
								 			<button class="layui-btn" >A1</button>
								 			<button class="layui-btn">A2</button>
								 			<button class="layui-btn">A3</button>
								 			<button class="layui-btn">A4</button>
								 			<button class="layui-btn">A5</button>
								 			<button class="layui-btn">A6</button>
								 			<button class="layui-btn">A7</button>
								 			<button class="layui-btn">A8</button>
								 		</div>
								 		<div class="middle-center-tableList">
								 			<button class="layui-btn">B1</button>
								 			<button class="layui-btn">B2</button>
								 			<button class="layui-btn">B3</button>
								 			<button class="layui-btn">B4</button>
								 			<button class="layui-btn">B5</button>
								 			<button class="layui-btn">B6</button>
								 		</div>
								 		<div class="middle-center-tableList">
								 			<button class="layui-btn">C1</button>
								 			<button  class="layui-btn">C2</button>
								 			<button class="layui-btn">C3</button>
								 			<button class="layui-btn">C4</button>
								 			<button class="layui-btn">C5</button>
								 			<button class="layui-btn">C6</button>
								 			<button class="layui-btn">C7</button>
								 			<button class="layui-btn">C8</button>
								 		</div>
								 	</div>
								 	<div class="middle-center-tableStatue">
								 		<div class="middle-center-tablebox">
									 		<div class="middle-center-statueLogo">
									 			<ul class="new-min-title-list">
													<li><a href="#" class=""><span class="mui-icon iconfont icon-canzhuo"></span>餐桌管理</a></li>
												</ul>
									 		</div>
									 		<div class="middle-center-statueList">
									 			<div class="middle-btnList"><button class="layui-btn layui-btn-grey"></button><span>空闲</span></div>
									 			<div class="middle-btnList"><button class="layui-btn layui-btn-orange"></button><span>占用</span></div>
									 			<div class="middle-btnList"><button class="layui-btn layui-btn-green"></button><span>预定</span></div>
									 			<div class="middle-btnList"><button class="layui-btn layui-btn-blue"></button><span>打扫中</span></div>
									 			<!-- <div class="middle-btnList"><button class="layui-btn layui-btn-purple"></button><span>已结算，客户未离开</span></div>	 -->
									 		</div>
								 		</div>
								 	</div>
								</div>							  
							</div>
						</div>
						<!-- end item1 -->
						<div id="item2" class="mui-control-content">
							<div class="middle-center-top">
								<p class="titleName"><span style="font-size:30px;" class="iconfont icon-daocha-copy"></span><span style="font-size: 22px;">&nbsp;店内下单</span></p>
							</div>
							<div class="middle-center-middle">					
									
								<div class="layui-tab layui-tab-brief" style="height: 100%;" lay-filter="docDemoTabBrief">
									<!-- <div class=""> -->
									<ul class="layui-tab-title">
										    								    
									</ul>
									<!-- </div> -->
									<div id="layui-tab-content" class="layui-tab-content middle-center-bottom" style='b'>
									  	 
									</div>
								</div> 
							</div>
						</div>
						<!-- end item2 -->
						<div id="item3" class="mui-control-content" style="">
							<div class="middle-center-top">
								<p class="titleName"><span style="font-size:30px;" class="iconfont icon-icon17"></span><span style="font-size: 22px;">&nbsp;订单管理</span>
								</p>
								<div  class="middle-center-select" >
							      <div class="float"> 
							        
							        <select>
					                    <option>按日期查询...</option>
					                    <optgroup label="">
					                    	<option>一</option>
					                    </optgroup>
					                    <optgroup label="按星期查询">
					                    	<option>一</option>
					                    	<option>二</option>
					                    	<option>三</option>
					                    </optgroup>
					                    <optgroup label="按月查询">
					                        <option>1</option>
					                        <option>2</option>
					                        <option>3</option>
					                    </optgroup>
					                    <optgroup label="按年份查询">
					                    	<option>2018</option>
					                    	<option>2017</option>
					                    	<option>2016</option>
					                    </optgroup>
							        </select>
							        <button><i class="iconfont icon-sousuo"></i></button>		          
							      </div>
							    </div> 
							</div>
							<div class="middle-center-middle2">
							    <div class="middle-table middle-center-table">							 
									 <table class="layui-table" lay-data="{page:true,limit:10}">
									  <thead>
									    <tr>
									      <th lay-data="{field:'id',sort: true}">订单编号</th>
									      <th lay-data="{field:'tabNum',}">桌号</th>
									      <th lay-data="{field:'mebNum',sort: true}">会员卡号</th>
									      <th lay-data="{field:'stime',sort: true}">入店时间</th>
									      <th lay-data="{field:'etime',sort: true}">结算时间</th>
									      <th lay-data="{field:'statue'}">完成状态</th>					
									      <th lay-data="{field:'listSum'}">订单总金额</th>				 
									      <th lay-data="{field:'discount'}">是否打折</th>	
									    </tr>
									  </thead>
									  <tbody>
									  	  <tr>
									        <td>01</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									      <tr>
									        <td>02</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									       
									      <tr>
									        <td>01</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									      <tr>
									        <td>02</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									      <tr>
									        <td>03</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									      <tr>
									        <td>04</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									       
									      <tr>
									        <td>04</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									      <tr>
									        <td>01</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									      <tr>
									        <td>01</td>
									        <td>001</td>
									        <td>666666</td>
									        <td>2018.8.10-10:00</td>
									        <td>2018.8.10-12:00</td>
									        <td>完成</td>
									        <td>246</td>
									        <td>是</td>
									      </tr>
									    </tbody>
									</table>
							    </div>
							    <style type="text/css">
							    	.middle-ta-change-btnlist{
							    		height: 20%;
							    		width: 100%;
							    	}
							    </style>
							    <div class="middle-tab-change-btnlist">
									<button type="button" class="mui-btn mui-btn-primary mui-btn-add" >添加订单</button>
									<!--<button type="button" class="mui-btn mui-btn-primary mui-btn-del" >删除订单</button>-->
								</div>
							</div>
						</div>
						<!-- end item3 -->
						<div id="item4" class="mui-control-content">4</div>
						<div id="item5" class="mui-control-content">5</div>
					</div>				
				</div>
			</div>
			<div class="left">
			    <div class="left-content common-content">
					<div class="left-top">						 
						<ul class="mui-table-view">
						    <li class="mui-table-view-cell mui-media">
						        <a href="javascript:;">
						            <img class="mui-media-object mui-pull-left" src="images/head.png">
						            <div class="mui-media-body">
						                <span class="title titleName">${user.name }</span>
						                <p class="mui-ellipsis">
						                <c:forEach var="i" items="${role}">
			    		<c:if test="${i.roleid == user.userrole }">
			    			${i.name }
			    		</c:if>
			    	</c:forEach></p>
						            </div>
						        </a>
						    </li>							     
						</ul>						 
					</div>
					<div class="left-time">
						<p class="timeHour fontBig mui-ellipsis"></p>
						<p class="timeYear fontSmall mui-ellipsis"></p>
					</div>
					<div class="devider"></div>
					<div class="left-middle">
						<ul class="mui-table-view">
<!-- 							服务员  吧台-->
							<c:if test="${user.userrole == 3 || user.userrole == 2 }">
								 <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="sellCard()"  class="mui-control-item">会员卡查询</a></li>
								 <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="update_user_password('user_password')" class="mui-control-item">密码修改</a></li>
							</c:if>
<!-- 							管理员 -->
							<c:if test="${user.userrole == 1 }">
								<li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="sellCard()"  class="mui-control-item">会员卡查询</a></li>
								<li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="sellCard()"  class="mui-control-item">售卡记录</a></li>
							    <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="opens()" >会员开卡</a></li>
							    <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="sumPrice()" >营业额</a></li>
							    <li class="mui-table-view-cell">香烟</li>
							    <li class="mui-table-view-cell"><a href="javascript:add_chart('chart');" >报表</a></li>
							    <li class="mui-table-view-cell"><a href="login.jsp">后台管理</a></li>
							    
							</c:if>
						   
						</ul>
					</div>
					<div class="devider1"></div>
					<div class="left-time left-bottom">
						<p class="fontSmall mui-ellipsis">今日营业总额</p>
						<p class="fontBig mui-ellipsis">￥<span id='priceAll'>0</span></p>
					</div>
				</div>
			</div>
			<div class="right">
                <div id='right-content' class="right-content common-content">
                	<!-- 右边订单 -->
 
			    </div>
		    </div>
			 

    </div>
</body>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="layui/layui.js"></script>
    <script type="text/javascript" src="js/sxl.js"></script>
    <script type="text/javascript" src="js/mui.min.js"></script>
    <script>
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use(['element','table','layer'], function(){
		  var element = layui.element;
		  var table = layui.table;
		  var layer = layui.layer;
		});

		$(document).ready(function(){
			//时间
  		    var n;
	        setInterval(getTime,1000);
	        getTime();
	        function getTime(){
		        var datetime = new Date();
			    var year = datetime.getFullYear();
			    var month = datetime.getMonth()+1;
			    var day = datetime.getDate();
			    var hour = datetime.getHours();
			    var minute = datetime.getMinutes();
			    var second = datetime.getSeconds();
			    var myxingqi=datetime.getDay() 
	            var b=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); 
			    hour = toLow(hour);
			    minute = toLow(minute);
			    second = toLow(second);
			    var inner = year + '年' + month + '月' + day + '日' + ' ' + b[myxingqi];
			    var time = hour + ':' + minute;
			    // getElementsByClassName()获得的是一个数组，若要设置其中元素内容，要设置下标
			    document.getElementsByClassName("timeHour")[0].innerHTML = time;
			    document.getElementsByClassName("timeYear")[0].innerHTML = inner;

	//			   alert(inner);
	        }
			function toLow(n){			  	 
			  	return n<10 ? '0'+n : n;
			}
			
			//总金额显示
			function priceAll(){
			     $.ajax({
				       type:"post",
				       url:"main_price",
				       dataType:"json",
				       cache:false,
				       async: false,
				       success:function(d){
				              console.log(d.price);
				    	      //$("#priceAll").innerText = d.price;
				    	      $("#priceAll").text(d.price);				    	     			
				       }
				   
				   });
			}
			var interverPrice = setInterval(priceAll,5000);
			//金额显示结束
			//餐桌状态
            var interverTabel = setInterval(tableShow,5000);
            //var interverTabel = setInterval(orderShow,3000);
            //商品种类
            category();
			// 餐桌状态
			var timenull = null;						
			$('.middle-center-tableLayout button').addClass('layui-btn-grey');		
			$(".middle-center-tableLayout button").bind('click',function(){
				clearTimeout(timenull);
				var ele = $(this);
				/* console.log(ele.index()); */
				timenull = setTimeout(function(){
				// alert("1");
				    if(ele.hasClass('layui-btn-grey')){
                       // alert('1');
                       layer.msg('该桌号空闲',{icon:6});
                       $(".right-top").css('display','none');
                       $(".right-middle").css('display','none');
				    }else if(ele.hasClass('layui-btn-orange')){
				       // alert('2');
				       layer.msg('该桌号已被占用',{icon:6});
                       $(".right-top").css('display','block');
                       $(".right-middle").css('display','block');
				    }else if(ele.hasClass('layui-btn-green')){
				       // alert("3");
				       layer.msg('该桌号已被预订',{icon:6});
				       $(".right-top").css('display','none');
                       $(".right-middle").css('display','none');
				    }
				    else if(ele.hasClass('layui-btn-blue')){
				    	// alert("4");
				    	layer.msg('该桌号打扫中',{icon:6});
				    	$(".right-top").css('display','block');
                        $(".right-middle").css('display','block');
				    }
				},300);
			}).bind('dblclick',function(){
				clearTimeout(timenull);
				var ele = $(this);
				var ele_id = ele.context.id;
				layer.open({
						title: '修改餐桌状态',
						// content: '餐桌状态修改',
						// offset: 'c',
						skin: 'layui-layer-skin', //样式类名
						btn:['空闲','占用','预定','打扫中'],
						yes:function(index,layero){
// 							alert("test1");
							console.log(index);
							ele.removeClass();
						    ele.addClass('layui-btn-grey');
						    $(".right-top").css('display','none');
                            $(".right-middle").css('display','none');
// 						    layer.close(index);
						    update_state(ele_id , index);
						},
						
						btn2:function(index,layero){
						// alert("test2");
							ele.removeClass();
						    ele.addClass('layui-btn-orange');
						    $(".right-top").css('display','block');
                            $(".right-middle").css('display','block');
                            update_state(ele_id , index);
						},
						btn3:function(index,layero){
							// alert("test3")
							ele.removeClass();
					    	ele.addClass('layui-btn-green');
					    	$(".right-top").css('display','none');
                        $(".right-middle").css('display','none');
						},
						btn4:function(index,layero){
							// alert("test4")
							ele.removeClass();
					        ele.addClass('layui-btn-blue');
					        $(".right-top").css('display','block');
                        $(".right-middle").css('display','block');
						}
					});

			    });

			$(".middle-tab-change-btnlist .mui-btn-add").click(function(){
				layer.open({
				  title:'添加订单',
				  type: 2,
				  area: ['500px', '450px'],
				  fixed: false, //不固定
				  maxmin: true,
				  content: 'addOrder.jsp'
				});
			})
        });
		mui('.mui-scroll-wrapper').scroll({
			 scrollY: true, //是否竖向滚动
			 scrollX: false, //是否横向滚动		 
			 indicators: true, //是否显示滚动条
			 deceleration:0.0006, //阻尼系数,系数越小滑动越灵敏
			 bounce: true //是否启用回弹
			});
    </script>
</html>