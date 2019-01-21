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
<title>网站公司硬件产品</title>
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
  <div class="banner_hardware">
    <div class="container relative hidden-sm clearfix">
  
                 <h4 class=" wow fadeInUp hardware_name">软件名称小型运行上系统是我们针对1000用户以内的小型网络推出的全功能低成本小型化系统。系统集成路由系统、缓存系统、图片加速、DNS加速、PPPOE服务、认证计费系统、tv系统，一台硬件就可以满足小型网络的全功能运营需求。</h4>
    
	</div>  	
	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
  </div>
  <div class="waveWrapper waveAnimation">
  <div class="waveWrapperInner bgTop">
    <div class="wave waveTop" style="background-image: url('images/wave-top.png')"></div>
  </div>
    <div class="waveWrapperInner bgBottom">
    <div class="wave waveBottom" style="background-image: url('images/wave-bot.png')"></div>
  </div>
  <div class="waveWrapperInner bgMiddle">
    <div class="wave waveMiddle" style="background-image: url('images/wave-mid.png')"></div>
  </div>
 
</div>
  </div>
  <div class="container">
  	<div class="mtb40 relative" style="height: 100px;">
  		 <div class="hardware_title">
  		 <div class="title">
     	 <h2 class="mtb20"><b>网站公司硬件产品</b></h2>
     	 <h4 class="color2">小型运营商系统</h4>
     	 </div>
     </div>
  	</div> 	
	</div>
	  	<div id="tour" class="zebra">
	<div class="wrap">

		<div class="switcher-wrap slider">
			<a class="prev jQ_sliderPrev" href=""></a>
			<a class="next jQ_sliderNext" href=""></a>

			<ul id="img-slider" style="height: 450px;">
				<li class="img">
					<img src="pro/3.jpg" />
					<div class="label">产品名称</div>
				</li>
				<li class="img">
					<img src="pro/4.jpg" />
					<div class="label">产品名称</div>
				</li>
				<li class="img">
					<img src="pro/5.jpg" />
					<div class="label">产品名称</div>
				</li>
				<li class="img">
					<img src="pro/6.jpg" />
					<div class="label">产品名称</div>
				</li>
				<li class="img">
					<img src="pro/3.jpg" />
					<div class="label">产品名称</div>
				</li>
			</ul>

			<ul class="switcher jQ_sliderSwitch">
				<li class="active"><a href=""></a></li>
				<li><a href=""></a></li>
				<li><a href=""></a></li>
				<li><a href=""></a></li>
				<li><a href=""></a></li>
			</ul>
		</div>
	</div>
</div>
 	<div class="container">
  	<div class="relative mtb50 clearfix">
  		   <div class="hardware_list" id="Features">
  		   <div class="year_style"><div class="date_Update"><h2><b>功能介绍</b></h2><h4 class="mt10 color2">FEATURES</h4></div></div>
  		      <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor4">支持多线路负载均衡，支持vlan交换机扩WAN，支持单WAN多播。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor1">一台服务器搞定路由、缓存、tv、认证计费。</h4>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor2">采用标准的Radius协议开发，支持多地址池，支持到期提醒等功能。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor1">国内唯一支持预定义资源主动下载功能（热点剧集主动下载主动更新，首创自动追剧、自动追更新模式）</h4>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor2">支持路由表分流，完美实现电信走电信联通走联通。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor1">集成软件名称缓存系统全功能版，支持视频缓存、下载缓存、测速缓存、测速IP伪装。</h4>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor3">支持图片加速功能，针对国内图片CDN服务器，各大图片站，网页游戏地图等多种图片格式自动缓存。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor4">支持DNS加速功能，避免多线路多运营商情况下DNS混乱问题，自动根据请求选择走哪条线。</h4>
				</div>
			 </div>
			   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor2">集成软件名称 tv系统精简版，最大支持40个频道，支持卫星源、支持电信联通移动的tv源复用。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor1">选用高性能DELL R710/510服务器作为基础硬件平台。</h4>
				</div>
			 </div>
			    <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor2">集成软件名称 tv系统精简版，最大支持40个频道，支持卫星源、支持电信联通移动的tv源复用。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor1">选用高性能DELL R710/510服务器作为基础硬件平台。</h4>
				</div>
			 </div>
			    <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon">	</div>
				<div class="timeline-content">
					<h4 class="bacolor2">集成软件名称 tv系统精简版，最大支持40个频道，支持卫星源、支持电信联通移动的tv源复用。</h4>
				</div>
			 </div>
			 	   <div class="timeline-item wow fadeInUp">
				<div class="timeline-icon fr_icon">	</div>
				<div class="timeline-content fr">
					<h4 class="bacolor1">系统硬件平台内置高性能阵列卡最大支持6硬盘Raid，根据需求可配H700卡+12盘位服务器。</h4>
				</div>
			 </div>
		</div>
  	</div>
  </div>
  <!---->
  <div class="Configuration">
  	<div class="container"><div class="title"><h2>产品价格</h2></div></div>
  	<div class="bacolor3 padding">
  	<div class="container Configuration_style">
  		<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft mtb40">
  		<div class="jiage mb20">
  			<h2 class="color2 mb10"><b>￥xxxxx</b></h2>
  			<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无tv版本</h4>
  			</div>
  			<ul>
				<li class="clearfix"><label>集成软件系统：</label><span>路由/计费/缓存/图片加速</span></li>
				<li class="clearfix"><label>硬件平台：</label><span>Dell R710 2U服务器</span></li>
				<li class="clearfix"><label>CPU：</label><span>E5645*2（24核心）</span></li>
				<li class="clearfix"><label>内存：</label><span>DDR3 ECC 32G</span></li>
				<li class="clearfix"><label>硬盘：</label><span>60G SSD系统盘</span></li>
				<li class="clearfix"><label>网卡：</label><span>集成BCM千兆*4/独立intel82580千兆*4</span></li>
				<li class="clearfix"><label>阵列卡：</label><span>Dell 6/i</span></li>
				<li class="clearfix"><label>盘架：</label><span>6个</span></li>
				<li class="clearfix"><label>电源：</label><span>单电</span></li>
				<li class="clearfix"><label>最大承载用户：</label><span>1000用户</span></li>
				<li class="clearfix"><label>tv频道数量：</label><span>0</span></li>
  			</ul>
  		</div>
  		<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft mtb40">
  		<div class="jiage mb20">
  			<h2 class="color2 mb10"><b>￥xxxxx</b></h2>
  			<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有tv版本</h4>
  			</div>
  			<ul>
				<li class="clearfix"><label>集成软件系统：</label><span>路由/计费/缓存/图片加速/tv</span></li>
				<li class="clearfix"><label>硬件平台：</label><span>Dell R710 2U服务器</span></li>
				<li class="clearfix"><label>CPU：</label><span>E5645*2（24核心）</span></li>
				<li class="clearfix"><label>内存：</label><span>DDR3 ECC 32G</span></li>
				<li class="clearfix"><label>硬盘：</label><span>60G SSD系统盘</span></li>
				<li class="clearfix"><label>网卡：</label><span>集成BCM千兆*4/独立intel82580千兆*4/独立intel82599万兆*2 SPF</span></li>
				<li class="clearfix"><label>阵列卡：</label><span>Dell 6/i</span></li>
				<li class="clearfix"><label>盘架：</label><span>6个</span></li>
				<li class="clearfix"><label>电源：</label><span>单电</span></li>
				<li class="clearfix"><label>最大承载用户：</label><span>1000用户</span></li>
				<li class="clearfix"><label>tv频道数量：</label><span>0</span></li>
  			</ul>
  		</div>
  	</div>
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
<script type="text/javascript" src="js/jquery.roundabout.js"></script>
<script type="text/javascript" src="js/script.js"></script>
