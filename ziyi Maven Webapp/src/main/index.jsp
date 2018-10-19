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
						<!-- <div id="item4" class="mui-control-content">4</div>
						<div id="item5" class="mui-control-content">5</div> -->
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
							    <li class="mui-table-view-cell"><a href="adminindex">后台管理</a></li>
							    
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
<!-- 弹出的支付表单 -->
<style type="text/css">
.crashcard{
	display: none;
}
.cardbox{
	display: flex;
	flex-direction: row;
	justify-content: flex-start;	 
}
 
.crashcard button{
	margin-left: 1%;
	width: 60px;
	height: 40px;
	/*border:1px solid red;*/
}
.discounts{
   display:none;
}
.regoodlist .mui-table-view-list{
    display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: space-between;
	background-color: transparent;
    padding: 10px;
}
#rebategs{
    border-bottom:3px solid rgba(107,162,208,1);
}
</style>
   <!-- 支付窗口 -->
	<div id='layform1' style='display:none;'>
		<br>		 
		<form class='layui-form' id="payform">
			<div class='layui-form-item'>
			    <label class='layui-form-label' style='padding-left:0;'>支付方式</label>
			    <div class='layui-input-block'>
				      <select id="selectBox" lay-filter='paybox'>
				        <!-- <option value=''></option> -->
				        <option value='0' name='cash'>现金</option>
				        <option value='1' name='weixin'>微信</option>
				        <option value='2' name='zhifub'>支付宝</option>
				        <option value='3' name='member'>会员卡</option>
				      </select>
			    </div>			    	
			</div>			 		 
		</form>
		<div class="crashcard">
			<div class="cardbox">
			    <button type="button" id="card" class="mui-btn mui-btn-warning">刷卡</button>
				<div class="layui-form-item" style='width:100%;'>
				    <div class="layui-input-block" style="margin-left:45px;">
				      <input type="text" class="meberNum" class="layui-input">
				    </div>
				</div>												
			</div>
		</div>
		
        <div class='discounts'>
           <div class="layui-form-item">
			    <label class="layui-form-label">折扣率</label>
			    <div class="layui-input-block">
			      <input type="text" id="disnum" name="title" placeholder="请输入折扣率" class="layui-input">
			    </div>
		   </div>        
           <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">折扣说明</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
		   </div>
        </div>
        
		<div class="right-middle-middle">
			<ul class="mui-table-view goodslists" id="goodslists">			  
			    <!-- <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <div class="mui-media-body">
			                <span class="mebNum mui-table-view-cell">ZY003</span>
			                <p class="mui-ellipsis mui-table-view-cell"><span class="title mebTitle">碧螺春</span>
			                	<span class="mui-badge mui-badge-inverted"><span class="mui-ellipsis mebTitle">×<label>1</label>壶</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mui-ellipsis title mebTitle">100.00</span>&nbsp;&nbsp;<span class="iconfont icon-shanchu"></span><span class='iconfont icon-tianjia'></span></span>
			                </p>
			            </div>
			        </a>
			    </li>
			    <li class="mui-table-view-cell mui-media">
			        <a href="javascript:;">
			            <div class="mui-media-body">
			                <p class="mui-ellipsis mui-table-view-cell"><span class="title mebTitle">碧螺春</span>
			                	<span class="mui-badge mui-badge-inverted"><span class="mui-ellipsis mebTitle">×<label>1</label>壶</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mui-ellipsis title mebTitle">100.00</span>&nbsp;&nbsp;<span class="iconfont icon-shanchu"></span><span class='iconfont icon-tianjia'></span></span>
			                </p>
			            </div>
			        </a>
			    </li>		 -->			     
			</ul>
		</div>
		<div class="right-middle-bottom-pay" style="display: flex;justify-content: flex-end;padding-right: 10%">
			<p class="title mebNum">消费总金额:<span class="title mui-ellipsis" id="summoney">0.00</span></p> 
		</div>
	</div>
	<!-- pay end -->
	<!-- start continue -->
	<div id="regoods" style="display: none;">
		<div class="regoodlist">
				<!-- start item1 -->		     
		    	<!-- start -->
                <div class="mui-table-view-list" id="rebategs">
					<!-- <div class="mui-card pattern-list">				 
						<div class="mui-card-header">
							<img class="w100" src="images/goods.png"/>
						</div>
						<div class="mui-card-content">
							<div class="mui-card-content-inner" >
								<p>碧螺春</p>
							</div>
						</div>
						<div class="pattern-list__p">
							<p class="font-color-pink">￥<label>128</label></p>
							<p class="font-color-gray"><a href="#"><span class="iconfont icon-tianjia"></span></a></p>
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
						<div class="pattern-list__p">
							<p class="font-color-pink">￥<label>128</label></p>
							<p class="font-color-gray"><a href="#"><span class="iconfont icon-tianjia"></span></a></p>
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
						<div class="pattern-list__p">
							<p class="font-color-pink">￥<label>128</label></p>
							<p class="font-color-gray"><a href="#"><span class="iconfont icon-tianjia"></span></a></p>
						</div>				
		            </div>		 -->             
                </div>		     
                <!-- end item1 -->               
                <!-- start low -->
                <div class="mui-table-view-list" id="rebategs1">
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
							<p class="font-color-gray"><a href="#"><span class="iconfont icon-tianjia"></span></a></p>
						</div>				
		            </div>		          		             
                </div>
                <!-- end low -->
	    </div>
	</div>
	<!-- end continue -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="layui/layui.js"></script>
    <script type="text/javascript" src="js/sxl.js"></script>
    <script type="text/javascript" src="js/mui.min.js"></script>
    <script>
		//注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use(['element','table','layer','form','layedit', 'laydate'], function(){
		  var element = layui.element;
		  var table = layui.table;
		  var layer = layui.layer;
		  var form = layui.form;
		  var layedit = layui.layedit
  		  var laydate = layui.laydate;
  		  form.on('select(paybox)', function(data){
			  if(data.value=='3'){
	           $('.crashcard').css('display','block');
	      	}else{
	      		$('.crashcard').css('display','none');
	      	}			  
		});

       });

		$(document).ready(function(){
			//时间
  		    var n;
	        setInterval(getTime,1000);
	        getTime();	        
			var interverPrice = setInterval(priceAll,1000);
			//金额显示结束
			tablebox();
			//餐桌状态
            var interverTabel = setInterval(tableShow,5000);
            //var interverTabel = setInterval(orderShow,3000);
            //商品种类
            category();	
            $('#disnum').blur(function(){
	                var dis = $('#disnum').val();
	                var reg = /^(-?\d+)(\.\d+)?$/;
	                if(!reg.test(dis)||(dis>1||dis<0)){
	                   layer.tips('折扣率输入错误（折扣率在0~1之间，如0.8，不打折输入0）', '#disnum', {
						  tips: [3, 'red']
					   });
	                }
	                $('#disnum').focus();
	       });	
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