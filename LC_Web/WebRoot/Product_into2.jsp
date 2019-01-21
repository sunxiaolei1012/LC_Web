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
<title>网站公司智慧机房</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="fonts/FontAwesome/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/Animation.css" rel="stylesheet" type="text/css">
<link href="css/product.css" rel="stylesheet" type="text/css">
<link href="css/slider.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
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
<!--内容信息-->
 <div class="product_details">
	 <div class="bannerN animated bannerpro3">
	   <div class="container relative hidden-sm clearfix">
	    <div class="imgFull"><img src="images/bg11.jpg" class="img-responsive"></div> 
 	      <div class="ban1Line">
			<div class="ban1Line1 ban"><img src="images/banner_07.png"></div>
			<div class="ban1Line2 ban"><img src="images/banner_10.png"></div>
			<div class="ban1Line3 ban"><img src="images/banner_15.png"></div>
			<div class="router_img"><img src="presentimg/lybg_03.png"></div>
		   </div>
    <div class="product_title wow fadeInUp jf_system">     
      <h2 class="mb20 system_title"><img src="presentimg/lulogo_03.png" alt="" ></h2>
     <h5 class="wow fadeInUp Description mb30">随着相关政策的开放，越来越多的民营资本进入宽带运营市场。随之宽带企业的发展，用户越来越多，相应的套餐政策也越来越多</h5>
     <p class="Description fonbt-size18 line-height30">综合盘路管理、VPN服务、多线路负载均衡</p>
     </div>
	</div>  	
	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
  </div>
  </div>

<!--具体内容信息-->
<div class="container">
	<div class="mtb40 routing_style">
		<div class="clearfix present">
			<div class="col-xs-12 col-sm-7 col-md-7 wow fadeInRight line-height26">
				<p><b class="color1 fonbt-size18">软件（以下简称sssOS）</b>是我们在成功发布网站公司系列产品后开启的全新品牌。从产品线的规划中不难看出，网站公司品牌的所有产品均为旁路设备（认证计费  缓存  tv  VOD都属于旁路设备）；而sssOS则是我们针对整个机房系统中推出的主路产品品牌（主路设备分为顶层NAT路由、BRAS、流控等）。</p> 
				<p>&nbsp;&nbsp; sssOS路由系统采用最新的64位Linux作为基础架构，结合中小运营商对路由产品和BRAS产品的需求开发。真正做到高性能NAT转发、超强BRAS（PPPOE Server）承载能力、更符合运营商实际需求的功能定义、以及简单易懂的UI；sssOS的UI在开发之初我们就考虑到了易用性，没有生涩难懂的专业词汇，普通人经过一两个小时的摸索就可熟悉sssOS的全部功能轻松构建主路网络。</p>
				<p>&nbsp;&nbsp;&nbsp; 中国学者钱学森认为：系统是由相互作用相互依赖的若干组成部分结合而成的，具有特定功能的有机整体，而且这个有机整体又是它从属的更大系统的组成部分。英文中系统（system）一词来源于古代希腊文（systεmα）意为部分组成的整体。系统的定义应该包含一切系统所共有的特性。一般系统论创始人贝塔朗菲定义：“系统是相互联系相互作用的诸元素的综合体”[2]。这个定义强调元素间的相互作用以及系统对元素的整合作用。可以表述为：定义1.如果对象集S满足下列两个条件

（1）S中至少包含两个不同元素

（2）S中的元素按一定方式相互联系

则称S为一个系统，S的元素为系统的组分。

这个定义指出了系统的三个特性：一多元性，系统是多样性的统一，差异性的统一。二相关性，系统不存在孤立元素组分，所有元素或组分间相互依存、相互作用、相互制约。三整体性，系统是所有元素构成的复合统一整体。这个定义说明了一般系统的基本特征，将系统与非系统区别开来，但对于定义复杂系统有着局限性。另外严格意义上现实世界的“非系统”是不存在的，构成整体的而没有联系性的多元集是不存在的。对于一些群体中元素间联系微弱，从而可以忽略这种联系，我们把它视为二类非系统。</p>
				
			</div>
			<div class="col-xs-12 col-sm-5 col-md-5 wow fadeInRight"><img src="presentimg/luyou_03.png" width="100%"></div>
		</div>
		
			<div class="title_name clearfix mtb40">
				<div class="col-xs-12 col-sm-3 col-md-3 name text-center">
					<h2 class="color8 mb10"><b>功能介绍</b></h2>
					<h3 class="color4">FEATUEES</h3>
				</div>
				<div class="col-xs-12 col-sm-9 col-md-9 title_des">
				为了满足运营商的需求sssOS系统具有非常高的部署自由度，可以与市场上任何其他设备进行对接。例如对接计费系统、缓存系统、流控系统、上联的vlan交换机、核心交换机、下联的OLT等设备均能完美对接。 </div>
			</div>
		
				<div class="clearfix tuwen wow fadeInUp mb40">
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft">
						<h2 class="color4 text-center mtb20"><b> 高能性能NAT转发  </b></h2>
						<h5 class="padding10 line-height26">
							 随着相关政策的开放，越来越多的民营资本进入宽带运营市场。随之宽带企业的发展，用户越来越多，相应的套餐政策也越来越多。市场上一些简单功能不全或者来自国外破解的一些计费系统既不符合企业需求也不符合国情，更不能企业的市场运营行为提供强有力的支撑。这里有一个很大的误区，很多客户认为路由或者流控是宽带企业的核心，实则恰恰相反；国内三大运营商投资最多的刚好是认证计费系统，任何一家运营商都有多如牛毛的业务套餐，不同套餐之间的转换，费用的计算，用户的管理，结算管理等。市场营销行为要基于认证计费系统的支撑，
						</h5>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInRight"><img src="presentimg/LUYOU_07.png" alt="" width="100%"> </div>
				</div>
					<div class="clearfix tuwen wow fadeInUp mb40">
					<div class="col-xs-12 col-sm-4 col-md-4 wow fadeInLeft"><img src="presentimg/LUYOU_10.png" alt="" width="100%"> </div>
					<div class="col-xs-12 col-sm-8 col-md-8 wow fadeInRight">
						<h2 class="color5 text-center mtb20"><b>多线路负载均衡  </b></h2>
						<h5 class="padding10 line-height30 fonbt-size18">
							 中国学者钱学森认为：系统是由相互作用相互依赖的若干组成部分结合而成的，具有特定功能的有机整体，而且这个有机整体又是它从属的更大系统的组成部分。英文中系统（system）一词来源于古代希腊文（systεmα）意为部分组成的整体。系统的定义应该包含一切系统所共有的特性。一般系统论创始人贝塔朗菲定义：“系统是相互联系相互作用的诸元素的综合体”[2]。这个定义强调元素间的相互作用以及系统对元素的整合作用。可以表述为：定义1.如果对象集S满足下列两个条件

（1）S中至少包含两个不同元素

（2）S中的元素按一定方式相互联系

则称S为一个系统，S的元素为系统的组分。

这个定义指出了系统的三个特性：一多元性，系统是多样性的统一，差异性的统一。二相关性，系统不存在孤立元素组分，所有元素或组分间相互依存、相互作用、相互制约。三整体性，系统是所有元素构成的复合统一整体。这个定义说明了一般系统的基本特征，将系统与非系统区别开来，但对于定义复杂系统有着局限性。另外严格意义上现实世界的“非系统”是不存在的，构成整体的而没有联系性的多元集
						</h5>
					</div>
				</div>
				<div class="clearfix tuwen wow fadeInUp mb40">
					<div class="col-xs-12 col-sm-9 col-md-9 wow fadeInRight background1" >
						<h2 class="color1 mtb20"><b>WAN口多播组合模式    </b></h2>
						<h5 class="padding10 line-height30 fonbt-size18">
							 sssOS系统支持多种WAN口接入方式，可以灵活接入多种不同的外网带宽资源。单WAN多播（无需依赖vlan交换机扩wan）模式、vlan多播模式、单wan多固定IP模式、vlan多IP模式。不论采用那种方式，sssOS都提供了线路检测服务，自动检测线路状态，发现某条线路离线自动移除均衡组。我们还提供了路由表分流和域名分流功能，配合策略路由可以实现联通走联通 电信走电信；不同域名走不同线路（例如所有视频网站走专用线路）。
						</h5>
					</div>
				</div>
				<div class="clearfix tuwen wow fadeInUp mb40">
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft">
						<h2 class="color4 text-center mtb20"><b> PPPOE Server    </b></h2>
						<h5 class="padding10 line-height26">
							  sssOS提供了最完善的PPPOE Server；支持本地认证、web认证、第三方radius计费认证。配合网站公司认证计费系统还能发挥出系统的最大优势。采用标准的radius协议设计，支持由计费下发IP、下发地址池、下发地址池名。地址池服务中sssOS提供了快速创建地址池的功能；不同套餐分配不同地址池，配合Panabit等流控系统可以做通道限速功能（通道限速是只针对某一地址池或者多个地址池的用户进行不同应用的不同限速模式）。限速白名单功能可以在计费下发限速的同时针对旁路设备进行不限速处理，例如针对缓存系统  tv系统 VOD系统等旁路设备不限速从而达到更好的用户体验效果。
						</h5>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInRight"><img src="presentimg/LUYOU_15.png" alt="" width="100%"> </div>
				</div>
	</div>
</div>
<div style="background: #19d7f3; height: 400px; padding: 40px 0px; color: #ffffff; line-height: 30px; position: relative; width: 100%">
<div class="container">
	<h2 class="text-center mb40"><b>通知推送&广告推送  </b></h2>
	<h5 class="line-height30 mtb50">中国学者钱学森认为：系统是由相互作用相互依赖的若干组成部分结合而成的，具有特定功能的有机整体，而且这个有机整体又是它从属的更大系统的组成部分。英文中系统（system）一词来源于古代希腊文（systεmα）意为部分组成的整体。系统的定义应该包含一切系统所共有的特性。一般系统论创始人贝塔朗菲定义：“系统是相互联系相互作用的诸元素的综合体”[2]。这个定义强调元素间的相互作用以及系统对元素的整合作用。可以表述为：定义1.如果对象集S满足下列两个条件

（1）S中至少包含两个不同元素

（2）S中的元素按一定方式相互联系

则称S为一个系统，S的元素为系统的组分。

这个定义指出了系统的三个特性：一多元性，系统是多样性的统一，差异性的统一。二相关性，系统不存在孤立元素组分，所有元素或组分间相互依存、相互作用、相互制约。三整体性，系统是所有元素构成的复合统一整体。这个定义说明了一般系统的基本特征，将系统与非系统区别开来，但对于定义复杂系统有着局限性。另外严格意义上现实世界的“非系统”是不存在的，构成整体的而没有联系性的多元集</h5>
</div>
	<div class="sky" style="height: 300px; opacity: 0.5; z-index: 1">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
  </div>
</div>
<div class="clearfix container">
	<div class="wow fadeInUp mtb40">
		<h2 class="mtb30"><b>  DNS加速&图片加速  </b></h2>
		<h5 class="line-height30"> 中国学者钱学森认为：系统是由相互作用相互依赖的若干组成部分结合而成的，具有特定功能的有机整体，而且这个有机整体又是它从属的更大系统的组成部分。英文中系统（system）一词来源于古代希腊文（systεmα）意为部分组成的整体。系统的定义应该包含一切系统所共有的特性。一般系统论创始人贝塔朗菲定义：“系统是相互联系相互作用的诸元素的综合体”[2]。这个定义强调元素间的相互作用以及系统对元素的整合作用。可以表述为：定义1.如果对象集S满足下列两个条件

（1）S中至少包含两个不同元素

（2）S中的元素按一定方式相互联系

则称S为一个系统，S的元素为系统的组分。

这个定义指出了系统的三个特性：一多元性，系统是多样性的统一，差异性的统一。二相关性，系统不存在孤立元素组分，所有元素或组分间相互依存、相互作用、相互制约。三整体性，系统是所有元素构成的复合统一整体。这个定义说明了一般系统的基本特征，将系统与非系统区别开来，但对于定义复杂系统有着局限性。另外严格意义上现实世界的“非系统”是不存在的，构成整体的而没有联系性的多元集</h5>
	</div>
	<div class="wow fadeInUp mtb40">
		<h2 class="mtb30"><b>  DNS加速&图片加速  </b></h2>
		<h5 class="line-height30"> 中国学者钱学森认为：系统是由相互作用相互依赖的若干组成部分结合而成的，具有特定功能的有机整体，而且这个有机整体又是它从属的更大系统的组成部分。英文中系统（system）一词来源于古代希腊文（systεmα）意为部分组成的整体。系统的定义应该包含一切系统所共有的特性。一般系统论创始人贝塔朗菲定义：“系统是相互联系相互作用的诸元素的综合体”[2]。这个定义强调元素间的相互作用以及系统对元素的整合作用。可以表述为：定义1.如果对象集S满足下列两个条件

（1）S中至少包含两个不同元素

（2）S中的元素按一定方式相互联系

则称S为一个系统，S的元素为系统的组分。

这个定义指出了系统的三个特性：一多元性，系统是多样性的统一，差异性的统一。二相关性，系统不存在孤立元素组分，所有元素或组分间相互依存、相互作用、相互制约。三整体性，系统是所有元素构成的复合统一整体。这个定义说明了一般系统的基本特征，将系统与非系统区别开来，但对于定义复杂系统有着局限性。另外严格意义上现实世界的“非系统”是不存在的，构成整体的而没有联系性的多元集</h5>
	</div>
	<div class="wow fadeInUp mtb40">
		<h2 class="mtb30"><b>  DNS加速&图片加速  </b></h2>
		<h5 class="line-height30"> 中国学者钱学森认为：系统是由相互作用相互依赖的若干组成部分结合而成的，具有特定功能的有机整体，而且这个有机整体又是它从属的更大系统的组成部分。英文中系统（system）一词来源于古代希腊文（systεmα）意为部分组成的整体。系统的定义应该包含一切系统所共有的特性。一般系统论创始人贝塔朗菲定义：“系统是相互联系相互作用的诸元素的综合体”[2]。这个定义强调元素间的相互作用以及系统对元素的整合作用。可以表述为：定义1.如果对象集S满足下列两个条件

（1）S中至少包含两个不同元素

（2）S中的元素按一定方式相互联系

则称S为一个系统，S的元素为系统的组分。

这个定义指出了系统的三个特性：一多元性，系统是多样性的统一，差异性的统一。二相关性，系统不存在孤立元素组分，所有元素或组分间相互依存、相互作用、相互制约。三整体性，系统是所有元素构成的复合统一整体。这个定义说明了一般系统的基本特征，将系统与非系统区别开来，但对于定义复杂系统有着局限性。另外严格意义上现实世界的“非系统”是不存在的，构成整体的而没有联系性的多元集</h5>
	</div>
</div>
<div style="" class="quotes_style wow fadeInUp">
      <div class="container">
       <h2 class="text-center mb40"><b>sssOS授权分类及报价</b></h2>
       <table class="table mtb40 table-bordered table-striped">
       	 <thead>
       	 	<tr><th>版本</th><th>适用范围</th><th>备注</th><th>产品报价</th></tr>
       	 </thead>
       	 <tbody>
       	 	<tr><td>sssOS企业版</td><td>200-500用户</td><td> 一体机授权（路由 bras 缓存 日志）纯软件</td><td>3000元</td></tr>
       	 	<tr><td>sssOS企业版</td><td>200-500用户</td><td> 一体机授权（路由 bras 缓存 日志）纯软件</td><td>3000元</td></tr>
       	 	<tr><td>sssOS企业版</td><td>200-500用户</td><td> 一体机授权（路由 bras 缓存 日志）纯软件</td><td>3000元</td></tr>
       	 	<tr><td>sssOS企业版</td><td>200-500用户</td><td> 一体机授权（路由 bras 缓存 日志）纯软件</td><td>3000元</td></tr>
       	 	<tr><td>sssOS企业版</td><td>200-500用户</td><td> 一体机授权（路由 bras 缓存 日志）纯软件</td><td>3000元</td></tr>
       	 </tbody>
       </table>
	 </div>
	 </div>
</div>
<!--底部信息-->
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

