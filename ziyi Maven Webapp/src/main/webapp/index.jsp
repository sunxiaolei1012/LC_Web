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
 							<li><a href="#item3" class="mui-control-item"><span class="mui-icon iconfont icon-shezhi"></span>系统设置</a></li> 
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
						<div id="item3" class="mui-control-content">
							<div class="middle-center-top">
								<p class="titleName"><span style="font-size:30px;" class="mui-icon iconfont icon-shezhi"></span><span style="font-size: 22px;">&nbsp;系统设置</span>
								</p>								
							</div>
							<div class="middle-center-middle2">
							      <style>
							         #activecard{
							             /* border:1px solid red; */ 
							             margin-top:10%;
							             margin-left:40%; 
							             display:flex;
							             flex-direction:column;
							             justify-content:center;  
							         }
							         #activecard .layui-btn{
							            width:100px;
							            margin-top:10px;
							         }
							     </style> 
							     <div class="" id='activecard'>
							          <p>听到嘀声后连接成功！</p>
									  <button class="layui-btn" onclick="reset_di">点击</button>
									  <p>若没有听到嘀声，请点击重新连接！！！</p>
									  <button class="layui-btn" onclick="reset_reset">重新连接</button>
								</div>						     							     
							
							</div>
						</div>
					
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
								 <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="mebshow()"  class="mui-control-item">会员卡查询</a></li>
								 <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="update_user_password('user_password')" class="mui-control-item">密码修改</a></li>
							</c:if>
<!-- 							管理员 -->
							<c:if test="${user.userrole == 1 }">
							    <li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="mebshow()"  class="mui-control-item">会员卡查询</a></li>
								<li class="mui-table-view-cell"><a href="javascript:void(0);" onclick="update_user_password('user_password')" class="mui-control-item">密码修改</a></li>
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
#layform1 .layui-input-block{
    width:55%;
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
#mebrebate{
  display:none;
}
</style>
   <!-- 支付窗口 -->
	<div id='layform1' style='display:none;'>
		<br>	
		<div id='payformbox'>	 
		<!-- <form class='layui-form' id="payform">
			 <div class='layui-form-item'>
			    <label class='layui-form-label' style='padding-left:0;'>支付方式</label>
			    <div class='layui-input-block'>
				      <select id="selectBox" lay-filter='paybox'>
				        <option value=''></option>
				        <option value='0' name='cash' checked=''>现金</option>
				        <option value='1' name='member'>会员卡</option>
				        <option value='2' name='zhifub'>支付宝</option>
				        <option value='3' name='weixin'>微信</option>
				      </select>
			    </div>			    	
			</div>
			<div class="crashcard">
				<div class="cardbox">
				    <button type="button" id="card" class="mui-btn mui-btn-warning">刷卡</button>
					<div class="layui-form-item" style='width:100%;'>
					    <div class="layui-input-block" style="margin-left:48px;width:63%;">
					      <input type="text" id="meberNum" class="layui-input meberNum">
					    </div>
					</div>												
				</div>
			</div>	
		    <div class='layui-form-item' id='mebrebate'>
			    <label class='layui-form-label' style='padding-left:0;'>是否打折</label>
			    <div class='layui-input-block'>
				      <select id="selectBox1" lay-filter='paybox1'>
				        <option value=''></option>
				        <option value='0' name='ndis'>不打折</option>
				        <option value='1' name='ydis'>打折</option>
				      </select>
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
				    <label class="layui-form-label" style='padding-left:0;'>折扣说明</label>
				    <div class="layui-input-block">
				      <textarea placeholder="请输入内容"  class="layui-textarea" id='textare'></textarea>
				    </div>
			   </div>
	        </div> 			 		 
		</form> -->
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
			<!-- start high -->		     		    	
               <div class="mui-table-view-list" id="rebategs">
			        <!-- goodslist --> 
               </div>		     
               <!-- end high -->               
               <!-- start low -->
                <div class="mui-table-view-list" id="rebategs1">
					<!-- <div class="mui-card pattern-list">				 
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
		            </div>	 -->	          		             
               </div> 
               <!-- end low -->
	    </div>
	</div>
	<!-- end continue -->
    <script type="text/javascript" src="js/jquery.min.js"></script>

    
    <script src="layui/layui.js"></script>
    <script type="text/javascript" src="js/chen.js"></script>
    <script type="text/javascript" src="js/sxl.js"></script>
    <script type="text/javascript" src="js/mui.min.js"></script>
    <script type="text/javascript" src="js/mebmsg.js"></script>
    <script>
    layui.use(['element','table','layer','form','layedit', 'laydate','laypage'], function(){
		var element = layui.element;
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var layedit = layui.layedit
  		var laydate = layui.laydate; 
		var laypage = layui.laypage;
		laypage.render({
		    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
		    ,count: 50 //数据总数，从服务端得到
		    ,limit:10
		  });
    });
    
    //会员卡查询框
function mebshow(){
	layer.open({
		title:'会员卡信息',
		type: 2,
		shade: false,
		closeBtn:1,      //按钮位置
        anim: 1,         //弹窗弹出动画
        maxmin:true,
        fixed:true,
		skin: 'layui-layer-molv', //加上边框
		area: ['800px', '600px'], //宽高
		content: 'mebcard.jsp',   //引入html内容		 
	});
}
    
		/* //注意：导航 依赖 element 模块，否则无法进行功能性操作
		layui.use(['element','table','layer','form','layedit', 'laydate'], function(){
		  var element = layui.element;
		  var table = layui.table;
		  var layer = layui.layer;
		  var form = layui.form;
		  var layedit = layui.layedit
  		  var laydate = layui.laydate;
  		  form.on('select(paybox)', function(data){
			  if(data.value=='1'){
	           $('.crashcard').css('display','block');
	      	  }else{
	      		$('.crashcard').css('display','none');
	      	  }			  
		  });
          form.on('select(paybox1)', function(data){
			  if(data.value=='1'){
	           $('.discounts').css('display','block');
	      	  }else{
	      		$('.discounts').css('display','none');
	      	  }			  
		  });
       });
 */
		/* $(document).ready(function(){
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
                   layer.tips('折扣率输入错误（折扣率在0~1之间，如0.8，不打折输入1）', '#disnum', {
					  tips: [3, 'red'],time:3000
				   });
                }	                
	        });	
        }); */
		/* mui('.mui-scroll-wrapper').scroll({
			 scrollY: true, //是否竖向滚动
			 scrollX: false, //是否横向滚动		 
			 indicators: true, //是否显示滚动条
			 deceleration:0.0006, //阻尼系数,系数越小滑动越灵敏
			 bounce: true //是否启用回弹
			}); */
    </script>
</html>