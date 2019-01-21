<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="description" content="" />
<title>网站公司认证计费系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="fonts/FontAwesome/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/Animation.css" rel="stylesheet" type="text/css">
<link href="css/product.css" rel="stylesheet" type="text/css">
<link href="css/slider.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.zoombie.js" type="text/javascript" ></script>
<script src="js/common.js" type="text/javascript"></script>
<script src="js/slider.js" type="text/javascript"></script>
<script src="js/html5.js" type="text/javascript"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/wow.min.js" type="text/javascript"></script>
    <script type="text/javascript">
	
    var wow = new WOW({
        boxClass: 'wow',
        animateClass: 'animated',
        offset: 0,
        mobile: false,
        live: true
    });
    wow.init();
		$(function(){$("#img_02").imageLens({ lensSize: 300 });});
		/***放大镜***/	
    </script>
<!--[if lt IE 9]>
	  <script src="js/html5shiv.min.js"></script>
	  <script src="js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
<header class="navbar-fixed-top headerbg">
 <div class="container-fluid">
   <div class="logo"><a href="index.html"><img src="images/logo.png" alt=""></a></div>
   <div class="navBox hidden-xs hidden-sm">
   	<ul class="navList list-unstyled">
   	 <li class="navLi">
       <h3><a href="index.html"><span>首页</span></a></h3>
      </li>
       	<li class="navLi on">
                	<h3><a href="product.html"><span>产品中心</span></a></h3>
                    <div class="navSub">
                    	<ul class="navSubList list-unstyled">
                        	<li class="navSubLi">
                            	<h4><a href="Product_into1.html">● 网站公司认证计费系统</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Product_into.html">● 网站公司tv系统</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Product_into2.html">● 软件路由系统</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Product_into3.html">● 网站公司缓存系统</a></h4>
                            </li>
                            <li class="navSubLi">
                            	<h4><a href="Product_into4.html">● 网站公司智慧机房</a></h4>
                            </li>
                            <li class="navSubLi">
                            	<h4><a href="Product_into5.html">● 网站公司硬件产品</a></h4>
                            </li>
                        </ul>
                    </div>
            </li>
       <li class="navLi">
       <h3><a href="Tutorial.html"><span>教程中心</span></a></h3>
               <div class="navSub">
                    	<ul class="navSubList list-unstyled">
                        	<li class="navSubLi">
                            	<h4><a href="#">● 计费产品对接</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 安装教程</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 网络技术教程</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● tv教程</a></h4>
                            </li>
     
                        </ul>
                    </div>
      </li>
       <li class="navLi">
       <h3><a href="Case.html"><span>产品案例</span></a></h3>
              <div class="navSub">
                    	<ul class="navSubList list-unstyled">
                        	<li class="navSubLi">
                            	<h4><a href="#">● 酒店</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 社区</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 商务</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 小区</a></h4>
                            </li>
     
                        </ul>
                    </div>
      </li>
       <li class="navLi">
       <h3><a href="Dynamic.html"><span>公司动态</span></a></h3>
      </li>
       <li class="navLi">
       <h3><a href="Program.html"><span>解决方案</span></a></h3>
             <div class="navSub">
                    	<ul class="navSubList list-unstyled">
                        	<li class="navSubLi">
                            	<h4><a href="#">● 点播直播解决方案</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 宽带运营解决方案</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 运营商tv解决方案</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 酒店TPTV解决方案</a></h4>
                            </li>
     
                        </ul>
                    </div>
      </li>
       <li class="navLi">
       <h3><a href="Company.html"><span>关于我们</span></a></h3>
        <div class="navSub">
                    	<ul class="navSubList list-unstyled">
                        	<li class="navSubLi">
                            	<h4><a href="Company.html">● 公司简介</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Contact.html">● 联系方式</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Pay_by.html">● 支付方式</a></h4>
                            </li>
                        </ul>
                    </div>
      </li>
	</ul >
   </div>
   <div class="header_phone">
   	<div class="icon_phone pt5 fl"><img src="images/icon_phone.png"></div>
   	<div class="phone fl">
   		<h4>服务咨询热线：</h4>
   		<h2>0536-11111111</h2>
   	</div>
   </div>
 </div>
</header>
<!--认证计费系统界面样式-->
<div class="product_details">
   <!--顶部广告样式-->
    <div class="bannerN animated jf_system">
	 <div class="imgFull"><img src="images/bg11.jpg" class="img-responsive"></div> 
    <h2 class="banH2 wow fadeInUp"><img src="presentimg/jf-wenzi.png" alt="" style="margin-bottom: 30px;"><img src="presentimg/jf-bg.png"></h2>

    <div class="product_title wow fadeInUp">     
      <h2 class="mb20 system_title">网站公司认证计费系统</h2>
     <h5 class="wow fadeInUp  system_info">随着相关政策的开放，越来越多的民营资本进入宽带运营市场。随之宽带企业的发展，用户越来越多，相应的套餐政策也越来越多。市场上一些简单功能不全或者来自国外破解的一些计费系统既不符合企业需求也不符合国情，更不能企业的市场运营行为提供强有力的支撑。这里有一个很大的误区，很多客户认为路由或者流控是宽带企业的核心，实则恰恰相反；</h5>
     <div class="Demo_address">
     	<p>前台演示地址：<a href="http://tmos.cn:802">http://tmos.cn:802</a></p>
     	<p>后台演示地址：<a href="http://tmos.cn:802/admin  ">http://tmos.cn:802/admin  </a></p>
     	<p>登陆账号密码：guest/guest</p>
     </div>
     </div>
    	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
  </div>
</div>
</div>
<!--具体内容样式-->
<div class="jf_System_content">
	<div class="hd title_name mtb40">
		<ul class="container">
			<li><a href="#">产品介绍</a></li><li><a href="#">报价与支持</a></li><li><a href="#">更新下载</a></li>
		</ul>
	</div>
	<div class="bd">
		<div class="present">
			<div class="container ">
				<div class="present_info mtb30">
					 随着相关政策的开放，越来越多的民营资本进入宽带运营市场。随之宽带企业的发展，用户越来越多，相应的套餐政策也越来越多。市场上一些简单功能不全或者来自国外破解的一些计费系统既不符合企业需求也不符合国情，更不能企业的市场运营行为提供强有力的支撑。这里有一个很大的误区，很多客户认为路由或者流控是宽带企业的核心，实则恰恰相反；国内三大运营商投资最多的刚好是认证计费系统，任何一家运营商都有多如牛毛的业务套餐，不同套餐之间的转换，费用的计算，用户的管理，结算管理等。市场营销行为要基于认证计费系统的支撑，例如你要做一个套餐，20兆宽带包年500元，包两年则为900元，包三年则为1100元。政策制定好，你还有认证计费系统来执行这个政策。用户上网行为习惯的分析也是计费系统中一个不可或缺的功能，企业需要知道，哪些用户在哪些时间段用量大，哪些时间段用量小。哪些客户出现了频繁掉线等数据。有了这些数据才能更好的为路由策略做支撑。网站公司认证计费系统就是专为解决这些问题而生。 
				</div>
				<!--图文介绍-->
				<div class="clearfix tuwen wow fadeInUp mb40">
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft">
						<h2 class="color4 text-center mtb20"><b>系统前台显示</b></h2>
						<h5 class="padding10 line-height26">
							 随着相关政策的开放，越来越多的民营资本进入宽带运营市场。随之宽带企业的发展，用户越来越多，相应的套餐政策也越来越多。市场上一些简单功能不全或者来自国外破解的一些计费系统既不符合企业需求也不符合国情，更不能企业的市场运营行为提供强有力的支撑。这里有一个很大的误区，很多客户认为路由或者流控是宽带企业的核心，实则恰恰相反；国内三大运营商投资最多的刚好是认证计费系统，任何一家运营商都有多如牛毛的业务套餐，不同套餐之间的转换，费用的计算，用户的管理，结算管理等。市场营销行为要基于认证计费系统的支撑，
						</h5>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInRight"><img src="presentimg/jf-p_15.png" alt="" width="100%"> </div>
				</div>
				<div class="clearfix tuwen wow fadeInUp mb40">
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft"><img src="presentimg/jf-p_18.png" alt="" width="100%"> </div>
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInRight">
						<h2 class="color5 text-center mtb20"><b>系统首页</b></h2>
						<h5 class="padding10 line-height26">
							 随着相关政策的开放，越来越多的民营资本进入宽带运营市场。随之宽带企业的发展，用户越来越多，相应的套餐政策也越来越多。市场上一些简单功能不全或者来自国外破解的一些计费系统既不符合企业需求也不符合国情，更不能企业的市场运营行为提供强有力的支撑。这里有一个很大的误区，很多客户认为路由或者流控是宽带企业的核心，实则恰恰相反；国内三大运营商投资最多的刚好是认证计费系统，任何一家运营商都有多如牛毛的业务套餐，不同套餐之间的转换，费用的计算，用户的管理，结算管理等。市场营销行为要基于认证计费系统的支撑，
						</h5>
					</div>
				</div>
			</div>
			<!---->
			<div><img src="presentimg/jf-bg15.png" width="100%"></div>
			<div class="bacolor8 padding">
				<div class="container clearfix ">
					<div class="col-xs-12 col-sm-7 col-md-7 inherit">
						<img id="img_02" src="presentimg/1484886602820788.png" alt="" width="100%" height="350"/>
					</div>
					<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInRight">
						<h2 class="text-center mtb20 color7"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color7">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
						<div class="data clearfix mtb30">
							<div class="data_name"><h4 class="fa fa-users"></h4><h2><b class="timer count-title"  id="count-number" data-to="4000" data-speed="2500">4000</b>+</h2></div>
							<div class="data_name"><h4 class="fa fa-users"></h4><h2><b class="timer count-title"  id="count-number" data-to="200" data-speed="2500">200</b>+</h2></div>
							<div class="data_name"><h4 class="fa fa-users"></h4><h2><b class="timer count-title"  id="count-number" data-to="40" data-speed="2500">40</b>+</h2></div>
							<div class="data_name"><h4 class="fa fa-users"></h4><h2><b class="timer count-title"  id="count-number" data-to="50" data-speed="2500">50</b>+</h2></div>
						</div>
					</div>
				</div>	
			</div>
			<div class="container">
				<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInLeft">
						<h2 class="text-center mtb20 color6"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color6">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInRight">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/>
					</div>
				</div>
				<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInLeft">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/></div>
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInRight">
						<h2 class="text-center mtb20 color1"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color6">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
				</div>
					<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInLeft">
						<h2 class="text-center mtb20 color6"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color6">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInRight">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/>
					</div>
				</div>
				<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInLeft">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/></div>
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInRight">
						<h2 class="text-center mtb20 color1"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color6">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
				</div>
			</div>
			<div style="background:url(presentimg/bg.jpg) center; width: 100%; padding: 20px 0px;">
				<div class="container">
							<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInLeft">
						<h2 class="text-center mtb20 color7"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color7">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInRight">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/>
					</div>
				</div>
				</div>
			</div>
			<div class="container">
						<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInLeft">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/></div>
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInRight">
						<h2 class="text-center mtb20 color1"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color6">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
				</div>
					<div class="mtb30 clearfix">
						<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInLeft">
						<h2 class="text-center mtb20 color6"><b>详尽的用户管理功能</b></h2>
						<h5 class="line-height26 color6">软件名称（网站公司）认证计费系统拥有最完善的用户管理功能，用户账号、姓名、电话、交费时间、计费时间、到期时间、IP、所在Bras、快捷操作；同一页面内数据全部展现。</h5>
					</div>
						<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInRight">
						<img  src="presentimg/jf-p_21.png" alt="" width="100%"/>
					</div>
				</div>
			</div>
			<div style="background: url(presentimg/js-app_02.png) no-repeat center; width: 100%; height: 646px; position: relative; margin-top: 100px;">
				<div class="container relative">
			    <div class="wow fadeInLeft">
				    <div style=" margin-top: 60px; margin-bottom: 30px;"><img src="presentimg/wenben.png"></div>
				    <h2 class="color7"> 唯一提供手机APP的计费系统</h2>
				    <h5  style="width: 500px; line-height: 26px; color: #ffffff; margin: 30px 0px"> 软件名称是国内唯一提供手机客户端的认证计费系统，通过手机客户端，不管是系统管理员还是装维人员都可以轻松的管理计费系统数据。app客户端还提供了位置服务，客服人员可以方便的把就近的故障指派给就近的装维人员处理。手机客户端也支持主动故障判断系统和模型系统的查询，有了这些数据装维人员判断链路故障将变得事半功倍。</h5><div class="clearfix">
					<div style="float: left; margin: 0px 20px; text-align: center; color: #ffffff; width: 150px;"><img src="presentimg/icontu_29.png" alt=""><h4>苹果端</h4></div>
					<div style="float:left; margin: 0px 20px; text-align: center; color: #ffffff;width: 150px;"><img src="presentimg/icontu_31.png" alt=""><h4>安卓端</h4></div>
					</div></div>
					<p style=" position: absolute; width: 572px; height: 740px; right:0px ;top:-94px;"><img src="presentimg/jp-app_img.png"></p>
					
				</div>
			</div>
		</div>
		<div class="present">
			<div class="container">
				<div class="mtb40">
					<h2 class="color1 text-center"><b>软件名称认证计费系统授权类型及价格</b></h2>
					<div class="mtb30">
						<table class="table table-bordered table-striped" >
							<thead><tr><th class="text-center">版本</th><th class="text-center">授权用户数</th><th class="text-center">备注信息</th><th class="text-center">报价</th></tr></thead>
							<tbody>
								<tr><td>软件名称标准版</td><td>1000</td><td>最大可管理用户数1000，无手机客户端，无增强驱动</td><td>3000元</td></tr>
								<tr><td>软件名称标准版</td><td>1000</td><td>无限用户数量，无手机客户端，无增强驱动适合于低于8000用户的环境</td><td>3000元</td></tr>
								<tr><td>软件名称标准版</td><td>1000</td><td>最大可管理用户数1000，无手机客户端，无增强驱动</td><td>3000元</td></tr>
								<tr><td>软件名称标准版</td><td>1000</td><td>最大可管理用户数1000，无手机客户端，无增强驱动</td><td>3000元</td></tr>
								<tr><td>软件名称标准版</td><td>1000</td><td>最大可管理用户数1000，无手机客户端，无增强驱动</td><td>3000元</td></tr>
								<tr><td>软件名称标准版</td><td>1000</td><td>最大可管理用户数1000，无手机客户端，无增强驱动</td><td>3000元</td></tr>
							</tbody>
						</table>	
					</div>
				</div>
				<!--系统配置-->
				<div class="Configuration">
					<span class="Configuration_img"><img src="presentimg/jbg_03.png"></span>
					<div style=" margin-left: 400px;">
						<ul style=" width: 360px; line-height: 40px; font-size: 18px; float: left;">
							<li style=" font-size: 24px;  color: #E83033; font-weight: bold">建议配置</li>
							<li>处理器	intel E5645/L5640处理器*2</li>
							<li>内存	64G以上</li>
							<li>硬盘	128G以上固态硬盘</li>
							<li>网卡	intel 82580/i350/82599网卡</li>
							<li>推荐服务器	Dell R610/710</li>
						</ul>
						<ul style="width: 400px; line-height: 40px; font-size: 18px; float: right;">
							<li style=" font-size: 24px;  color: #E83033; font-weight: bold">建议配置</li>
							<li>处理器	intel E5520/L5410以上处理器支持64位</li>
							<li>内存	64G以上</li>
							<li>硬盘	128G以上固态硬盘</li>
							<li>网卡	intel 82580/i350/82599网卡</li>
							<li>推荐服务器	Dell R610/710</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="present">
			<div class="container">
				<div class="mtb40 clearfix">
				<div class="description">为避免其他用户下载测试版，即日起不在提供v4测试版下载，已经升级v4的客户将采用系统内部推送更新的方式提供</div>
				<div class="Update_list" id="timeline">
				<div class="year_style"><div class="date_Update"><h3>2017</h3><h4>年</h4></div></div>
			    <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
				<div class="Update_time">2017-10-1</div>
					<h4>软件名称 tv系统v4 7.1Bate12（内部版本号0914）</h4>
					<div class="padding10 line-height26">
					<p><em class="">☆ </em>新增主动视频缓存系统用于代替原视频采集模块（原点播采集模块不在使用近期将停止更新）（该功   能需将原有点播采集插件更换为主动缓存插件）</p>
						<p><em class="">☆ </em>新增纯直播换台图片广告功能（需配合v4版纯直播APK）</p>
						<p><em class="">☆ </em> 调整APK广告管理位置，新增一个客户端广告管理模块（纯直播版系统也支持广告了）</p>
						<p><em class="">☆ </em>修复节目单列表中修改排序、专家模式、选择所有三个功能只能选择当前页的bug</p>
						<p><em class="">☆ </em>修复设置频道定时重启引起节目源反复重启的bug</p>
						<p><em class="">☆ </em> 更新直播编码模块守护模块增加几个进程僵死的应对策略</p>
						<p><em class="">☆ </em> 修复节目源管理中新增节目源无法保存的bug</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						 <div class="operating"><a href="#" class="btn btn-danger">下载最新版</a></div>
					</div>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
				<div class="Update_time">2017-10-1</div>
					<h4>软件名称 tv系统v4 7.1Bate12（内部版本号0914）</h4>
					<div class="padding10 line-height26">
					<p><em class="">☆ </em>新增主动视频缓存系统用于代替原视频采集模块（原点播采集模块不在使用近期将停止更新）（该功   能需将原有点播采集插件更换为主动缓存插件）</p>
						<p><em class="">☆ </em>新增纯直播换台图片广告功能（需配合v4版纯直播APK）</p>
						<p><em class="">☆ </em> 调整APK广告管理位置，新增一个客户端广告管理模块（纯直播版系统也支持广告了）</p>
						<p><em class="">☆ </em>修复节目单列表中修改排序、专家模式、选择所有三个功能只能选择当前页的bug</p>
						<p><em class="">☆ </em>修复设置频道定时重启引起节目源反复重启的bug</p>
						<p><em class="">☆ </em> 更新直播编码模块守护模块增加几个进程僵死的应对策略</p>
						<p><em class="">☆ </em> 修复节目源管理中新增节目源无法保存的bug</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						 <div class="operating"><span class="color2">已经升级到v4的客户请尽快更新该版本，使用v3的客户请等待v4正式版发布</span></div>
					</div>
				</div>
			 </div>
			     <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
				<div class="Update_time">2017-10-1</div>
					<h4>软件名称 tv系统v4 7.1Bate12（内部版本号0914）</h4>
					
					<div class="padding10 line-height26">
					<p><em class="">☆ </em>新增主动视频缓存系统用于代替原视频采集模块（原点播采集模块不在使用近期将停止更新）（该功   能需将原有点播采集插件更换为主动缓存插件）</p>
						<p><em class="">☆ </em>新增纯直播换台图片广告功能（需配合v4版纯直播APK）</p>
						<p><em class="">☆ </em> 调整APK广告管理位置，新增一个客户端广告管理模块（纯直播版系统也支持广告了）</p>
						<p><em class="">☆ </em>修复节目单列表中修改排序、专家模式、选择所有三个功能只能选择当前页的bug</p>
						<p><em class="">☆ </em>修复设置频道定时重启引起节目源反复重启的bug</p>
						<p><em class="">☆ </em> 更新直播编码模块守护模块增加几个进程僵死的应对策略</p>
						<p><em class="">☆ </em> 修复节目源管理中新增节目源无法保存的bug</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						 <div class="operating"><a href="#" class="btn btn-danger">下载最新版</a></div>
					</div>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
				<div class="Update_time">2017-10-11</div>
					<h4>软件名称 tv系统v4 7.1Bate12（内部版本号0914）</h4>
					<div class="padding10 line-height26">
					<p><em class="">☆ </em>新增主动视频缓存系统用于代替原视频采集模块（原点播采集模块不在使用近期将停止更新）（该功   能需将原有点播采集插件更换为主动缓存插件）</p>
						<p><em class="">☆ </em>新增纯直播换台图片广告功能（需配合v4版纯直播APK）</p>
						<p><em class="">☆ </em> 调整APK广告管理位置，新增一个客户端广告管理模块（纯直播版系统也支持广告了）</p>
						<p><em class="">☆ </em>修复节目单列表中修改排序、专家模式、选择所有三个功能只能选择当前页的bug</p>
						<p><em class="">☆ </em>修复设置频道定时重启引起节目源反复重启的bug</p>
						<p><em class="">☆ </em> 更新直播编码模块守护模块增加几个进程僵死的应对策略</p>
						<p><em class="">☆ </em> 修复节目源管理中新增节目源无法保存的bug</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						 <div class="operating"><span class="color1">已经升级到v4的客户请尽快更新该版本，使用v3的客户请等待v4正式版发布</span></div>
					</div>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
				<div class="Update_time">2017-10-11</div>
					<h4>软件名称 tv系统v4 7.1Bate12（内部版本号0914）</h4>
					<div class="padding10 line-height26">
					<p><em class="">☆ </em>新增主动视频缓存系统用于代替原视频采集模块（原点播采集模块不在使用近期将停止更新）（该功   能需将原有点播采集插件更换为主动缓存插件）</p>
						<p><em class="">☆ </em>新增纯直播换台图片广告功能（需配合v4版纯直播APK）</p>
						<p><em class="">☆ </em> 调整APK广告管理位置，新增一个客户端广告管理模块（纯直播版系统也支持广告了）</p>
						<p><em class="">☆ </em>修复节目单列表中修改排序、专家模式、选择所有三个功能只能选择当前页的bug</p>
						<p><em class="">☆ </em>修复设置频道定时重启引起节目源反复重启的bug</p>
						<p><em class="">☆ </em> 更新直播编码模块守护模块增加几个进程僵死的应对策略</p>
						<p><em class="">☆ </em> 修复节目源管理中新增节目源无法保存的bug</p>
						<p><em class="">☆ </em> 发布v4版纯直播APK，支持APK启动logo广告、滚动字幕广告、换台图片广告（可设置显示位置 图片大小 展示时间）</p>
						 <div class="operating"><span class="color3">已经升级到v4的客户请尽快更新该版本，使用v3的客户请等待v4正式版发布</span></div>
					</div>
				</div>
			 </div>
			</div>
		  </div>
				
			</div>
		</div>
	</div>
</div>
<script>
jQuery(".jf_System_content").slide({mainCell:".bd ",trigger:"click",delayTime:0});
		
</script>
<footer class="footerBg">
  	<div class="container">
  		<div class="ptb40">
  			<div class="footTopL">
  				<dl class="clearfix">
  				<dt>关于我们</dt>
  				<dd><a href="#">联系地址</a></dd>
  				<dd><a href="#">公司介绍</a></dd>
  				<dd><a href="#">荣誉资质</a></dd>
  				<dd><a href="#">招聘信息</a></dd>
  				</dl>
  				<dl class="clearfix">
  				<dt >公司产品</dt>
  				<dd><a href="#">网站公司认证计费系统</a></dd>
  				<dd><a href="#">网站公司tv系统</a></dd>
  				<dd><a href="#">软件路由系统</a></dd>
  				<dd><a href="#">网站公司缓存系统</a></dd>
  				<dd><a href="#">网站公司智慧机房</a></dd>
  				<dd><a href="#">网站公司硬件产品</a></dd>
  				</dl>
  				<dl class="clearfix">
  				<dt>教程中心</dt>
  				<dd><a href="#">计费产品对接</a></dd>
  				<dd><a href="#">安装教程</a></dd>
  				<dd><a href="#">网络技术教程</a></dd>
  				<dd><a href="#">tv教程</a></dd>
  				</dl>
  				<dl class="clearfix">
  				<dt>解决方案</dt>
  				<dd><a href="#">点播直播解决方案</a></dd>
  				<dd><a href="#">宽带运营解决方案</a></dd>
  				<dd><a href="#">运营商tv解决方案</a></dd>
  				<dd><a href="#">酒店TPTV解决方案</a></dd>
  				</dl>
  				
  			</div>
  			<div class=" center weixin"><img src="images/weixing-ma.jpg"><h5>微信关注我们</h5></div>
  		</div>
  	</div>
  	<div class="CopyRight">
  		<div class="container"><span class="footer_logo"><img src="images/footer_logo.png"></span><span class="CopyRight_name">CopyRight 软件名称 2016 版权所有 鲁ICP备xxxxxxxxx</span></div>
  	</div>
  </footer>
  <div class="cndns-right">
    <div class="cndns-right-meau meau-sev">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe901;</span>
            <p>
                在线<br />
                客服
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <span class="demo-icon">&#xe901;</span>
                    <p>在线客服<i>服务时间：9:00-24:00</i></p>
                    <div class="clear"></div>
                </div>
                <div class="sev-b">
                    <h4>选择下列产品马上在线沟通：</h4>
                    <ul id="zixunUl">
                        <li><a href="javascript:void(0);">客服1</a></li>
                        <li><a href="javascript:void(0);">客服2</a></li>
                        <li><a href="javascript:void(0);">产品经理</a></li>
                        <li><a href="javascript:void(0);">技术支持</a></li>
                        <li><a href="javascript:void(0);">技术支持1</a></li>
                        <li><a href="javascript:void(0);">橙云主机</a></li>
                        <li><a href="javascript:void(0);">产品交易</a></li>      
                        <li><a href="javascript:void(0);">其他产品</a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-contact">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe902;</span>
            <p>
                客服<br />
                热线
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <span class="demo-icon">&#xe902;</span>
                    <p>400-123-4567<br /><i>7*24小时客服服务热线</i></p>
                    <div class="clear"></div>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-code">
        <a href="javascript:" class="cndns-right-btn">
            <span class="demo-icon">&#xe903;</span>
            <p>
                关注<br />
                微信
            </p>
        </a>
        <div class="cndns-right-box">
            <div class="box-border">
                <div class="sev-t">
                    <img src="images/weixing-ma.jpg" />
                    <i>关注官方微信</i>
                </div>
                <span class="arrow-right"></span>
            </div>
        </div>
    </div>
    <div class="cndns-right-meau meau-top" id="top-back">
        <a href="javascript:" class="cndns-right-btn" onclick="topBack()">
            <span class="demo-icon">&#xe904;</span>
            <i>顶部</i>
        </a>
    </div>
</div>
</body>
</html>

