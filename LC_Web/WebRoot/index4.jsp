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
<title>详细介绍</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/css.css" rel="stylesheet" type="text/css">
<link href="css/Animation.css" rel="stylesheet" type="text/css">
<link href="css/slider.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/common.js" type="text/javascript"></script>
<script src="js/slider.js" type="text/javascript"></script>
<script src="js/html5.js" type="text/javascript"></script>
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/wow.min.js" type="text/javascript"></script>
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
                            	<h4><a href="Product_into.html">● 网站公司认证计费系统</a></h4>                                
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 网站公司tv系统</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 软件路由系统</a></h4>
                            </li>
                        	<li class="navSubLi">
                            	<h4><a href="#">● 网站公司缓存系统</a></h4>
                            </li>
                            <li class="navSubLi">
                            	<h4><a href="#">● 网站公司智慧机房</a></h4>
                            </li>
                            <li class="navSubLi">
                            	<h4><a href="#">● 网站公司硬件产品</a></h4>
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
<div class="bannerN animated">
	<div class="imgFull"><img src="images/gs_bg_02.png" class="img-responsive"></div>
    <h2 class="banH2 wow fadeInUp">产品案例</h2>
    <h3 class="wow fadeInUp">通过不断的努力不断的专研，研发出专业的软件</h3>
    	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
</div>
</div>
<!--案例详细介绍-->
<div class="container">
	<div class="mtb20 case_details">
		<div class="title_name">
			<h2>北京某商务中心方案</h2>
			<h5 class="color3">发布作者： admin 发布时间：2017-02-06 浏览次数：386次</h5>
		</div>
		<div class="padding">
			<h3>软件名称智能化小区/商务中心 互联网通讯机房方案</h3>
		   <p style="font-size: 16px; line-height: 30px;">本方案根据客户需求进行深度优化和整合后出具，整个系统由核心路由系统、防火墙系统、核心交换系统、光网综合传输系统、旁路系统集群、UPS备用电源系统、tv系统组成。整体方案设计执行二类运营商级机房建设规范，并对整个弱电系统接口进行充足的预留（包括数据接口 传输接口 软件系统API）方便后续的安防系统 出入管理 智能化人员管理 考勤 物业系统 报警系统的对接。通过部署tv系统还可进行一定程度的公共广播等服务。方案详情如下：
 </p>	
<p style="font-size: 16px; line-height: 30px;">一、核心路由系统：核心路由系统由我公司自主研发的软件大流量负载均衡系统和NAT多业务路由系统组成，软件系统可快捷方便的对运营商提供的线路、IP进行地址转换，透传和VPN部署。系统最大吞吐量为20GB、最大负载能力为1万IP在线（我公司也可提供最大负载20万IP在线的NAT系统）。</p>
 
<p style="font-size: 16px; line-height: 30px;">二、核心防火墙系统：同样采用我公司的二类运营商级防火墙系统（BHR-5000），本系统可针对在线量不高于5000IP的网络进行全面的攻击防御和安全策略部署，有效抑制对内传输层的DDOS TCP_F UDP_F等数据流攻击，系统采用旁路模式部署，支持主动探测攻击主动防御，系统支持华为 思科的管理协议，检测攻击后主动屏蔽</p>
 
<p style="font-size: 16px; line-height: 30px;">三、核心交换系统：采用华为9303/9306多业务核心交换机，支持万兆上联、千兆下联，支持链路汇聚 端口汇聚等高级网络管理应用。核心交换系统负责NAT层 旁路层 传输层的数据调度、监控、QINQ终结等服务。</p>
 
<p style="font-size: 16px; line-height: 30px;">四、光网pon传输系统：采用华为MA5680T 2万兆上联业务板，支持宽带、语音、视频的传输，配合GPON设备到客户端后实现，单芯光纤传输1.25GB的符合信号（宽带、语音、电视）。</p>
<p style="font-size: 16px; line-height: 30px;">五、旁路管理系统集群：
5-1：认证计费，同样采用我公司自主研发的软件名称认证计费系统，本系统集成有图示化模型管理工具，同时根据客户需求还可集成物业管理收费系统。认证计费系统可对用户端的上网IP 帐号等进行开关停业务，支持自定义费率、支持票据打印、支持到期前自动提醒 到期后提醒 充值交费提醒。支持客户自助服务平台，支持充值卡系统支持自助网上银行交费（网银、支付宝等）。
5-2：华为U2000管理系统可针对用户的pon客户端设备进行绑定管理，故障针对、方便管理员在后期管理中不需要输入复杂的管理指令，只需要通过图形界面即可轻松实现业务的增删改查以及olt管理。
5-3：旁路管理路由，该系统主要负责对整个机房进行远程管理时提供接入、审核、VPN服务。
5-4：旁路交换系统，选用华为5700多业务交换机，主要用于旁路服务器的内网连接和传输、数据端口的监听、并为缓存系统、tv系统提供数据镜像服务。
5-5：缓存系统，通过部署缓存系统达到提高用户上网体验、节省外网带宽、降低运营成本的作用。</p>
 
<p style="font-size: 16px; line-height: 30px;">六、tv系统：过卫星、本地频道编码、高清信号采集等方式提供最少60路最高130路的电视直播信号，同时系统支持自建轮播频道，同时还可以为整个社区建立多媒体视频广告系统。
 
<p style="font-size: 16px; line-height: 30px;">七、备用路由以及核心交换系统，当主系统离线后，通过旁路管理路由的监听可自动启用备用系统保证整个社区的网络运营。同时备用系统也可在整体传输网络割接时继续为用户提供网络服务。
 
<p style="font-size: 16px; line-height: 30px;">八、UPS备用电源系统，为每一组机柜配置8千瓦大功率UPS后备电源系统，保证整个机房系统在完全断电情况下可持续运行12小时（增加电池组可获得更长的运行时间。）
 
<p style="font-size: 16px; line-height: 30px;">九、PPPOE Server_BRAS接入系统，在本地建立pppoe server，如有需求小区内用户可通过pppoe拨号模式上网，同样可以通过软件名称认证计费系统会客户的账号进行带宽 计费 限速 到期通知等等。</p>
 
<p style="font-size: 16px; line-height: 30px;">十、旁路信息通知系统，通过旁路信息通知系统的部署，管理员可以在线发送给上网客户各种信息，信息可以是文字 图片 url等等，本系统同样可以对接到物业系统中，可指定发送给谁，什么时间发送，发送的内容。这样可以通过电脑屏幕 手机屏幕  电视屏幕 手机短信等多种模式实现通知和广告的下发和推送。</p>
 
<p style="font-size: 16px; line-height: 30px;">十一、流量控制系统，通过流量控制系统的策略路由，可为用户建立专用通道的同时，用户不需要额外进行特殊设置即可实现，例如内网通道 外网通道 专用网络通道 游戏通道 电影通道等等。还可针对不同的通道进行不同的带宽分配。</p>
 
<p style="font-size: 16px; line-height: 30px;">十二、多线路多运营商负载均衡系统，可以同时引入多个运营商的多条线路，进行应用分流和带宽叠加，并且实现智能路由的功能。例如用户访问电信节点的内容自动走电信线路出，用户访问联通线路的节点自动走联通线路出。</p>
 
<p style="font-size: 16px; line-height: 30px;">十三、预留扩展及对接，由于整个传输层采用pon传输，每个节点的最大网络吞吐量为2.5GB，所以凭借该系统，用户可轻松对接数字化安防监控系统、人员门禁管理系统、警报系统、车辆出入管理系统等。在整个方案的设计中我们预留了管理口、api以及传输网节点。最大程度的减少后续系统的对接和整体布线投资。同时集群化的管理更为方便，不会造成重复性投资。</p>

		</div>
	</div>
</div>
<!--客户选择-->
<div class="client_style user_casestyle relative">
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
