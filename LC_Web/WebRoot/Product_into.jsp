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
<title>产品中心-产品介绍</title>
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
<!--产品介绍详细-->
<div class="product_details">
	<div class="bannerN animated">
	<div class="imgFull"><img src="images/bg3.jpeg" class="img-responsive"></div>
  
    <h2 class="banH2 wow fadeInUp"><img src="images/pro_bg_03.png"></h2>
    <div class="product_title wow fadeInUp">
     
      <h2 class="mb20">网站公司tv系统</h2>
      <h4 class="mb20">新版4.1.2正式上线</h4>
     <h5 class="wow fadeInUp synopsis">软件名称 tv/VOD系统是针对中小宽带运营商、酒店等行业开发的网络电视、网络点播解决方案。系统支持多种节目源（包含但不限于卫星节目源、广电节目源、运营商tv源、互联网源等）</h5>
     </div>
   
    	<div class="sky">
	<div class="clouds_one"></div>
	<div class="clouds_two"></div>
	<div class="clouds_three"></div>
  </div>
    	<!--波浪效果-->	
  <div class="waveWrapper waveAnimation">
  
  <div class="waveWrapperInner bgMiddle">
    <div class="wave waveMiddle" style="background-image: url('images/wave-mid.png')"></div>
  </div>
   <div class="waveWrapperInner bgTop">
    <div class="wave waveTop" style="background-image: url('images/yunbg_06.png')"></div>
  </div>
  <div class="waveWrapperInner bgBottom">
    <div class="wave waveBottom" style="background-image: url('images/yunbg_06.png')"></div>
  </div>
</div>
</div>
<!--具体产品介绍样式-->
<div class="product_details_style">
	<div class="hd Switch_list">
		<ul class="container clearfix">
		<li><a href="javascript:ovid()" class="btn">产品介绍</a></li>
		<li><a href="javascript:ovid()" class="btn">部署方案</a></li>
		<li><a href="javascript:ovid()" class="btn">系统截图</a></li>
		<li><a href="javascript:ovid()" class="btn">更新下载</a> </li>
		<li><a href="javascript:ovid()" class="btn">答疑解惑</a></li>
		</ul>
	</div> 
	<div class="bd">
		<div class="contents">
			<div class="product_Profile mtb40">
				<div class="container">
					<div class="present_bg mb30 wow fadeInUp">
					<div class="present_content ">
						<p>随着广电相关政策的开放，国内三大运营商都推出了自己的tv服务，中国联通的沃TV、中国电信的ITV、中国移动的TV 从三大运营商针对tv的相关政策不难看出，推出免费或者半免费的 tv系统主要目的还是为了带动基础宽带套餐的消费，从宽带用户的角度来看问题；宽带用户年轻人较多，在很多人看来数字电视一直处于一个非常尴尬的地位，看的时候不多，但没有又不行。安装广电的数字电视每年又是一笔家庭支出。而这个移动互联网发展迅猛，运营商移动流量自费高涨的时期，家庭 wifi 又是必不可少。那么交一份宽带的钱还能得到免费够用的电视观看服务，这对广大宽带用户来说无疑是很具诱惑力的。从运营商的角度来说，虽然增加 tv 服务增长了一些运营成本，单完全可以通过绑定一些套餐的模式来 </p>      
						<p  style=" margin-left: 100px">从中获利。相较于 tv 的投资，如何绑住用户才是运营商考虑的首要问题。<br>作为中小民营宽带企业，本身在带宽资源上已经被大的运营商重重限制，加上新的民营宽带企业不管从品牌还是知名度上都不如三大运营商。如果还要出现大家都有你没有的情况，就会直接输在起跑线上。</p>  
					</div>
					</div>
					<div class="Compared_style wow fadeInUp">
						<h1 class="name">  如何选购tv系统</h1>
						<div class="left_content common">
							<div class="title color4">UDP 组播方式</div>
							<div class="Description line-height26"> VOD即视频点播系统，我们都知道当下环境，上网高峰期最大的用量无非就是视频点播和直播类。因此在这个互联网时代内容为王的大环境下，VOD点播系统对于广大运营商来说就显得尤为重要了。</div>
						</div>
						<div class="right_content common">
							<div class="title color2">流媒体单播方式</div>
							<div class="Description line-height26"> VOD即视频点播系统，我们都知道当下环境，上网高峰期最大的用量无非就是视频点播和直播类。因此在这个互联网时代内容为王的大环境下，VOD点播系统对于广大运营商来说就显得尤为重要了。</div>
						</div>
					</div>
				</div>
				<!---->
					<div class="Info_Photo" id="ITV">
						<div class="Info_top"><div class="container"><h2>后台管理系统界面</h2></div></div>
						<div class="bacolor5 padding">
							<div class="container">
								 <div class="introduction_p1 relative clearfix">
								 	<div class="fl wow fadeInLeft">
								 		<img src="presentimg/bg_09.png">
								 	</div>
								 	<div class="fr wow fadeInRight summary">
								 		 <h2 class="title">截图名称</h2>
								 		 <h4 class="content">我们通过对一些已有客户的调查发现，增加 tv 服务后，客户企业的宽带装机量，高套餐续费率较之前至少提升 30%，有的客户甚至在不到一个月的时间里就收回了 tv 的全部投资</h4>
								 		 <h3 class="english">XINTONGJIETU D  BNGFM</h3>
								 	</div>
								 </div>
								 	 <div class="introduction_p1 relative clearfix">
								 	
								 	<div class="fl wow fadeInLeft summary">
								 		 <h2 class="title">截图名称</h2>
								 		 <h4 class="content">我们通过对一些已有客户的调查发现，增加 tv 服务后，客户企业的宽带装机量，高套餐续费率较之前至少提升 30%，有的客户甚至在不到一个月的时间里就收回了 tv 的全部投资</h4>
								 		 <h3 class="english">XINTONGJIETU D  BNGFM</h3>
								 	</div>
								 	<div class="fr wow fadeInRight">
								 		<img src="presentimg/bg_13.png">
								 	</div>
								 </div>
							</div>	
						</div>
						<div><img src="presentimg/bg_02.png" width="100%"></div>
						<div class="padding bacolor4 height5">
							<div class="container">
							  <div class="software_style relative">
							  <h2 class="title_name">tv客户端（1.4.01）</h2>
								<div class="fl wow fadeInLeft summarys">
								 		 <h2 class="title">截图名称</h2>
								 		 <h4 class="content line-height26">我们通过对一些已有客户的调查发现，增加 tv 服务后，客户企业的宽带装机量，高套餐续费率较之前至少提升 30%，有的客户甚至在不到一个月的时间里就收回了 tv 的全部投资</h4>
								 	</div>
								 	<div class="fr wow fadeInRight bg_img">
								 		<img src="presentimg/bgp_17.png">
								 	</div>
								</div>
								 	
							</div>
						</div> 
						 	<div class="mb30"><img src="presentimg/bg_08.png"></div>
						 	   <div class="container">
							 	<div class="introduction_p2 relative clearfix color6 mb40">
								 	
								 	<div class="fr wow fadeInRight summary">
								 		 <h2 class="title">截图名称</h2>
								 		 <h4 class="content">我们通过对一些已有客户的调查发现，增加 tv 服务后，客户企业的宽带装机量，高套餐续费率较之前至少提升 30%，有的客户甚至在不到一个月的时间里就收回了 tv 的全部投资</h4>
								 		 <h3 class="english">XINTONGJIETU D  BNGFM</h3>
								 	</div>
								 	<div class="fl wow fadeInLeft">
								 		<img src="presentimg/bg_03.png">
								 	</div>
								 </div>
								 <div class="introduction_p2 relative clearfix color6">
								 	
								 	<div class="fl wow fadeInLeft summary">
								 		 <h2 class="title">截图名称</h2>
								 		 <h4 class="content">我们通过对一些已有客户的调查发现，增加 tv 服务后，客户企业的宽带装机量，高套餐续费率较之前至少提升 30%，有的客户甚至在不到一个月的时间里就收回了 tv 的全部投资</h4>
								 		 <h3 class="english">XINTONGJIETU D  BNGFM</h3>
								 	</div>
								 	<div class="fr wow fadeInRight">
								 		<img src="presentimg/bg_03.png">
								 	</div>
								 </div>
						</div>
						<div><img src="presentimg/pbg_02.png"></div>
						<div class="padding bacolor3">
							<div class="container Advantage_style">
								<h2>软件名称 tv产品优势</h2>
								<div class="comtable_list mtb30 wow fadeInUp">
									<div class="table_title">
										<ul><li style="width: 10%">功能</li><li style="width: 60%">软件名称 tv</li ><li style="width: 30%">其他tv</li></ul>
									</div>
									<table class="table table-bordered mb20 ">
										<tbody>
										<tr><td  style="width: 10%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 30%">需要双口光猫/只能部署在ftth网络环境</td></tr>
										<tr><td  style="width: 10%">机顶盒要求 </td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 30%">需要双口光猫/只能部署在ftth网络环境</td></tr>
										<tr><td  style="width: 10%">部署要求</td><td style="width:60%">  可管可控，不同用户看不同节目单，可通过计费系统统一管理和下发，用户停网则自动关闭tv</td><td style="width: 30%">  对于用户难以管控，用户上网到期，tv还能看无法对接到计费系统统一管理。</td></tr>
										<tr><td  style="width: 10%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 30%">需要双口光猫/只能部署在ftth网络环境</td></tr>
										<tr><td  style="width: 10%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 30%">需要双口光猫/只能部署在ftth网络环境</td></tr>
										<tr><td  style="width: 10%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 30%">需要双口光猫/只能部署在ftth网络环境</td></tr>
										<tr><td  style="width: 10%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 30%">需要双口光猫/只能部署在ftth网络环境</td></tr>
										</tbody>
									</table>
									<div  style="color: #ffffff; line-height: 26px; margin-bottom: 50px;"> 通过上表中的介绍，相信您已经对软件名称的tv系统有了一个初步的了解。我们都知道目前市场上tv系列产品的价格并不低。一套系统做下来基本上都在2万以上（软件+硬件+前端设备），花这么多钱缺买到一套粗制滥造的产品，那么在前期选择的时候就显得尤为重要了。</div>
								</div>
							</div>
						</div>
						<div><img src="presentimg/aa_08.png" width="100%"></div>
						<div class="container relative Features_style">
							<div class="Features_title"><h3>软件名称 tv系统</h3></div>
							<div class="contents">软件名称的全系产品均采用我们自主研发的64位Linux内核作为底层系统，完美支持Intel DPDk技术和Zcopy技术，针对网络应用和传输进行了专项优化，系统不存在多于进程，自身仅有60兆左右，系统自身对内存的占用非常小（仅为120兆左右），将最大的物理内存全部留给用户态程序使用。完美支持网卡多队列技术，单机负载用户数量是其他系统的几倍。系统采用全中文安装引导程序，整个安装过程仅需1分钟（centos Ubuntu需要1-2小时），启动后提供全中文的控制台快捷操作菜单（其他系统你可能要自己去敲命令了）。</div>
							<div class="tagBall" id="tagbox">
								<span class="tag color2" target="_blank" href="">安装便捷</span>
								<span class="tag color3" target="_blank" href="">安装便捷</span>
								<span class="tag color2" target="_blank" href="">不强制用户选择机顶盒</span>
								<span class="tag color4" target="_blank" href="">安装便捷</span>
								<span class="tag color2" target="_blank" href="">安装便捷</span>
								<span class="tag color3" target="_blank" href="">安装便捷</span>
								<span class="tag color2" target="_blank" href="">免费定制机顶盒</span>
								<span class="tag color2" target="_blank" href="">升级更新维护免费</span>
								<span class="tag color1" target="_blank" href="">安装便捷</span>
								<span class="tag color4" target="_blank" href="">安装便捷</span>
								<span class="tag color3" target="_blank" href="">无任何捆绑</span>
								<span class="tag color3" target="_blank" href="">安装便捷</span>
								<span class="tag color3" target="_blank" href="">安装便捷</span>
								<span class="tag color3" target="_blank" href="">无任何限制</span>
								<span class="tag color3" target="_blank" href="">一次性收费</span>
								<span class="tag color3" target="_blank" href="">操作简单</span>
								<span class="tag color3" target="_blank" href="">安装便捷</span>
								<span class="tag color3" target="_blank" href="">空间占用小</span>
							</div>
						</div>
						<!--产品报价-->
						<div class="price_style">
							<div class="price_title"><h2>产品报价</h2></div>
							<div class="padding bacolor6">
								<div class="container">
									<div class="comtable_list mtb30">
									<div class="table_title">
										<ul><li style="width: 20%">名称</li><li style="width: 70%">介绍</li ><li style="width: 10%">报价</li></ul>
									</div>
									<table class="table table-bordered mb20">
										<tbody>
										<tr><td  style="width: 20%">部署要求</td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">21000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:70%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">47000元</td></tr>
										</tbody>
									</table>
									<div  style="color: #ffffff; font-size: 16px; line-height: 26px; margin-bottom: 50px;"> 所有安装费用根据客户的安装地址实际收取。（含食宿、车旅）</div>
								</div>
							</div>
							</div>
							<div><img src="presentimg/bg_7.png" width="100%;" alt=""/></div>
							<!--扩展模块-->
							<div class="padding bacolor5">
								<div class="container relative extended_style">
									<div class="Extended_title">
										<h4>软件名称_tv</h4>
										<h2>扩展模块</h2>
										<h1><b class="color2 mfr10">SYSTEM</b>MODULE</h1>
									</div>
										<div class="comtable_list mtb30">
									<div class="table_title">
										<ul><li style="width: 20%">名称</li><li style="width: 60%">介绍</li ><li style="width: 10%">有效期</li><li style="width: 10%">报价</li></ul>
									</div>
									<table class="table table-bordered mb20">
										<tbody>
										<tr>
										<td  style="width: 20%">部署要求</td>
										<td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td>
										<td style="width: 10%">终身</td>
										<td style="width: 10%">17000元</td>
										</tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">17000元</td></tr>
										<tr><td  style="width: 20%">部署要求</td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">21000元</td></tr>
										<tr><td  style="width: 20%">机顶盒要求 </td><td style="width:60%"> 无需专用光猫可部署，包括普通的交换机网络中</td><td style="width: 10%">终身</td><td style="width: 10%">47000元</td></tr>
										</tbody>
									</table>
									<div  style="color: #ffffff; font-size: 16px; line-height: 26px; margin-bottom: 50px;"> 所有安装费用根据客户的安装地址实际收取。（含食宿、车旅）</div>
								</div>
								</div>
							</div>
							<div style="background: url(presentimg/bg_9.png) no-repeat center; width: 100%; height: 223px;">
							<div class="container relative">
							<div class="equipment_title">
								<h1 class="name">设备</h1>
								<h3>需要的</h3>
								<h1 class="English" style=" margin-top: 20px; font-size: 45px;">EQUIPMENT</h1>
							</div>
							</div>
							</div>
							<div class="padding bacolor7">
								<div class="container padding">
									<table class="equipment_table table table-striped table-bordered">
										<thead class="title_name"><tr><th>设备</th><th>运营商tv源</th><th>卫星源</th><th>广电源</th><th>模拟/数字源</th></tr></thead>
										<tbody>
											<tr><td>tv主系统</td><td></td><td><img src="presentimg/icon_ok.png"></td><td></td><td></td></tr>
											<tr><td>tv主系统</td><td></td><td></td><td></td><td><img src="presentimg/icon_ok.png"></td></tr>
										</tbody>
									</table>
								</div>
							</div>
							<!---->
							<div class="Authorize_style">
								<div class="container">
									<div class="Authorize_content clearfix wow fadeInUp">
										<div class="Authorize_name clearfix">
										<div class="infoname">
											<span class="Sorting Sorting_color">1</span>
											<h3 class="name">系统授权</h3>
											<div class="present">系统授权为一次性买断，后续免费更新免费升级（免费升级版本但不包含换代产品的更新，换代产品需补差价）。</div>
										</div>
										</div>
										<div class="Authorize_name clearfix">
										<div class="infoname">
											<span class="Sorting Sorting_color">2</span>
											<h3 class="name">频道数量限制</h3>
											<div class="present">系统授权为一次性买断，后续免费更新免费升级（免费升级版本但不包含换代产品的更新，换代产品需补差价）。</div>
										</div>
										</div>
										<div class="Authorize_name clearfix">
										<div class="infoname">
											<span class="Sorting Sorting_color1">3</span>
											<h3 class="name">系统授权</h3>
											<div class="present">系统授权为一次性买断，后续免费更新免费升级（免费升级版本但不包含换代产品的更新，换代产品需补差价）。</div>
										</div>
										</div>
										<div class="Authorize_name clearfix">
										<div class="infoname">
											<span class="Sorting Sorting_color1">4</span>
											<h3 class="name">系统授权</h3>
											<div class="present">系统授权为一次性买断，后续免费更新免费升级（免费升级版本但不包含换代产品的更新，换代产品需补差价）。</div>
										</div>
										</div>
											<div class="Authorize_name clearfix">
										<div class="infoname">
											<span class="Sorting Sorting_color">5</span>
											<h3 class="name">系统授权</h3>
											<div class="present">系统授权为一次性买断，后续免费更新免费升级（免费升级版本但不包含换代产品的更新，换代产品需补差价）。</div>
										</div>
										</div>
										<div class="Authorize_name clearfix">
										<div class="infoname">
											<span class="Sorting Sorting_color">6</span>
											<h3 class="name">频道数量限制</h3>
											<div class="present">系统授权为一次性买断，后续免费更新免费升级（免费升级版本但不包含换代产品的更新，换代产品需补差价）。</div>
										</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<div class="contents">
			<!--内容信息-->
		</div>
		<div class="contents">
		<div class="container ">
			<!--内容信息-->
			<div class="Screenshot_style mtb30">
                    <div class="title_name"><em class="fa  fa-image "></em> 后台管理系统界面</div>
                    <img src="pro/4.png" alt="" class="mb20" width="100%">
                    <img src="pro/5.png" alt="" class="mb20"  width="100%">
                    <img src="pro/6.png" alt="" class="mb20"  width="100%">
			</div>
			</div>
		</div>
		<!--更新-->
		<div class="contents">
			<div class="container ">
			<div class="mtb20">
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
		<!--结束-->
		<!--解答-->
		<div class="answer_style contents">
			<div class="container answer_list">
			<div class="mtb20">
			<div class="description">为了避免广大客户在购买tv产品时遇到的各种疑问，这里做出统一解答，在购买产品前请认证阅读本文谢谢。</div>
				<ul class="answer_name relative">
					<li class="wen"><em class="bg_wen">问</em><a href="#" class="title_name">软件名称 tv系统可以申请测试吗？</a></li>
					<li class="relative mb20"><em class="bg_da">答</em><p class="content">可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试。可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试</p></li>
				</ul>
				<ul class="answer_name relative">
					<li class="wen"><em class="bg_wen">问</em><a href="#" class="title_name">软件名称 tv系统可以申请测试吗？</a></li>
					<li class="relative mb20"><em class="bg_da">答</em><p class="content">可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试。可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试</p></li>
				</ul>
				<ul class="answer_name relative">
					<li class="wen"><em class="bg_wen">问</em><a href="#" class="title_name">软件名称 tv系统可以申请测试吗？</a></li>
					<li class="relative mb20"><em class="bg_da">答</em><p class="content">可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试。可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试</p></li>
				</ul>
				<ul class="answer_name relative">
					<li class="wen"><em class="bg_wen">问</em><a href="#" class="title_name">软件名称 tv系统可以申请测试吗？</a></li>
					<li class="relative mb20"><em class="bg_da">答</em><p class="content">可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试。可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试</p></li>
				</ul>
				<ul class="answer_name relative">
					<li class="wen"><em class="bg_wen">问</em><a href="#" class="title_name">软件名称 tv系统可以申请测试吗？</a></li>
					<li class="relative mb20"><em class="bg_da">答</em><p class="content">可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试。可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试</p></li>
				</ul>
				<ul class="answer_name relative">
					<li class="wen"><em class="bg_wen">问</em><a href="#" class="title_name">软件名称 tv系统可以申请测试吗？</a></li>
					<li class="relative mb20"><em class="bg_da">答</em><p class="content">可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试。可以测试，交1000元测试7天，部署成功且我们所述的功能都正常，补齐插件购买正式授权。部署失败无法达到我们所述的功能无条件退款，不提供免费测试</p></li>
				</ul>
			</div>
			</div>
		</div>
		
	</div>
</div>
<script>jQuery(".product_details_style").slide({mainCell:".bd ",trigger:"click",delayTime:0});</script>
</div>

<!--底部样式-->
<div class="yunbeijing"></div>
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

<script type="text/javascript">
var radius = 250;
var dtr = Math.PI/380;
var d=400;

var mcList = [];
var active = false;
var lasta = 2;
var lastb = 1;
var distr = true;
var tspeed=5;
var size=250;

var mouseX=0;
var mouseY=0;

var howElliptical=1;

var aA=null;
var oDiv=1200;

window.onload=function ()
{
	var i=0;
	var oTag=null;
	
	oDiv=document.getElementById('tagbox');
	
	aA=oDiv.getElementsByTagName('span');
	
	for(i=0;i<aA.length;i++)
	{
		oTag={};
		
		oTag.offsetWidth=aA[i].offsetWidth;
		oTag.offsetHeight=aA[i].offsetHeight;
		
		mcList.push(oTag);
	}
	
	sineCosine( 0,0,0 );
	
	positionAll();
	
	oDiv.onmouseover=function ()
	{
		active=true;
	};
	
	oDiv.onmouseout=function ()
	{
		active=false;
	};
	
	oDiv.onmousemove=function (ev)
	{
		var oEvent=window.event || ev;
		
		mouseX=oEvent.clientX-(oDiv.offsetLeft+oDiv.offsetWidth/2);
		mouseY=oEvent.clientY-(oDiv.offsetTop+oDiv.offsetHeight/2);
		
		mouseX/=5;
		mouseY/=5;
	};
	
	setInterval(update, 30);
};

function update()
{
	var a;
	var b;
	
	if(active)
	{
		a = (-Math.min( Math.max( -mouseY, -size ), size ) / radius ) * tspeed;
		b = (Math.min( Math.max( -mouseX, -size ), size ) / radius ) * tspeed;
	}
	else
	{
		a = lasta * 0.98;
		b = lastb * 0.98;
	}
	
	lasta=a;
	lastb=b;
	
	if(Math.abs(a)<=0.01 && Math.abs(b)<=0.01)
	{
		return;
	}
	
	var c=0;
	sineCosine(a,b,c);
	for(var j=0;j<mcList.length;j++)
	{
		var rx1=mcList[j].cx;
		var ry1=mcList[j].cy*ca+mcList[j].cz*(-sa);
		var rz1=mcList[j].cy*sa+mcList[j].cz*ca;
		
		var rx2=rx1*cb+rz1*sb;
		var ry2=ry1;
		var rz2=rx1*(-sb)+rz1*cb;
		
		var rx3=rx2*cc+ry2*(-sc);
		var ry3=rx2*sc+ry2*cc;
		var rz3=rz2;
		
		mcList[j].cx=rx3;
		mcList[j].cy=ry3;
		mcList[j].cz=rz3;
		
		per=d/(d+rz3);
		
		mcList[j].x=(howElliptical*rx3*per)-(howElliptical*2);
		mcList[j].y=ry3*per;
		mcList[j].scale=per;
		mcList[j].alpha=per;
		
		mcList[j].alpha=(mcList[j].alpha-0.6)*(10/6);
	}
	
	doPosition();
	depthSort();
}

function depthSort()
{
	var i=0;
	var aTmp=[];
	
	for(i=0;i<aA.length;i++)
	{
		aTmp.push(aA[i]);
	}
	
	aTmp.sort
	(
		function (vItem1, vItem2)
		{
			if(vItem1.cz>vItem2.cz)
			{
				return -1;
			}
			else if(vItem1.cz<vItem2.cz)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
	);
	
	for(i=0;i<aTmp.length;i++)
	{
		aTmp[i].style.zIndex=i;
	}
}

function positionAll()
{
	var phi=0;
	var theta=0;
	var max=mcList.length;
	var i=0;
	
	var aTmp=[];
	var oFragment=document.createDocumentFragment();
	
	//随机排序
	for(i=0;i<aA.length;i++)
	{
		aTmp.push(aA[i]);
	}
	
	aTmp.sort
	(
		function ()
		{
			return Math.random()<0.5?1:-1;
		}
	);
	
	for(i=0;i<aTmp.length;i++)
	{
		oFragment.appendChild(aTmp[i]);
	}
	
	oDiv.appendChild(oFragment);
	
	for( var i=1; i<max+1; i++){
		if( distr )
		{
			phi = Math.acos(-1+(2*i-1)/max);
			theta = Math.sqrt(max*Math.PI)*phi;
		}
		else
		{
			phi = Math.random()*(Math.PI);
			theta = Math.random()*(2*Math.PI);
		}
		//坐标变换
		mcList[i-1].cx = radius * Math.cos(theta)*Math.sin(phi);
		mcList[i-1].cy = radius * Math.sin(theta)*Math.sin(phi);
		mcList[i-1].cz = radius * Math.cos(phi);
		
		aA[i-1].style.left=mcList[i-1].cx+oDiv.offsetWidth/2-mcList[i-1].offsetWidth/2+'px';
		aA[i-1].style.top=mcList[i-1].cy+oDiv.offsetHeight/2-mcList[i-1].offsetHeight/2+'px';
	}
}

function doPosition()
{
	var l=oDiv.offsetWidth/2;
	var t=oDiv.offsetHeight/2;
	for(var i=0;i<mcList.length;i++)
	{
		aA[i].style.left=mcList[i].cx+l-mcList[i].offsetWidth/2+'px';
		aA[i].style.top=mcList[i].cy+t-mcList[i].offsetHeight/2+'px';
		
		aA[i].style.fontSize=Math.ceil(12*mcList[i].scale/2)+8+'px';
		
		aA[i].style.filter="alpha(opacity="+100*mcList[i].alpha+")";
		aA[i].style.opacity=mcList[i].alpha;
	}
}

function sineCosine( a, b, c)
{
	sa = Math.sin(a * dtr);
	ca = Math.cos(a * dtr);
	sb = Math.sin(b * dtr);
	cb = Math.cos(b * dtr);
	sc = Math.sin(c * dtr);
	cc = Math.cos(c * dtr);
}
</script>
</html>
