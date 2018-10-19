function add(cmd)
{
	layer.open({
		  type: 2,
		  skin: 'layui-layer-rim',
		  area: ['700px', '450px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: 'admin/add/'+cmd+'.jsp',
		});
	
}
function update_user_password(cmd)
{
	layer.open({
		  type: 2,
		  skin: 'layui-layer-rim',
		  area: ['700px', '450px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: 'admin/update/'+cmd+'.jsp',
		});
	
}
function add_chart(cmd)
{

	layer.open({
		  type: 2,
		  skin: 'layui-layer-rim',
		  area: ['700px', '450px'],
		  fixed: false, //不固定
		  maxmin: true,
		  content: 'Tea_manage/'+cmd+'.html',
		});
	
}

function update(cmd,id)
{
		layer.open({
			  type: 2,
			  skin: 'layui-layer-rim',
			  area: ['700px', '450px'],
			  fixed: false, //不固定
			  maxmin: true,
			  content: 'cmd_update_'+cmd+'?id='+id,
			});
}

function del(cmd , id)
{
	if(confirm('确认删除吗?'))
		window.location='cmd_del_'+cmd+'?id='+id;

}


function save(func,cmd)
{
   $.ajax({
       type:"post",
       url:"cmd_"+func+"_"+cmd,
       dataType:"json",
       cache:false,
       async: false,
       data: $("#form2").serialize(),
       success:function(d){
       if(d.state=="true")
       		{
				alert(d.msg);  
			 	parent.layer.closeAll();
		       	parent.location.reload();
       		}
       	else
       		{
       			alert(d.msg);
       		}
      
       }
   });

}
//时间显示
function getTime(){
    var datetime = new Date();
    var year = datetime.getFullYear();
    var month = datetime.getMonth()+1;
    var day = datetime.getDate();
    var hour = datetime.getHours();
    var minute = datetime.getMinutes();
    var second = datetime.getSeconds();
    var myxingqi=datetime.getDay() 
    var b=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六"); 
    hour = toLow(hour);
    minute = toLow(minute);
    second = toLow(second);
    var inner = year + '年' + month + '月' + day + '日' + ' ' + b[myxingqi];
    var time = hour + ':' + minute;
    // getElementsByClassName()获得的是一个数组，若要设置其中元素内容，要设置下标
    document.getElementsByClassName("timeHour")[0].innerHTML = time;
    document.getElementsByClassName("timeYear")[0].innerHTML = inner;
}
function toLow(n){			  	 
  	return n<10 ? '0'+n : n;
}
//总金额显示
function priceAll(){
     $.ajax({
	       type:"post",
	       url:"main_price",
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){
	              console.log(d.price);	    	
	    	      $("#priceAll").text(d.price);				    	     			
	       }
	   
	   });
}
//修改餐桌按钮颜色
//num:餐桌状态(0 1 2 3)
function cs_s(num)
{
	var c = "";
	 if(num == 0)
		 c="layui-btn-grey";
	 else if(num == 1)
		 c="layui-btn-orange";
	 else if(num == 2)
		 c="layui-btn-green";
	 else
		 c="layui-btn-blue";
	 return c;
}

//桌子按钮单击事件
//cl_id:餐桌id  sta:餐桌状态
var timenull = null;
function clc(cl_id , sta)
{
	clearTimeout(timenull);	
	timenull = setTimeout(function() {
		document.getElementById("right-content").innerHTML=""; 
		if(sta == 0)
		{
			layer.msg('该桌号空闲',{icon:6});
		}
		else if (sta ==1)
		{
			orderShow(cl_id);
		}
		else if(sta == 2)
			{
			//预定状态显示预定信息
			yuding_show(cl_id);
//			layer.msg('该桌号预约',{icon:6});
			}
		else 
			{
			layer.msg('打扫中',{icon:6});
			}
		
	}, 300);
}
//预定信息显示
//cl_id:餐桌id
function yuding_show(cl_id)
{
	  $.ajax({
	       type:"post",
	       url:"main_yuyue?index="+cl_id,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
	    	   console.log(date);
	    	 //预约信息显示
	    		layer.open({
	    			type:1,
	    			title:'预定信息查看',
	    			area:['300px','200px'],
	    			content:"<div class='layui-text' style='margin:5%;line-height:40px'><p>联系人：<span>"+date.name+"</span></p><p>手机号：<span>"+date.phone+"</span></p><p>预定时间：<span>"+date.time+"</span></p></div>"
	    	        ,shade: 0 //不显示遮罩		         				
	    		})
	       }
	  });
	
}
//预定弹窗
//ele_id:桌子id
function yuding(ele_id)
{
	layer.open({
		title:'预定信息提交',
        content: "<div id='layform'><form class='layui-form' id='reform'><div class='layui-form-item'><label class='layui-form-label'>联系人</label><div class='layui-input-block'><input type='text' name='name' lay-verify='title' autocomplete='off' placeholder='请输入姓名' class='layui-input'></div></div><div class='layui-form-item'><label class='layui-form-label'>手机号</label><div class='layui-input-block'><input type='text' name='phone' lay-verify='phone' autocomplete='off' placeholder='请输入手机号' class='layui-input'></div></div></form></div>"
        ,btn: ['提交', '关闭']
        ,btnAlign: 'c' //按钮居中
        ,shade: 0 //不显示遮罩
        ,yes:function(index){	
			 var date = $("#reform").serialize();	
			 //提交表单信息以及餐桌id和预定状态
			 console.log(date);
			 update_state_two(ele_id,2,date);
//        	 layer.close(index);        	
        	/*$.ajax({
        	       type:"post",
        	       url:"",
        	       dataType:"json",
        	       cache:false,
        	       async: false,
        	       data: $("#reform").serialize(),
        	       success:function(d){
	                    layer.msg('提交成功')
        	       }
        	   });*/
        	
		},
		
		btn2:function(){	
			layer.msg('关闭');
			//预定关闭返回该餐桌状态修改
			doube(ele_id);
		},
		
	})
	
}
//按钮触发双击事件修改餐桌状态
//ele_id:桌子id
function doube(ele_id)
{
	clearTimeout(timenull);
	layer.open({
			title: '修改餐桌状态',
			// content: '餐桌状态修改',
			// offset: 'c',
			skin: 'layui-layer-skin', //样式类名
			btn:['空闲','占用','预定','打扫中'],
			yes:function(){	
			    update_state(ele_id,0);
			},			
			btn2:function(){				
                update_state(ele_id,1);
			},
			btn3:function(){
				//预定信息填写弹窗
				yuding(ele_id);
			},
			btn4:function(){
				update_state(ele_id,3);
			}
		});
}
//餐桌状态修改（预定）
//id:餐桌状态  index:餐桌状态   datas:预定表单填写的数据
function update_state_two(id, index,datas)
{
	  $.ajax({
	       type:"post",
	       url:"main_state?id="+id+"&index="+index+"&"+datas,
	       dataType:"json",	      
	       cache:false,
	       async: false,
	       success:function(date){
	    	   layer.msg(date.msg,{icon:6});
	    	   tableShow();
	       }
	  });
	
}
//餐桌状态修改
//id:餐桌id, index:餐桌状态(0 1 2 3)
function update_state(id, index)
{
	  $.ajax({
	       type:"post",
	       url:"main_state?id="+id+"&index="+index,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
	    	   /*if(index == 2){
	    		   tableShow();
//		    	   layer.close(index);	
	    	   }else */
	    		if(date.state)
	    		{
	    		  layer.msg(date.msg,{icon:6});
	    		  //刷新一次
	    		  tableShow();
//	    		  layer.close(index);	    		  
	    		}else{
	    		   layer.msg(date.msg,{icon:5});
	    		   }
	       }
	  });
	
}
//桌子列表length
function tablebox(){
	$.ajax({
	       type:"post",
	       url:"main_table",
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){	    	    
	    	   var tablebox = $(".middle-center-tableLayout");
	    	   var n=[];
	    	   var tablength = 0;
	    	    for(var i = 0;i<d.length;i++){
	    	    	if(n.indexOf(d[i].position)==-1){
	    	    		n.push(d[i].position);
	    	    		tablength++;
	    	    	}	
	    	    }
	    	    for(var i = 0;i<tablength;i++){
	    	    	var divbox = document.createElement('div');
	    	    	    divbox.className='middle-center-tableList';
	    	    	    tablebox.append(divbox);
	    	    }
//	    	    var ele =  $(".middle-center-tableList");
//	    	    alert(ele.length);
	    	     
	       }
	   
	   });
}
//餐桌显示
function tableShow()
{
   $.ajax({
       type:"post",
       url:"main_table",
       dataType:"json",
       cache:false,
       async: false,
       success:function(d){
    	     var btns = $(".middle-center-tableList button");
    	     var ele =  $(".middle-center-tableList");
//    	     alert(ele.length);
    	     for(var i = 0;i<btns.length;i++){
    	    	 btns[i].parentNode.removeChild(btns[i]);
    	     }
    	     var posi = d[0].position; 
    	     for(var i = 0;i<d.length;i++){
    	    	 var pos = d[i].position;
    	    	 var id = d[i].houseid;
    	    	 var sta = d[i].status; 
    	    	 if(pos!=posi)
    	    		posi = pos;	    	 
    	    	 var abtn = "<button id='"+id+"' onclick='clc("+id+","+sta+")' ondblclick='doube("+id+")' class='layui-btn "+cs_s(sta)+"'>"+d[i].housename+"</button>";
    	    	 ele[--pos].innerHTML+=abtn; 
    	     }    	    
       }   
   });
}
//订单创建显示列表
//tableid:桌子id
function orderShow(tableid)
{
	if (tableid != undefined)
	{
   $.ajax({
       type:"post",
       url:"main_order?id="+tableid,
       dataType:"json",
       cache:false,
       async: false,
       success:function(date){
//    	   console.log(date);
    	       var state = date.status;
    	       var inner = '';
    	       if(state == 0){
    	    	  inner = "未结算";
    	       }else{
    	    	  inner = "已结算";
    	       }
//    	       var right_mid = $("#right-content");
    	       var ele = "";
    	       ele += "<div class='right-top'>"+						 
							"<ul class='mui-table-view'>"+
						    "<li class='mui-table-view-cell mui-media'>"+
						        "<a href='#'>"+						           
						            "<div class='mui-media-body'>"+
						                "<span class='title titleName mui-table-view-cell'>"+"订单列表"+"</span>"+ 
						                "<p class='mui-ellipsis mui-table-view-cell'>"+"订单号："+"<span id='orderNum'>"+date.number+"</span>"+"<span class='mui-badge mui-badge-inverted'><span class='mui-ellipsis'>"+"桌号&nbsp;"+"</span><span id='tableNum' class='mui-ellipsis' style='font-size: 30px'>"+date.table+"</span></span></p>"
						            +"</div>"+
						        "</a>"+
						    "</li>"+							     
						"</ul>"+						 
					"</div>"+
					"<div class='right-middle common-content'>"+
						/*"<div class='right-middle-top'>"+
							"<ul class='mui-table-view'>"+
							    "<li class='mui-table-view-cell mui-media'>"+
							        "<a href='#'>"+
							            "<img class='mui-media-object mui-pull-left' src='images/headMeb.png'>"+
							            "<div class='mui-media-body'>"+
							                "<span class='title mebTitle'>"+"会员名：孙先生</span>"+
							                "<p class='mui-ellipsis mebNum'>"+"会员号："+888888+"</p>"+
							            "</div>"+
							        "</a>"+
							    "</li>"+							     
						    "</ul>"+
						"</div>"+*/
						"<div class='devider2'></div>"+
						"<div class='right-middle-middle right-middle-scroll'>"+							 
							"<ul class='mui-table-view'>";
//			   right_mid.innerHTML+=ele;
    	     if(date.sel != undefined)
    	    	 {
	               for(var i = 0; i<date.sel.length;i++){
	            	   var goodsta = date.sel[i].userid;
	            	   var stainner;
	            	   if(goodsta==0){
	            		   stainner = '未上';
	            	   }else{
	            		   stainner = '已上';
	            	   }
	            	   ele +="<li class='mui-table-view-cell mui-media'>"+
								        "<a href='#'>"+
								            "<div class='mui-media-body'>"+							               
								                "<p class='mui-ellipsis mui-table-view-cell'>"+"<span class='title mebTitle'>"+date.sel[i].name+"</span>"+
								                	"<span class='mui-badge mui-badge-inverted'>"+"<span class='mui-ellipsis mebTitle'>"+"×"+"<label>"+date.sel[i].number+"</label>壶</span>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
								                			"<span class='mui-ellipsis title mebTitle'>"+date.sel[i].price+"</span>" +
								                					"&nbsp;&nbsp;<span onclick='goodsDel("+date.sel[i].sellingid+")' class='iconfont icon-shanchu'></span>" +
								                					"<span style='position:relative;top:2.5px' onclick='goodsAdd("+date.sel[i].sellingid+")' class='iconfont icon-tianjia'></span><span class='statues mui-badge "+cla_c(goodsta)+"' onclick='goodsta("+date.sel[i].typeid+","+date.houseid+")' style='position:relative;top:-1.5px'>"+stainner+"</span></span>"+
								                "</p>"+
								            "</div>"+
								        "</a>"+
								    "</li>";
	//            	   right_mid.innerHTML+=ele;
							   
	               }
    	    	 }
               ele += "</ul>"+    
				"</div>"+
				"<div class='right-middle-bottom'>"+
					"<div class='right-middle-bottom-pay'>"+
						"<p class='title mebNum'>消费总金额</p><p class='title mui-ellipsis'>"+date.price+"</p>"+
					"</div>"+					 
					"<div class='right-middle-bottom-pay'>"+
						"<div class=''><p class='mebNum'>"+"结账状况"+"</p><p class='title mebTitle'>"+inner+"</p></div>"+								
						"<button type='button' id='pay' class='mui-btn mui-btn-warning' onclick='pay("+date.number+","+date.houseid+")'>结算</button>"+
					"</div>"+
				"</div>"+				 						
			"</div>";
             document.getElementById("right-content").innerHTML=ele; 
//             console.log(date.bool);
             if(!date.bool){
            	 $('#pay').attr('disabled','disabled');
             }            
       }
   
   
   });
	}
}
//结算页面
//number:订单号  table:桌子id
function pay(number,table){	
	$.ajax({
	       type:"post",
	       url:"main_number?number="+number+"&id="+table,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){	
	    	   if(d.bool==true){
	            	 //alert('1');	            	 
	            	 $('#mebrebate').css('display','block');           	
	             }else{            	
	            	 $('#mebrebate').css('display','none');
	             } 
	    	   var html = document.getElementById('goodslists');
	    	   var htmlele='';
	    	   for(var i = 0;i<d.sel.length;i++){
	    		   htmlele+='<li class="mui-table-view-cell mui-media">'+
			        '<a href="javascript:;">'+
			            '<div class="mui-media-body">'+
			                '<p class="mui-ellipsis mui-table-view-cell">'+
			                '<span class="title mebTitle">'+d.sel[i].name+'</span>'+
			                	'<span class="mui-badge mui-badge-inverted">'+
			                	'<span class="mui-ellipsis mebTitle">×<label>'+d.sel[i].number+'</label>壶</span>'+
			                	'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
			                	'<span class="mui-ellipsis title mebTitle">'+d.sel[i].price+'</span>'+
			                	/*'&nbsp;&nbsp;<span class="iconfont icon-shanchu"></span>'+
			                	'<span class="iconfont icon-tianjia"></span>'+*/
			                '</span>'+
			                '</p>'+
			            '</div>'+
			        '</a>'+
			    '</li>'
	    	   }
	    	   html.innerHTML=htmlele;
	    	   var summoney = document.getElementById('summoney');
	    	   summoney.innerHTML=d.price;
	    		var index = layer.open({
	    			title:'订单号：'+d.number,
					type: 1,
					shade: false,
					btn:['确认支付','取消'],
					btnAlign:'c',
					// offset:'t',   //弹出框位置
					closeBtn:1,      //按钮位置
	                anim: 1,         //弹窗弹出动画
	                maxmin:true,
	                fixed:true,
					skin: 'layui-layer-molv', //加上边框
					area: ['500px', '400px'], //宽高
					content: $("#layform1"),   //引入html内容
					yes:function(index,layero){
	                    layer.close(index);
	                    if(1==0){                    	
	                    	layer.confirm('是否打印订单？', {
	                    		btn:['打印','关闭'],
	                    		skin: 'layui-layer-molv',
	                    		btnAlign: 'c',
	                    		}, 
	                    		function(){
	                    		  layer.msg('打印', {icon: 1});
	                    		  //支付完成后该餐桌状态更新，该订单删除
	                    		  //update_state(table,0);
	                    		}, 
	                    		function(){
	                    		  layer.msg('支付关闭', {});
	                    	});
	                    }else{
	                    	layer.confirm('返回重新选择支付方式？', {
	                    		btn:['返回','关闭'],
	                    		skin: 'layui-layer-molv',
	                    		btnAlign: 'c',
	                    		}, 
	                    		function(index,layero){
//	                    		  layer.msg('返回', {icon: 1});
	                    			layer.close(index);
	                    			pay(number,table);
	                    		}, 
	                    		function(){
	                    		  layer.msg('支付关闭', {});
	                    	});
	                    }	               
					},
					btn2:function(index,layero){
					}
				});
	       }
	
	})
  
}
 
//商品种类列表
function category(){
	$.ajax({
	       type:"post",
	       url:"main_type",
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){
	    	   var ulele = $(".layui-tab-title");
	    	   var tabcon = document.getElementById("layui-tab-content");
               var ele="";
	    	      	for(var i = 0;i<d.length;i++){
	    	      		if(i==0){
	    	      			ulele.append("<li class='layui-this'>"+d[i].type_name+"</li>");	    	      			
//	    	      			ele+="<div class='layui-tab-item layui-show'>"+									    	  
//                          "<div class='mui-table-view-list'>"+
//                          goodslist(d[i].type_id);							    	 
//					    +"</div>";
	    	      			ele+="<div class='layui-tab-item layui-show'>"+					    	  
                              "<div class='mui-table-view-list'>"+goodslist(d[i].type_id)+"</div>"+"</div>";
	    	      		}else{
	    	      			ulele.append("<li>"+d[i].type_name+"</li>");
	    	      			ele+="<div class='layui-tab-item'>"+
					    	  
                            "<div class='mui-table-view-list'>"+
									 
                                   goodslist(d[i].type_id)+
			                    "</div>"+
						    	 
						    "</div>";
	    	      		}	    	      		
	    	      	}
	    	      	tabcon.innerHTML=ele;
	       }
	   
	   });
}
//商品列表
//type_id:商品种类id
function goodslist(type_id){
	var eles="";
	$.ajax({
	       type:"post",
	       url:"main_value?id="+type_id,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
	    	   if(date != null)
	    		   {
		    	    for(var i = 0;i<date.length;i++){
		    	    	//其他商品操作
		    	    	if(type_id==6){
		    	    		eles+="<div class='mui-card pattern-list'>"+				 
							    "<div class='mui-card-header'>"+
							      "<img class='w100' src='images/goods.png' onclick=''/>"+
								"</div>"+
								/*"<div class='mui-card-content'>"+
									"<div class='mui-card-content-inner'>"+
										"<p>"+date[i].name+"</p>"+
									"</div>"+
								"</div>"+*/
								"<div class='pattern-list__p'>"+
									"<p class=''>续杯茶品</p>"+
									"<p class='font-color-gray'><a href='#'><span onclick='othrebate()' class='iconfont icon-tianjia'></a></p>"+
								"</div>"+				
				            "</div>";
		    	    	}else{   
		    	    		eles+="<div class='mui-card pattern-list'>"+				 
						    "<div class='mui-card-header'>"+
						      "<img class='w100' src='images/goods.png'/>"+
							"</div>"+
							"<div class='mui-card-content'>"+
								"<div class='mui-card-content-inner'>"+
									"<p>"+date[i].name+"</p>"+
								"</div>"+
							"</div>"+
							"<div class='pattern-list__p'>"+
								"<p class='font-color-pink'>￥<label>"+date[i].price+"</label></p>"+
								"<p class='font-color-gray'><a href='#'><span onclick='goodsAdd("+date[i].sellingid+")' class='iconfont icon-tianjia'></a></p>"+
							"</div>"+				
			            "</div>";
		    	    	}
		    	    	//start
		    	    	/*eles+="<div class='mui-card pattern-list'>"+				 
						"<div class='mui-card-header'>"+
						"<img class='w100' src='images/goods.png'/>"+
					"</div>"+
					"<div class='mui-card-content'>"+
						"<div class='mui-card-content-inner'>"+
							"<p>"+date[i].name+"</p>"+
						"</div>"+
					"</div>"+
					"<div class='pattern-list__p'>"+
						"<p class='font-color-pink'>￥<label>"+date[i].price+"</label></p>"+
						"<p class='font-color-gray'><a href='#'><span onclick='goodsAdd("+date[i].sellingid+")' class='iconfont icon-tianjia'></a></p>"+
					"</div>"+				
	            "</div>";*/
		    	    	//end
		    	    }
		    	    
	    		   }
	       }
	  });
	 return eles;	
}

//其他商品（续杯，打折）
function othrebate(){
//	var ordernum = document.getElementById("orderNum").innerText;
	var rebox=$("#rebategs");
	var rebox1=$("#rebategs1");
	var ele = '';
	for(var i=0;i<10;i++){
		ele+='<div class="mui-card pattern-list">'+				 
				'<div class="mui-card-header">'+	
					'<img class="w100" src="images/goods.png"/>'+	
				'</div>'+	
				'<div class="mui-card-content">'+	
					'<div class="mui-card-content-inner" >'+	
						'<p>碧螺春</p>'+	
					'</div>'+	
				'</div>'+	
				'<div class="pattern-list__p">'+	
					'<p class="font-color-pink">￥<label>128</label></p>'+	
					'<p class="font-color-gray"><a href="#"><span class="iconfont icon-tianjia"></span></a></p>'+	
				'</div>'+					
            '</div>'
	}
	rebox.html(ele);
	
	layer.open({
		title:'续杯商品查看',
		type: 1,
		shade: false,
		//btn:['确定','取消'],
		//btnAlign:'c',
		// offset:'t',   //弹出框位置
		closeBtn:1,      //按钮位置
        anim: 1,         //弹窗弹出动画
        maxmin:true,
        fixed:true,
		skin: 'layui-layer-molv', //加上边框
		area: ['700px', '500px'], //宽高
		content: $("#regoods"),   //引入html内容
		/*yes:function(index,layero){
			
            layer.close(index);
		},
		btn1:function(index,layero){
           
		}*/
	});
}

//添加商品数量
//id:商品id
function goodsAdd(id){	
	var ordernum = document.getElementById("orderNum").innerText;
//	var tablenum = document.getElementById("tableNum").innerText;
	$.ajax({
	       type:"post",
	       url:"main_selling?number="+ordernum+"&id="+id,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
                if(date.state == "true"){
                	layer.msg('商品添加成功',{icon:6});
                	//date.id:餐桌id
                	orderShow(date.id);
                }else{               	 
                	layer.msg('添加失败',{icon:5});
                } 
	       }
	  });
	 
	
}
//减少商品数量
//id:商品id
function goodsDel(id){
//	ordernum:订单编号，id:商品id
	var ordernum = document.getElementById("orderNum").innerText;
	$.ajax({  
	       type:"post",
	       url:"main_delgoods?number="+ordernum+"&id="+id,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
                if(date.state == "true"){
                 	layer.msg('商品删除成功',{icon:6});
                	orderShow(date.id);
                }else{
                	layer.msg('删除失败',{icon:5});
                } 
	       }
	  });
}
//商品上桌状态
function cla_c(stas){
	var cla ='';
	if(stas==0)
		cla = 'mui-badge-danger';
	else 
		cla = 'mui-badge-success';
	return cla;
}
//obj:当前对象   goodid:商品id  goodsta:typeid tableid:餐桌id
function goodsta(goodsta,tableid){
	$.ajax({  
	       type:"post",
	       url:"main_sellingstate?id="+goodsta,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
                 
	       }
	  });
	orderShow(tableid);
}



