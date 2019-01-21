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
<title>产品</title>
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
<script src="js/wow.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
var wow = new WOW({
boxClass: 'wow',
animateClass: 'animated',
offset: 0,
mobile: false,
live: true
});
wow.init();
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
<div class="clearfix"></div>
<div class="bannerN animated">
	<div class="imgFull"><img src="images/p_bg_02.jpg" class="img-responsive"></div>
    <h2 class="banH2 wow fadeInUp">产品中心</h2>
    <h3 class="wow fadeInUp">通过不断的努力不断的专研，研发出专业的软件</h3>
    	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
</div>
</div>
<!--产品列表-->
<div class="container">
  <div class="products_list mtb20">
   <div class="quantity">共计：<b class="color4">7</b> 款产品</div>
	<div class="left_products_info clearfix mb20 wow fadeInUp">
		<div class="products_bg "><a href="#"><span class="activity_style">限时</span><div class="products_img"><img src="images/arImg2.jpg" width="100%"></div></a></div>
		<div class="products_content ">
			<div><h3><a href="#">网站公司认证计费系统</a><span class="new">NEW</span> </h3><a href="#" class="more">MORE+</a></div>
			<h5>软件名称认证计费系统，全国首创动态模型管理系统以及主动故障判定系统。国内唯一支持装维手机客户端。完全的UI和功能设计，让普通人十几分钟内就可以快速上手熟练操作。独有网上营业厅支持微信、支付宝扫码支付等多种功能。我们要做的不仅仅是计费。公司为进百家中小运营商提供了优良的服务，秉承以及用于主路的sssOS（软件）路由系统（sssOS高性能NAT系统、sssOSBRAS系统、sssOS一体化接入系统）并在行业内取得多个重大技术突破和创新成果</h5>
			<div class="products_btn">
				<a href="try_out.html" class="btn try_btn">免费试用</a>
				<a href="#" class="btn download_btn">新版下载</a>
			</div>
		</div>
	</div>
	<div class="right_products_info clearfix wow mb20 fadeInUp">
			<div class="products_bg "><a href="#"><div class="products_img"><img src="images/arImg2.jpg" width="100%"></div></a></div>
		<div class="products_content ">
			<div><h3><a href="#">网站公司认证计费系统</a><span class="new">收费系统</span> </h3><a href="#" class="more">MORE+</a></div>
			<h5>软件名称认证计费系统，全国首创动态模型管理系统以及主动故障判定系统。国内唯一支持装维手机客户端。完全的UI和功能设计，让普通人十几分钟内就可以快速上手熟练操作。独有网上营业厅支持微信、支付宝扫码支付等多种功能。我们要做的不仅仅是计费。公司为进百家中小运营商提供了优良的服务，秉承以及用于主路的sssOS（软件）路由系统（sssOS高性能NAT系统、sssOSBRAS系统、sssOS一体化接入系统）并在行业内取得多个重大技术突破和创新成果</h5>
		</div>
	</div>
	<div class="left_products_info clearfix mb20 wow fadeInUp">
		<div class="products_bg "><a href="#"><div class="products_img"><img src="images/arImg2.jpg" width="100%"></div></a></div>
		<div class="products_content ">
			<div><h3><a href="#">网站公司认证计费系统</a><span class="new">收费系统</span> </h3><a href="#" class="more">MORE+</a></div>
			<h5>软件名称认证计费系统，全国首创动态模型管理系统以及主动故障判定系统。国内唯一支持装维手机客户端。完全的UI和功能设计，让普通人十几分钟内就可以快速上手熟练操作。独有网上营业厅支持微信、支付宝扫码支付等多种功能。我们要做的不仅仅是计费。公司为进百家中小运营商提供了优良的服务，秉承以及用于主路的sssOS（软件）路由系统（sssOS高性能NAT系统、sssOSBRAS系统、sssOS一体化接入系统）并在行业内取得多个重大技术突破和创新成果</h5>
			<div class="pro_logo"><img src="images/p_logo_09.png"></div>
		</div>
	</div>
	<div class="right_products_info clearfix mb20 wow fadeInUp">
			<div class="products_bg "><a href="#"><div class="products_img"><img src="images/arImg2.jpg" width="100%"></div></a></div>
		<div class="products_content ">
			<div><h3><a href="#">网站公司认证计费系统</a><span class="new">收费系统</span> </h3><a href="#" class="more">MORE+</a></div>
			<h5>软件名称认证计费系统，全国首创动态模型管理系统以及主动故障判定系统。国内唯一支持装维手机客户端。完全的UI和功能设计，让普通人十几分钟内就可以快速上手熟练操作。独有网上营业厅支持微信、支付宝扫码支付等多种功能。我们要做的不仅仅是计费。公司为进百家中小运营商提供了优良的服务，秉承以及用于主路的sssOS（软件）路由系统（sssOS高性能NAT系统、sssOSBRAS系统、sssOS一体化接入系统）并在行业内取得多个重大技术突破和创新成果</h5>
		</div>
	</div>
  </div>
</div>
<!--客户选择-->
<div class="client_style user_casestyle">
	<div class="container">
		<div class="title_name center pt30"><h2><b class="color1">350+</b>客户的选择</h2><h5>公司为进百家中小运营商提供了优良的服务，秉承以及用于主路的sssOS（软件）路由系统（sssOS高性能NAT系统、sssOSBRAS系统、sssOS一体化接入系统）并在行业内取得多个重大技术突破和创新成果.</h5></div>
<div class="user_data clearfix mb30">
		<ul>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data1"></div>
				<h2 ><b data-to="234" data-speed="3500" class="timer" id="count-number">234</b>+</h2>
				<h3>客户</h3>
			</li>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data2"></div>
				<h2 ><b data-to="74" data-speed="3500" class="timer" id="count-number">74</b>+</h2>
				<h3>运营商</h3>
			</li>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data3"></div>
				<h2 ><b data-to="54" data-speed="3500" class="timer" id="count-number">54</b>+</h2>
				<h3>酒店</h3>
			</li>
			<li class="data_value col-xs-6 col-sm-3 col-md-3 fadeInUp animated relative">
			<div class="icon icon_data4"></div>
				<h2 ><b data-to="34" data-speed="3500" class="timer" id="count-number">34</b>+</h2>
				<h3>小区</h3>
			</li>
		</ul>
	</div>
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
