<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="css/mui.css">
<link rel="stylesheet" type="text/css" href="css/iconfont.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<style type="text/css">
	.layui-btn-content{
		/*width: 50%;
		margin: 0 auto;*/
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
	}
	#subbtn{
	    margin-left:1%;
	}
</style>
</head>
<body>
	<br>
	<div class="layui-btn-content" style='padding-left:2%;'>
	    <button class="layui-btn" onclick="read_card_select()">刷卡</button>
	    <div class="layui-form-item">
			<div class="layui-input-block"  style="margin-left: 5px">
			  <input type="text" id="cardnum" name="cardnum" placeholder="会员卡号获取" class="layui-input">
			</div>
	    </div>
	    <button id="subbtn" class="layui-btn layui-btn-normal" onclick="submitmsg()">提交</button>
    </div>
    
		<fieldset class="layui-elem-field">
			<legend>会员卡信息</legend>
			<div class="layui-field-box">
				<table class="layui-table">
					  <colgroup>
					    <col width="150">
					    <col width="200">
					    <col>
					  </colgroup>
					  <thead>
					    <tr>
					      <th>会员姓名</th>
					      <th>开卡时间</th>
					      <th>会员卡余额</th>
					      <th>会员卡状态</th>
					    </tr> 
					  </thead>
					  <tbody  id="mebmsg">
					    <tr>
					     <!--  <td>name</td>
					     <td>2016-11-29</td>
					     <td>1314</td> -->
					    </tr>					     
					  </tbody>
				</table>
			</div>
		</fieldset>

		<fieldset class="layui-elem-field">
			<legend>消费记录</legend>
			<div class="layui-field-box">
				<table class="layui-table" id="tablelist">
					<thead>
						<tr>							
							<th>订单编号</th>				 
							<th>消费金额</th>				 
							<th>消费时间</th>				 
							<th>查看详情</th>				 
						</tr>
					</thead>
					<tbody  id="mebOrdermsg">
						<tr>							
							<!-- <td>201810231314</td>								 							  
							<td>1314</td>								 							  
							<td>20181023</td>								 							  
							<td>
								<a href="" class="layui-btn layui-btn-mini">详情</a>
							</td> -->
						</tr>						 
					</tbody>
				</table>				
			
				<!-- <button class="layui-btn" onclick="detail()">测试</button> -->			 
			</div>
		</fieldset>
</body>
<div id="ordetail" style="display: none;">
	<div class="right-middle-middle">
		<ul class="mui-table-view goodslists" id="goodslists">			  
		    <!-- <li class="mui-table-view-cell mui-media">
		        <a href="javascript:;">
		            <div class="mui-media-body">
		                <p class="mui-ellipsis mui-table-view-cell"><span class="title mebTitle">碧螺春</span>
		                	<span class="mui-badge mui-badge-inverted"><span class="mui-ellipsis mebTitle">×<label>1</label>壶</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mui-ellipsis title mebTitle">100.00</span></span>
		                </p>
		            </div>
		        </a>
		    </li>
		    <li class="mui-table-view-cell mui-media">
		        <a href="javascript:;">
		            <div class="mui-media-body">
		                <p class="mui-ellipsis mui-table-view-cell"><span class="title mebTitle">碧螺春</span>
		                	<span class="mui-badge mui-badge-inverted"><span class="mui-ellipsis mebTitle">×<label>1</label>壶</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mui-ellipsis title mebTitle">100.00</span></span>
		                </p>
		            </div>
		        </a>
		    </li>		 -->			     
		</ul>
	</div>
	<div class="right-middle-bottom-pay" style="display: flex;flex-direction:column;justify-content: flex-end;align-items:flex-end;padding-right: 10%">
			<p class="title mebNum">消费总金额:<span class="title mui-ellipsis" id="cmoney">0.00</span></p>
			<p class="title mebNum">实际支付金额:<span class="title mui-ellipsis" id="paymoney">0.00</span></p> 
	</div>
	
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>    
<script src="layui/layui.js"></script>
<script type="text/javascript" src="js/mebmsg.js"></script>
</html>