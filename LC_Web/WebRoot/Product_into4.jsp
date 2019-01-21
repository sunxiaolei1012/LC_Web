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
 <script type="text/javascript" src="js/dist/vis.js"></script>
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
	       <div class="bannerN animated jf_system">
	 <div class="imgFull"><img src="images/bg11.jpg" class="img-responsive"></div> 
    <h2 class="banH2 wow fadeInUp"><img src="presentimg/tupian_03.png"></h2>

    <div class="product_title wow fadeInUp" style=" bottom: 220px;">     
      <h2 class="mb20 system_title">网站公司智慧机房</h2>
     <h5 class="wow fadeInUp  system_info">深入解析宽带市场的前景：<br>
       自2014年3月开始，工信部和通讯管理局正式对民营企业开放 ISP（宽带运营商）资质申请；允许民营资本进入电信运营商市场。众所周知的道理，基础民生行业是最好赚钱的，在这个衣食住行都已离不开互联网的时代，基础网络服务运营行就成了炙手可热的行业。越来越多的人开始关注这个行业，其中不乏从业多年的三大运营商的代理商、私网宽带商以及一些拥有资金的其他行业投资商。那么如何在这个行业中脱颖而出，获得更多的用户信赖和支持呢！请继续往下阅读。</h5>

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
<!--机房内容信息-->
<div class="container engine_style">
	<div class="clearfix mtb30">
		<div class="col-xs-12 col-sm-7 col-md-7 wow fadeInLeft">
		 <h2 class="color1 mtb40 borderb"><b>好的市场运营策略是成功的敲门石</b></h2>
		 <h5 class="line-height26"> 市场运营是决定成败的关键，在我看来宽带运营商市场已经不是一个靠收宽带费来盈利的行业了，因为不论从品牌影响力、企业实力、网络覆盖范围甚至是出口带宽资源都远不及三大运营商。如何让用户去选择和信任一家新生的民营企业就成为了市场运营策略首要考虑的问题。在这里我分享一个软件名称客户的市场运营案例。</h5>
		</div>
		<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInRight">
			<img src="presentimg/tupian1_03.png">
		</div>
	</div>
	<div class="background1 line-height26 wow fadeInUp mb40">
		山东省某市某小区市，同样为10M的光纤到户宽带，电信价格为600元一年、联通为720元一年、移动为480元一年。其中电信和联通需要额外缴纳宽带初装费150/180元，光猫费160/200元。从价格上来说移动公司占有绝对的优势，但带宽质量不高，电信和联通的资费较高，但如果绑定手机套餐后可免费赠送宽带。（电信为139套餐，联通为156套餐）。客户的运营方案是：用户新装初装费180元、光猫150元，10兆包年使用费600元。看起来完全没有优势的价格。用户新装2年1200元免光猫、免初装。送网络电视机顶盒+80套电视节目。交150元光猫押金免费试用一个月，不满意退还押金。满意后可通过微信、支付宝、网银自助交费开通。套餐使用期间用户可通过自主平台，临时调整带宽。通过这样的市场策略，客户在新开通小区的三天活动期间累计数受理218户，申请免费试用83户，免费试用到期后试用客户转化82户。从数据上我们不难看出虽然免收初装费对运营商来说需要在使用费中拿出一部分装机成本，但同样也保证了2年内这个客户不会丢失。同时作为用户来说，一次性支付了两年的上网费但除了得到一个优质的网络带宽服务外，一年还额外节省了350元两年700元的广电收视费。这也是本案例成功的最终原因。总结一句话：业务的灵活快速落地才能保障市场运营策略的顺利实施。
	</div>
	<div style="width: 577px; height: 367px; margin: 0 auto"><img src="presentimg/jifan_03.png" alt=""></div>
	<div class="jf_eatures_style wow fadeInUp">
		<h2 class="Features_title">那么这个机房需要具备那些功能呢？</h2>
		<div class="frame">
			<table class="table table-bordered table-striped">
				<thead><tr><th class="text-center">名称</th><th class="text-center">详细说明</th></tr></thead>
				<tbody>
				<tr><td>多链路负载均衡路由</td><td>负责链路汇聚负载均衡、带宽叠加、NAT地址转换、出口线路的优化、限速等。</td></tr>
				<tr><td>流控系统</td><td>负责应用识别、应用分流、策略路由、通道流控等。</td></tr>
				<tr><td>Bras系统</td><td>提供PPPOE_Server服务、通知推送、url跳转等业务层服务</td></tr>
				<tr><td>软件名称缓存系统</td><td>软件名称缓存系统2000IP终身授权/DELL R710服务器/16G内存/8TB高速硬盘</td></tr>
				<tr><td>多链路负载均衡路由</td><td>负责链路汇聚负载均衡、带宽叠加、NAT地址转换、出口线路的优化、限速等。</td></tr>
				<tr><td>多链路负载均衡路由</td><td>负责链路汇聚负载均衡、带宽叠加、NAT地址转换、出口线路的优化、限速等。</td></tr>
				<tr><td>多链路负载均衡路由</td><td>负责链路汇聚负载均衡、带宽叠加、NAT地址转换、出口线路的优化、限速等。</td></tr>
				<tr><td>多链路负载均衡路由</td><td>负责链路汇聚负载均衡、带宽叠加、NAT地址转换、出口线路的优化、限速等。</td></tr>
				<tr><td>多链路负载均衡路由</td><td>负责链路汇聚负载均衡、带宽叠加、NAT地址转换、出口线路的优化、限速等。</td></tr>
				</tbody>
			</table>
		</div>
		<h4 class="color4 mtb30 line-height30">上表所述的设备是一个完整全面的宽带运营商机房配置，当然在实际部署中，我们需要结合自身的网络环境、外网带宽质量、用户承载量重新设计和规划自己的机房。</h4>
		<!--问题描述-->
		<div class="clearfix relative">
			<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft">
			<div class="description_con">
				<h4 class="color9 mb10">外网接入的带宽和质量，以及运营商情况。</h4>
				<h5 class="line-height26"> 首先确定要租用哪家运营商的外网带宽，租用什么样的线路，带宽质量如何。例如你能租用到三大运营商的IP专线、上下行带宽对等而且有足量的带宽可用，拿就可以省略掉流控设备。如果你租用的是普通的家庭宽带，上下行不对等，那就不能省略流控设备。当然这里还要看你租用的家庭宽带的上下行比例如果质量较好，只需要多线路负载均衡系统即可满足带宽叠加需求。</h5>
			</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInRight">
			<div class="description_con">
				<h4 class="color9 mb10">外网接入的带宽和质量，以及运营商情况。</h4>
				<h5 class="line-height26" style="margin-left: 20px"> 首先确定要租用哪家运营商的外网带宽，租用什么样的线路，带宽质量如何。例如你能租用到三大运营商的IP专线、上下行带宽对等而且有足量的带宽可用，拿就可以省略掉流控设备。如果你租用的是普通的家庭宽带，上下行不对等，那就不能省略流控设备。当然这里还要看你租用的家庭宽带的上下行比例如果质量较好，只需要多线路负载均衡系统即可满足带宽叠加需求。</h5>
			</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInLeft">
			<div class="description_con">
				<h4 class="color9 mb10">外网接入的带宽和质量，以及运营商情况。</h4>
				<h5 class="line-height26 " style=" margin-right: 20px"> 首先确定要租用哪家运营商的外网带宽，租用什么样的线路，带宽质量如何。例如你能租用到三大运营商的IP专线、上下行带宽对等而且有足量的带宽可用，拿就可以省略掉流控设备。如果你租用的是普通的家庭宽带，上下行不对等，那就不能省略流控设备。当然这里还要看你租用的家庭宽带的上下行比例如果质量较好，只需要多线路负载均衡系统即可满足带宽叠加需求。</h5>
			</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-6 wow fadeInRight">
			<div class="description_con">
				<h4 class="color9 mb10" style="margin-left: 50px">外网接入的带宽和质量，以及运营商情况。</h4>
				<h5 class="line-height26">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首先确定要租用哪家运营商的外网带宽，租用什么样的线路，带宽质量如何。例如你能租用到三大运营商的IP专线、上下行带宽对等而且有足量的带宽可用，拿就可以省略掉流控设备。如果你租用的是普通的家庭宽带，上下行不对等，那就不能省略流控设备。当然这里还要看你租用的家庭宽带的上下行比例如果质量较好，只需要多线路负载均衡系统即可满足带宽叠加需求。</h5>
			</div>
			</div>
			<div class="description_title wow fadeInUp ">问题描述</div>
		</div>
		
		<div class="clearfix mtb30" id="mygraph" style="height: 550px ; width: 100%">
			
		</div> 
		<div class="background1 color8">上述软件系统均为软件名称独立开发并拥有自主知识产权。系统集成更加方便，我们的所有软件系统即可独立运行（对接其他厂商的上下层产品），也可配合软件名称自有系统协作运行。最大保证了系统兼容性和性能。
</div>
		<script type="text/javascript">
  // create an array with nodes
  var nodes = [
    {id: 1,value: 6,  label: '旁路广告系统（运营商增收）',group: 'black'},
    {id: 2,value: 6,  label: 'OLT自动化管理系统',group: 'black'},
    {id: 3,value: 6,  label: '认证计费系统',group: 'black'},
    {id: 4,value: 6,  label: 'tv电视直播系统',group: 'black'},
    {id: 5,value: 6,  label: '多链路负载均衡NAT系统（运营商级高性能核心路由）',group: 'black'},
	{id: 6,value: 6,  label: '用户行为日志审计系统',group: 'black'},
	  {id: 7,value: 6,  label: '三层更新文件服务器系统(游戏三层更新、文件三层更新内网加速)',group: 'black'},
	  {id:8,value: 6,  label: '认证计费系统',group: 'black'},
	  {id: 9,value: 6,  label: '旁路管理系统',group: 'black'},
	  {id: 10,value: 6,  label: 'Tamron_Bras PPPOE 一体化接入系统',group: 'black'},
	  {id:11,value: 6,  label: '内网点播系统（三屏无缝覆盖）',group: 'black'},
	  {id:12,value:24,  label: '知识产权',group: 'title'},
  ];

  // create an array with edges
  var edges = [
    {from: 1, to: 2},
    {from: 1, to: 3},
    {from: 12, to: 4},
    {from: 12, to: 5},
	{from: 12, to: 6},
	{from: 12, to: 7}, 
	{from: 12, to: 8}, 
	{from: 3, to: 9},
	{from: 5, to: 10}, 
	{from: 5, to: 11}, 
	{from: 3, to: 12}, 
  ];

  
  // create a graph
  var container = document.getElementById('mygraph');
  var data = {
    nodes: nodes,
    edges: edges
  };
			
    var options = {
        nodes: {
          shape: 'dot',
			color: {
            border: '#049ce3',

            background: '#049ce3',
            highlight: {
              border: 'darkorange',
              background: 'gold'
            }
			}
			 
        },
		 groups: {
          black: {
            // defaults for nodes in this group
            color: '#049ce3',
            fontColor: '#049ce3',
          },
		title :{
			 color: {
              border: '#e7492a',
              background: '#e7492a',
			
              highlight: {
                border: '#ffc000',
                background: '#ffc000'
              }
            },
            fontSize: 18,
            fontFace: 'arial',
            shape: 'circle',
			fontColor: '#ffffff',
		}

		 },
        edges: {
          color: '#97C2FC',
			background: '#049ce3',
        }
      };
  var graph = new vis.Graph(container, data, options);
</script>
	</div>
</div>
<!--其他信息-->
 <div class="bacolor9 padding mtb40">
 <div class="container">
 	<h2 class="color1 text-center "><b>选用硬件</b></h2>
 	<h3 class="color4 mtb10">软件名称智慧机房选用的硬件产品</h3>
 	<h4 class="color5 line-height30">软件名称智慧机房系统中，所有网络交换机、OLT、传输设备均选用华为产品，镜像交换则选用思科运营商级镜像交换机。
选用Dell PowerEdge系列机架式服务器作为软件系统的硬件载体。
服务器网卡均选用Intel PCI-e X4高性能网卡。</h4>
 </div>
</div>
 <div class="container">
 	<div class="mtb30"><img src="presentimg/jfbg_07.png" alt=""></div>
 	<div class="background1 mb40">上图中是一款在淘宝网上售价2800元的软路由工控机。拆开以后的内部就是这样的。深圳山寨的B75集成主板（集成6个网卡芯片），30元的低功率开关电源，生产廉价U盘才会选用的低速Flash芯片，无任何扩展总线接口，笔记本内存。I3处理器。看到这里我相信不懂的人还是不懂，懂硬件的朋友已经看的很清楚了。其实就是一句话：所谓的高性能软路由工控机，就是一台山寨集成主板的破电脑。这样的产品还谈什么性能？</div>
 </div>
 <div class="bacolor9 padding mtb40">
 	<div class="container">
 		<h2 class="text-center color1"><b>让我们看看专业服务器的内部吧</b></h2>
 		<div class="clearfix mtb30">
 			<div class="col-xs-12 col-sm-5 col-md-5  wow fadeInLeft">
 				<h4 class="mt60 line-height30"><b class="color1">Dell PowerEdge系列机架式服务器</b>，选用Intel双志强处理器，8核16线程，16GB_ECC校验内存最大可扩展至512GB，双电源热备系统，断电延时切换功能。独立5风扇设计，LSI 6I磁盘阵列卡SAS/SATA3最大支持16TB硬盘阵列。四条PCI-e X8扩展槽，内置四口BCM全千兆网卡，独立服务器远程管理CON卡。完善的散热、防尘、防报错伺服体系。这才是构建稳定机房的坚实硬件平台。也是软件名称智慧机房系统的首选硬件产品。</h4>
 			</div>
			<div class="col-xs-12 col-sm-7 col-md-7  wow fadeInRight">
				<img src="presentimg/jdbg_11.png" alt="" width="100%">
			</div>
 		</div>
 		<h2 class="color1 mb20">服务器对比</h2>
 		<table align="center" class="table table-striped table-hover table-bordered">
 		<tbody><tr class="firstRow"><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">功能<br></td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">DELL专业服务器</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">山寨工控机</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">处理器</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">双至强E5520 8核16线程处理器</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">D525 1037U之类移动处理器</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">主板</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">Dell原装服务器主板高性能独立总线接口</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">深圳山寨B75主板</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">网卡</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">集成高性能BCM网卡+扩展Intel82580 I350 82599（万兆）网卡</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">集成低功耗82583网卡</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">内存</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">ECC服务器专用内存最低16GB（最大支持256GB）</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">山寨笔记本内存2G</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">电源</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">Dell大功率延时双电源</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">普通开关电源</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">散热</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">独立五通道无级调速风扇</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">普通风扇</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">硬盘阵列卡</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">LSI 6I磁盘阵列卡支持SAS SATA3</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">无</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">PCI-e扩展槽</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">四条PCI-e x8扩展口</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">无</td></tr><tr><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">远程管理卡</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">Dell远程管理卡带独立管理口</td><td valign="middle" style="border-color: rgb(221, 221, 221); word-break: break-all;" align="center">无</td></tr><tr><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">防尘系统</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">Dell全密封防尘</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">无</td></tr><tr><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">热拔插硬盘盒</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">8个3.5/2.5寸硬盘盒</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">无</td></tr><tr><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">最大带机量</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">基础配置可承载最少5000用户</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">最高配只能带200百用户</td></tr><tr><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">最大网络承载能力</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">通过扩展最大支持8万兆输出</td><td valign="middle" align="center" colspan="1" rowspan="1" style="word-break: break-all;">最大600兆</td></tr><tr><td valign="middle" align="center" colspan="1" rowspan="1" style="border-left-color: rgb(221, 221, 221); border-top-color: rgb(221, 221, 221); word-break: break-all;">适用环境</td><td valign="middle" align="center" colspan="1" rowspan="1" style="border-left-color: rgb(221, 221, 221); border-top-color: rgb(221, 221, 221); word-break: break-all;">路由、缓存、计费、bras、tv、流媒体</td><td valign="middle" align="center" colspan="1" rowspan="1" style="border-left-color: rgb(221, 221, 221); border-top-color: rgb(221, 221, 221); word-break: break-all;">只能做路由</td></tr>
 		</tbody>
 		</table>
 	</div>
 </div>
 <!--其他系统样式-->
 	<div class="container other_style">
 		<div class="mtb40 title_name text-center">
 			<h2 class="color1 borderb1"><b>其他系统</b></h2>
 			<h5 class="color5 mtb10">该机房配置一下系统一体化的解决系统软件</h5>
 		</div>
 		<div class="software_list clearfix">
			<div class="col-xs-16 col-sm-4 col-md-4 wow fadeInUp text-center mb30">
				<div class="software_bg margin0 relative"><div class="img"><img src="presentimg/1484886602820788.png" alt="" width="100%" height="100%"></div></div>
				<h4 class="color9 mtb10">认证计费系统</h4>
				<h5 class="mb20 color3"> 国内性能最好、功能最多、并发量最高的认证计费系统</h5>
				<a href="#" class="link_address">查看详细</a>
			</div>
			<div class="col-xs-16 col-sm-4 col-md-4 wow fadeInUp text-center mb30">
				<div class="software_bg margin0 relative"><div class="img"><img src="presentimg/1484886602820788.png" alt="" width="100%" height="100%"></div></div>
				<h4 class="color9 mtb10">认证计费系统</h4>
				<h5 class="mb20 color3"> 国内性能最好、功能最多、并发量最高的认证计费系统</h5>
				<a href="#" class="link_address">查看详细</a>
			</div>
			<div class="col-xs-16 col-sm-4 col-md-4 wow fadeInUp text-center mb30">
				<div class="software_bg margin0 relative"><div class="img"><img src="presentimg/1484886602820788.png" alt="" width="100%" height="100%"></div></div>
				<h4 class="color9 mtb10">认证计费系统</h4>
				<h5 class="mb20 color3"> 国内性能最好、功能最多、并发量最高的认证计费系统</h5>
				<a href="#" class="link_address">查看详细</a>
			</div>
			<div class="col-xs-16 col-sm-4 col-md-4 wow fadeInUp text-center mb30">
				<div class="software_bg margin0 relative"><div class="img"><img src="presentimg/1484886602820788.png" alt="" width="100%" height="100%"></div></div>
				<h4 class="color9 mtb10">认证计费系统</h4>
				<h5 class="mb20 color3"> 国内性能最好、功能最多、并发量最高的认证计费系统</h5>
				<a href="#" class="link_address">查看详细</a>
			</div>
			<div class="col-xs-16 col-sm-4 col-md-4 wow fadeInUp text-center mb30">
				<div class="software_bg margin0 relative"><div class="img"><img src="presentimg/1484886602820788.png" alt="" width="100%" height="100%"></div></div>
				<h4 class="color9 mtb10">认证计费系统</h4>
				<h5 class="mb20 color3"> 国内性能最好、功能最多、并发量最高的认证计费系统</h5>
				<a href="#" class="link_address">查看详细</a>
			</div>
			<div class="col-xs-16 col-sm-4 col-md-4 wow fadeInUp text-center mb30">
				<div class="software_bg margin0 relative"><div class="img"><img src="presentimg/1484886602820788.png" alt="" width="100%" height="100%"></div></div>
				<h4 class="color9 mtb10">认证计费系统</h4>
				<h5 class="mb20 color3"> 国内性能最好、功能最多、并发量最高的认证计费系统</h5>
				<a href="#" class="link_address">查看详细</a>
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

