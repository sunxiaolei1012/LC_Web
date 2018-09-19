<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	 

</head>
<body>
	<div class="mui-content">
	    <div class="nav-header">
			<ul class="layui-nav">
			  <li class="layui-nav-item">
			    <a href=""><img src="images/logo.png" class="layui-nav-img">紫怡茶道 POS 管理系统 V2018</a>
			  </li>			  
			  <li class="layui-nav-item mui-pull-right">
			    <a href=""><img src="images/admin.png" class="layui-nav-img">管理员</a>
			    <dl class="layui-nav-child">
			      <dd><a href="javascript:;">修改信息</a></dd>
			      <dd><a href="javascript:;">退出</a></dd>
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
							<li><a href="#item3" class="mui-control-item"><span class="mui-icon iconfont icon-icon17"></span>订单管理</a></li>
							<li><a href="#" class=""><span class="mui-icon iconfont icon-shezhi"></span>系统设置</a></li>
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
								 			<button class="layui-btn">A1</button>
								 			<button class="layui-btn">A2</button>
								 			<button class="layui-btn">A3</button>
								 			<button class="layui-btn">A4</button>
								 			<button class="layui-btn">A5</button>
								 			<button class="layui-btn">A6</button>
								 			<button class="layui-btn">A7</button>
								 			<button class="layui-btn">A8</button>
								 		<br/><br/>
								 			<button class="layui-btn">B1</button>
								 			<button class="layui-btn">B2</button>
								 			<button class="layui-btn">B3</button>
								 			<button class="layui-btn">B4</button>
								 			<button class="layui-btn">B5</button>
								 			<button class="layui-btn">B6</button>
								 		<br/><br/>
								 			<button class="layui-btn">C1</button>
								 			<button class="layui-btn">C2</button>
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
									 			<div class="middle-btnList"><button class="layui-btn layui-btn-blue"></button><span>请求结算</span></div>
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
									
								<div class="layui-tab layui-tab-brief" style="height: 100%" lay-filter="docDemoTabBrief">
									<!-- <div class=""> -->
										<ul class="layui-tab-title" style="">
										    <li class="layui-this">花茶类</li>
										    <li>小吃类</li>
										    <li>果盘类</li>
										    <li>饮料类</li>
										    <li>酒水类</li>
										    <li>其他</li>										    
										</ul>
									<!-- </div> -->
									<div class="layui-tab-content middle-center-bottom">
									  	<!-- start item1 -->
									    <div class="layui-tab-item layui-show">
									    	  <!-- start -->
                                            <div class="mui-table-view-list">
												<div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>
													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>
									            <div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>

													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>
									            <div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>

													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>
									            <div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>

													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>

						                    </div>
									    	<!-- end -->
									    </div>
									    <!-- end item1 -->

									    <!-- start item2 -->
									    <div class="layui-tab-item">
									    	<!-- start -->                                                
                                            <div class="mui-table-view-list">
												<div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>
													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>
									            <div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>

													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>
									            <div class="mui-card pattern-list">				 
													<div class="mui-card-header">
														<img class="w100" src="images/goods.png"/>
													</div>
													<div class="mui-card-content">
														<div class="mui-card-content-inner" >
															<p>碧螺春</p>
														</div>
													</div>

													<div class="pattern-list__p" style="">
														<p class="font-color-pink">￥<label>128</label></p>
														<p class="font-color-gray"><a href="#popover"><span class="mui-icon mui-icon-plus"></a></p>
													</div>				
									            </div>
									        </div>

									    	<!-- end -->
									    </div>
									    <!-- end item2 -->
									    <div class="layui-tab-item">内容3</div>
									    <div class="layui-tab-item">内容4</div>
									    <div class="layui-tab-item">内容5</div>
									    <div class="layui-tab-item">内容6</div>
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
							        <!-- <select id="">
					                    <option>按日期查询...</option>
					                    <option>003</option>
					                    <option>005</option>
					                    <option>003</option>
					                    <option>004</option>
							        </select> -->
							        <form class="layui-form" action="">
								        <div class="layui-form-item" style="">
										    <!-- <label class="layui-form-label">搜索</label> -->
										    <div class="layui-input-block">
										      <input type="text" name="" placeholder="按日期查询..." class="layui-input">
										    </div>
										</div>
								    </form>
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
									<button type="button" class="mui-btn mui-btn-primary mui-btn-del" >删除订单</button>
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
						                <span class="title titleName">小丸子</span>
						                <p class="mui-ellipsis">收银员</p>
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
						    <li class="mui-table-view-cell"><a href="#item4" class="mui-control-item">当日售卡记录</a></li>
						    <li class="mui-table-view-cell">非D型卡销售</li>
						    <li class="mui-table-view-cell">阅读非D型卡上信息</li>
						    <li class="mui-table-view-cell">非D型卡列表</li>
						    <li class="mui-table-view-cell">IC卡消费记录</li>
						    <li class="mui-table-view-cell"><a href="leftT.html">茶品维护</a></li>
						</ul>
					</div>
					<div class="devider1"></div>
					<div class="left-time left-bottom">
						<p class="fontSmall mui-ellipsis">今日营业总额</p>
						<p class="fontBig mui-ellipsis">￥<span>38,540.07</span></p>
					</div>
				</div>
			</div>
			<div class="right">
                <div id='right-content' class="right-content common-content">
                    <div class="right-top">						 
						<ul class="mui-table-view">
						    <li class="mui-table-view-cell mui-media">
						        <a href="javascript:;">
						            <!-- <img class="mui-media-object mui-pull-left" src="images/head.png"> -->
						            <div class="mui-media-body">
						                <span class="title titleName mui-table-view-cell">订单列表</span> 
						                <p class="mui-ellipsis mui-table-view-cell">订单号：<span>2018000001</span><span class="mui-badge mui-badge-inverted"><span class="mui-ellipsis">桌号&nbsp;</span><span class="mui-ellipsis" style="font-size: 30px">A03</span></span></p>
						            </div>
						        </a>
						    </li>							     
						</ul>						 
					</div>
					<div class="right-middle common-content">
						<div class="right-middle-top">
							<ul class="mui-table-view">
							    <li class="mui-table-view-cell mui-media">
							        <a href="javascript:;">
							            <img class="mui-media-object mui-pull-left" src="images/headMeb.png">
							            <div class="mui-media-body">
							                <span class="title mebTitle">会员名:孙先生</span>
							                <p class="mui-ellipsis mebNum">会员号：888888</p>
							            </div>
							        </a>
							    </li>							     
						    </ul>
						</div>
						<div class="devider2"></div>
						<div class="right-middle-middle right-middle-scroll">							 
							<ul class="mui-table-view">
							    <li class="mui-table-view-cell mui-media">
							        <a href="javascript:;">
							            <div class="mui-media-body">
							                <span class="mebNum mui-table-view-cell">ZY003</span>
							                <p class="mui-ellipsis mui-table-view-cell"><span class="title mebTitle">碧螺春</span>
							                	<span class="mui-badge mui-badge-inverted"><span class="mui-ellipsis mebTitle">×<label>1</label>壶</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mui-ellipsis title mebTitle">100.00</span>&nbsp;&nbsp;<span class="iconfont icon-shanchu"></span><span class="iconfont icon-tianjia"></span></span>
							                </p>
							            </div>
							        </a>
							    </li>
							  
						    </ul>    
						</div>
						<div class="right-middle-bottom" >
							<div class="right-middle-bottom-pay">
								<p class="title mebNum">消费总金额</p><p class="title mui-ellipsis">100.00</p>
							</div>
							 
							<div class="right-middle-bottom-pay">
								<div class=""><p class="mebNum">结账状况</p><p class="title mebTitle">已结算</p></div>								
								<button type="button" class="mui-btn mui-btn-warning">结算</button>
							</div>
						</div>
						<!-- display:none -->
						<!-- <div class="">pay</div> -->						
					</div>
			    </div>
		    </div>
			 

    </div>
</body>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="layui/layui.js"></script>
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

			// 餐桌状态
			var timenull = null;
			$('.middle-center-tableLayout button').addClass('layui-btn-grey');		
			$(".middle-center-tableLayout button").bind('click',function(index){
				clearTimeout(timenull);
				var ele = $(this);
				console.log(ele.index());
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
				    }else if(ele.hasClass('layui-btn-blue')){
				    	// alert("4");
				    	layer.msg('该桌号等待结算中',{icon:6});
				    	$(".right-top").css('display','block');
                        $(".right-middle").css('display','block');
				    }
				},300);
			}).bind('dblclick',function(){
				clearTimeout(timenull);
				var ele = $(this);
				layer.open({
						title: '修改餐桌状态',
						// content: '餐桌状态修改',
						// offset: 'c',
						skin: 'layui-layer-skin', //样式类名
						btn:['空闲','占用','预定','请求结算'],
						yes:function(index,layero){
							// alert("test1");
							ele.removeClass();
						    ele.addClass('layui-btn-grey');
						    $(".right-top").css('display','none');
                            $(".right-middle").css('display','none');
						    layer.close(index);
						},
						btn2:function(index,layero){
						// alert("test2");
							ele.removeClass();
						    ele.addClass('layui-btn-orange');
						    $(".right-top").css('display','block');
                            $(".right-middle").css('display','block');
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