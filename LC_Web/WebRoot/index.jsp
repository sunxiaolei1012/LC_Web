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

 <script type="text/javascript">
 
  window.onload=function(){
      
   	$.ajax({
   		url:"check_jspContent",
   		data:"jspname="+"index",
   		type:"POST",
   		success:function(a){
   		JspDate=JSON.parse(a); 
   		alert(JspDate[0].content);
   		$("#one").html(JspDate[0].content);
   		$("#two").html(JspDate[1].content);
   		}
   	}) 
}
    </script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="description" content="" />
<title>零尘公司网站首页-虚拟交互首选</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/Animation.css" rel="stylesheet" type="text/css">
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
   <div class="logo"><a href="index.jsp"><img src="images/logo.png" alt=""></a></div>
   <div class="navBox hidden-xs hidden-sm">
   	<ul class="navList list-unstyled">
   	 <li class="navLi">
       <h3><a href="index.jsp"><span>首页</span></a></h3>
      </li>
       	<li class="navLi on">
                	<h3><a href="product.jsp"><span>产品中心</span></a></h3>
                    <div class="navSub">
                	<ul class="navSubList list-unstyled">
                        	<li class="navSubLi">
                            	<h4><a href="Product_into1.jsp">● 网站公司认证计费系统</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Product_into.jsp">● 网站公司tv系统</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Product_into2.jsp">● 软件路由系统</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="Product_into3.jsp">● 网站公司缓存系统</a></h4>
                            </li>
                            <li class="navSubLi">
                            	<h4><a href="Product_into4.jsp">● 网站公司智慧机房</a></h4>
                            </li>
                            <li class="navSubLi">
                            	<h4><a href="Product_into5.jsp">● 网站公司硬件产品</a></h4>
                            </li>
                        </ul>
                    </div>
            </li>
       <li class="navLi">
       <h3><a href="Tutorial.jsp"><span>教程中心</span></a></h3>
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
       <h3><a href="Case.jsp"><span>产品案例</span></a></h3>
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
<!--广告-->
<div class="banner">
	<div class="container relative hidden-sm clearfix">
		<div class="banner_list_style clearfix relative">
		  <div class="hd"><ul></ul></div>
		  <div class="bd">
			<ul>
				<li>
				<div class="ban1Line wow fadeInLeft">
					<div class="ban1Line1 ban"><img src="images/logo1.png"  align="right"></div>
					<div class="ban1Line2 ban"><img src="images/banner_10.png"></div>
					<div class="ban1Line3 ban"><img src="images/banner_15.png"></div>
					<div class="ban1Line4 ban"><img src="images/banner_18.png"></div>
				
				</div>
				<div class="ban1Line_right  wow fadeInRight">
				
					<div class="ban1Line_title">
						<h2>我们立志于</h2>
						<h3 class="explain_name"> 
						<script>
							var s = '定制虚拟场景进行实操训练'; 
							var con = $('.explain_name'); 
							var index = 0; 
							var length = s.length; 
							var tId = null; function start(){ con.text(''); tId=setInterval(function(){ con.append(s.charAt(index)); if(index++ === length){ clearInterval(tId); index = 0; start() } },200); } start();
							</script></h3>
					</div>
					<div class="title_name">我们不断的超越，不断发展</div>
					<a href="#" class="more_btn"></a>
				</div>
				</li>
				<li>
				<div class="ban1Line_style wow fadeInLeft">
				<img src="images/pro_bg_03.png">
				</div>
				<div class="ban1Line_right wow fadeInRight">
					<div class="ban1Line_title">
						<h2>公司管理系统</h2>
						<h3 class="clients "><b class="color2">123</b>家</h3>
					</div>
					<div class="title_name">我们不断的超越，不断发展</div>
					<a href="#" class="more_btn"></a>
				</div>
				</li>
			</ul>
			</div>
		</div>
		<script>jQuery(".banner_list_style").slide({mainCell:".bd ul",titCell:'.hd ul',autoPlay:true,autoPage:true,interTime:5000,easing:"easeOutCirc",delayTime:1000,});</script>
	</div>
	
	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
</div>
</div>
<!--视频-->
<div class="video_style">
   <div class="container relative">
   	<div class="title_name">
   	 <div class="name fl"><h2>宣传<b class="color1">视频</b></h2><h4>PROMOTE VIDEO</h4></div>
   	 <div class="fr line_style"><h5>THROUGH THE VIDEO YOU CAN BETTER UNDERSTAND OUR COMPANY AND PRODUCT INFORMATION</h5></div>
   	 </div>
   </div>    
	<div class="video_stylebg">
		<div class="vodeo_tv bd">
		<ul>
		 <li class="vodeockolayer"></li>
		 <li class="vodeockolayer"></li>
		 <li class="vodeockolayer"></li> 
		</ul>
		</div>
		<div class="hd container">
			<ul class="clearfix">
				<li><em class="tuicon"></em>tv系统宣传视频</li>
				<li><em class="tuicon"></em>公司宣传视频</li>
				<li><em class="tuicon"></em>教程视频</li>
			</ul>
		</div>	
	</div>
	<script>jQuery(".video_stylebg").slide({mainCell:".bd ul",trigger:"click",easing:"easeOutCirc"});</script>
</div>
<!--产品-->
<div class="product_style">
 <div class="container">
   <div class="title_name">
	<h2>产品与服务</h2>
	<h5 class="line-height26" id="one"></h5></div>	
 </div>
  <div class="product_list">
  	<div class="product_bg home">
  	      <div class="parallax-bg" id="slider-wrap">
		<div class="slider parallax-bg" id="slider"> 
		 <div class="slider-sections sandbox"> 
		<section class="first"> 
		<img alt="Kendo UI" src="images/home-banner-1.png"/> 
		<div class="text"> 
		<h2 class="center">
		<span class="english_name mb10">软件名称 RADIUS SYSTEM</span>
		<b class="color2">软件名称</b>斗臂车
		<span class="description mt10">VR斗臂车仿真操作平台--虚拟中体验到危险</span> 
		</h2> <p class="copy_content" id="two"></p>
		 <p class="button">
		 <a href="#" onclick="" class="detailed_btn"></a></p> 
		</div> 
		</section>
		<section> <img src="images/dataviz-home-image-q2.png" alt="Kendo UI" /> 
		<div class="text"> 
		<h2 class="center">
		<span class="english_name mb10">软件名称 INTELLIGENT ROOM</span>
		<b class="color2">软件名称</b>智慧机房
		<span class="description mt10">中小运营商机房解决方案</span> 
		</h2> <p class="copy_content"><b>量身定制的机房设计</b>
		没有一套完整的方案是可以照搬的，机房的整体架构和设计需要考虑到客户的运营策略、套餐的制定、出口资源情况、传输网结构等等。因此每一套智慧机房都是量身定制的。软件名称团队凭借自主研发的认证计费系统，旁路管理系统，tv系统，高性能nat系统，高性能路由系统，十年来以为全国各地200多家宽带运营企业提供优质长期的机房建设和技术支持支撑服务。</p>
		 <p class="button">
		 <a href="#" onclick="" class="detailed_btn"></a></p> 
		</div> 
		</section>
		<section> <img src="images/home_banner_web-q2.png" alt="Kendo UI" /> 
		<div class="text"> 
		<h2 class="center">
		<span class="english_name mb10">软件名称 tv SYSTEM</span>
		<b class="color2">软件名称</b>tv系统
		<span class="description mt10">做中国最好的tv系统</span> 
		</h2> <p class="copy_content"><b>专业尽显专业</b>软件名称 tv系统采用转为流媒体应用的核心Linux系统，稳定高效。同样配置的硬件环境我们可以支持更多频道输出。国内首创动态内存切片技术，将流媒体传输的性能发挥到极致。整个系统只有60兆，全自动中文安装界面1分钟即可安装完成。真正基于Apple HLS协议开发声音视频完全同步，自动i帧校准，高清直播零延迟。Android客户端采用软件名称独立研发的播放器框架，低端设备输出高清码流。</p>
		 <p class="button">
		 <a href="#" onclick="" class="detailed_btn"></a></p> 
		</div> 
		</section>
		</div> 
		</div> 
		<a class="slider-prev" href="javascript: void(0)">?</a>
		<a class="slider-next" href="javascript: void(0)">?</a>
		</div>
  		</div>
  	</div>	
  	<!--优势说明-->
  	  <div class="benefits_style container">
  	  	<ul class="benefits_list">
  	  		<li class="benefits_name col-xs-12 col-sm-4 col-md-4 fadeInUp animated">
  	  			<a href="#">
  	  				<div class="benefits_img"><div class="icon_xt icon"></div></div>
  	  				<h3>一体化系统设计</h3>
  	  				<div class="explanation color3">电脑手机登录两不误，实时进行操作。</div>
  	  				<div class="operating_btn">了解详细</div>
  	  			</a>
  	  		</li>
  	  		<li class="benefits_name col-xs-12 col-sm-4 col-md-4 fadeInUp animated">
  	  			<a href="#">
  	  				<div class="benefits_img"><div class="icon_cz icon"></div></div>
  	  				<h3>操作便捷</h3>
  	  				<div class="explanation color3">系统优化，操作更加便捷，快速上手</div>
  	  				<div class="operating_btn">了解详细</div>
  	  			</a>
  	  		</li>
  	  		<li class="benefits_name col-xs-12 col-sm-4 col-md-4 fadeInUp animated">
  	  			<a href="#">
  	  				<div class="benefits_img"><div class="icon_dm icon"></div></div>
  	  				<h3>代码产权</h3>
  	  				<div class="explanation color3">公司拥有独立知识产权的核心产品，安全放心</div>
  	  				<div class="operating_btn">了解详细</div>
  	  			</a>
  	  		</li>
  	  	</ul>
  	  </div>
  </div>
  <!--方案-->
  <div class="program_style relative">
  	<div class="container relative index2">
  		<div class="title_name"><h2>中小解决带运营商方案</h2><h4>公司根据不同的运营商提供不同的解决方案，更好的解决用户的需求，公司不同的系统也有不同的方案，可以定制解决方案，一步到位真正
的做到全方位解决用户的需求。</h4>
 	</div>
 	<div class="index_Program_list clearfix">
 		<ul>
 			<li class="Program_name col-xs-12 col-sm-3 col-md-3 fadeInUp animated relative">
 				<a href="#" class="link_name relative">
 				  <div class="Program_icon"><em class="icon_program1"></em></div>
 					<img src="pro/1.jpg" alt="">
 					<div class="Program_title"><h2>点播直播解决方案</h2><h5>点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案</h5></div>
 				</a>
 			</li>
 			<li class="Program_name col-xs-12 col-sm-3 col-md-3 fadeInUp animated relative">
 				<a href="#" class="link_name relative">
 				  <div class="Program_icon"><em class="icon_program2"></em></div>
 					<img src="pro/1.jpg" alt="">
 					<div class="Program_title"><h2>点播直播解决方案</h2><h5>点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案</h5></div>
 				</a>
 			</li>
 			<li class="Program_name col-xs-12 col-sm-3 col-md-3 fadeInUp animated relative">
 				<a href="#" class="link_name relative">
 				  <div class="Program_icon"><em class="icon_program3"></em></div>
 					<img src="pro/1.jpg" alt="">
 					<div class="Program_title"><h2>点播直播解决方案</h2><h5>点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案</h5></div>
 				</a>
 			</li>
 			<li class="Program_name col-xs-12 col-sm-3 col-md-3 fadeInUp animated relative">
 				<a href="#" class="link_name relative">
 				  <div class="Program_icon"><em class="icon_program4"></em></div>
 					<img src="pro/1.jpg" alt="">
 					<div class="Program_title"><h2>点播直播解决方案</h2><h5>点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案点播直播解决方案</h5></div>
 				</a>
 			</li>
 		</ul>		
 	</div>
 	<div class="explain_name">选择网站公司解决翻案获得更好的服务内容,选择我们一样就广佛官方大力金刚 针对总高峰期在线人数不超过5000用户的网络环境，可以使用如下方案进行机房建设（本方
案核心路由使用Panabit）。
	<a href="#" class="Program_btn">更多解决方案</a>
 	</div>
  	</div> 
  	<div class="Program_bgq1"></div>
  	<!--波浪效果-->	
  <div class="waveWrapper waveAnimation">
  <div class="waveWrapperInner bgTop">
    <div class="wave waveTop" style="background-image: url('images/wave-top.png')"></div>
  </div>
  <div class="waveWrapperInner bgMiddle">
    <div class="wave waveMiddle" style="background-image: url('images/wave-mid.png')"></div>
  </div>
  <div class="waveWrapperInner bgBottom">
    <div class="wave waveBottom" style="background-image: url('images/wave-bot.png')"></div>
  </div>
</div>
  </div>
  <!--案例显示-->
  <div class="user_casestyle mb30">
  <div class="container">
  	<div class="title_name center"><h2><b class="color1">350+</b>客户的选择</h2><h5>公司为进百家中小运营商提供了优良的服务，秉承以及用于主路的sssOS（软件）路由系统（sssOS高性能NAT系统、sssOSBRAS系统、sssOS一体化接入系统）并在行业内取得多
个重大技术突破和创新成果</h5></div>
	<div class="user_data clearfix">
		<ul>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data1"></div>
				<h2 ><b class="timer count-title" id="count-number" data-to="403" data-speed="2500">403</b>+</h2>
				<h3>客户</h3>
			</li>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data2"></div>
				<h2 ><b class="timer count-title" id="count-number" data-to="43" data-speed="2500">43</b>+</h2>
				<h3>运营商</h3>
			</li>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data3"></div>
				<h2 ><b class="timer count-title" id="count-number" data-to="243" data-speed="2500">243</b>+</h2>
				<h3>酒店</h3>
			</li>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data4"></div>
				<h2 ><b class="timer count-title" id="count-number" data-to="123" data-speed="2500">123</b>+</h2>
				<h3>小区</h3>
			</li>
		</ul>
	</div>
	<!--列表样式-->
	 <div class="case_list relative">
	 	 <div></div>
	 	 <div class="hd"><a class="next"></a><a class="prev"></a></div>
	 	 <div class="bd">
	 	 	<ul class="picList clearfix">
	 	 		<li class="case_name  fadeInUp animated relative"><a href="#"><img src="pro/2.jpg" alt=""><p class="title_name">产品名称</p></a></li>
	 	 		<li class="case_name  fadeInUp animated relative"><a href="#"><img src="pro/2.jpg" alt=""><p class="title_name">产品名称</p></a></li>
	 	 		<li class="case_name  fadeInUp animated relative"><a href="#"><img src="pro/2.jpg" alt=""><p class="title_name">产品名称</p></a></li>
	 	 		<li class="case_name  fadeInUp animated relative"><a href="#"><img src="pro/2.jpg" alt=""><p class="title_name">产品名称</p></a></li>
	 	 	</ul>	
	 	 </div>
	 </div>
	 <script>jQuery(".case_list").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"leftLoop",autoPlay:true,scroll:4,vis:4,delayTime:1000});</script>
	 <a href="#" class="case_mores">更多案例</a>
 	</div> 	
  </div>
  <!--联系方式-->
  <div class="contact_phone">
  	<div class="container">
  		<div class="col-xs-6 col-sm-6 col-md-6 fadeInUp animated relative">
  			<div class="phone_info"><em class="tel_icon fl"><img src="images/phone_img_06.png"></em><h3>服务咨询热线</h3><h2>0536-11111111</h2></div>
  		</div>
  		<div class="col-xs-6 col-sm-6 col-md-6 fadeInUp animated relative">
  			<div class="phone_info"><em class="phone_icon fl"><img src="images/phone_img_07.png"></em><h3>移动服务热线:</h3><h2>137911111111<span>（徐）</span></h2></div>
  		</div>
  	</div>
  </div>
  <!--底部样式-->
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
