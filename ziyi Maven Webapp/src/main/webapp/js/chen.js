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
			layer.msg('该桌号预约',{icon:6});
			}
		else 
			{
			layer.msg('打扫中',{icon:6});
			}
		
	}, 300);
	
	/*timenull = setTimeout(function() {
		$.ajax({
		       type:"post",
		       url:"main?id="+id+"&status="+status,
		       dataType:"json",
		       cache:false,
		       async: false,
		       success:function(date){
		    	     
		       }
		  });
		
		
}, 300);*/
	
}

//按钮触发双击事件修改餐桌状态
function doube(ele_id)
{
	clearTimeout(timenull);
//	console.log("2");
//	var ele = $(this);
//	var ele_id = id;
//	var sta = state;
	layer.open({
			title: '修改餐桌状态',
			// content: '餐桌状态修改',
			// offset: 'c',
			skin: 'layui-layer-skin', //样式类名
			btn:['空闲','占用','预定','打扫中'],
			yes:function(){	
			    update_state(ele_id,0);
//			    layer.close(index);
			},
			
			btn2:function(){
                update_state(ele_id,1);
			},
			btn3:function(){
				update_state(ele_id,2);
			},
			btn4:function(){
				update_state(ele_id,3);
			}
		});
}
//餐桌状态修改
function update_state(id, index)
{
	  $.ajax({
	       type:"post",
	       url:"main_state?id="+id+"&index="+index,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
	    	   if(date.state)
	    		{
	    		  layer.msg(date.msg,{icon:6});
	    		  //刷新一次
	    		  tableShow();
	    		  layer.close(index);	    		  
	    		}
	    	   else
	    		   {
	    		   layer.msg(date.msg,{icon:5});
	    		   }
	       }
	  });
	
}

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
//    	   alert("123");
    	       var state = date.status;
    	       if(state == 0){
    	    	  var inner = "未结算";
    	       }else{
    	    	  var inner = "已结算";
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
						"<div class='right-middle-top'>"+
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
						"</div>"+
						"<div class='devider2'></div>"+
						"<div class='right-middle-middle right-middle-scroll'>"+							 
							"<ul class='mui-table-view'>";
//			   right_mid.innerHTML+=ele;
    	     if(date.sel != undefined)
    	    	 {
	               for(var i = 0; i<date.sel.length;i++){
	            	   ele +="<li class='mui-table-view-cell mui-media'>"+
								        "<a href='#'>"+
								            "<div class='mui-media-body'>"+							               
								                "<p class='mui-ellipsis mui-table-view-cell'>"+"<span class='title mebTitle'>"+date.sel[i].name+"</span>"+
								                	"<span class='mui-badge mui-badge-inverted'>"+"<span class='mui-ellipsis mebTitle'>"+"×"+"<label>"+date.sel[i].number+"</label>壶</span>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
								                			"<span class='mui-ellipsis title mebTitle'>"+date.sel[i].price+"</span>" +
								                					"&nbsp;&nbsp;<span onclick='goodsDel("+date.sel[i].sellingid+")' class='iconfont icon-shanchu'></span>" +
								                					"<span onclick='goodsAdd("+date.sel[i].sellingid+")' class='iconfont icon-tianjia'></span></span>"+
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
						"<button type='button' class='mui-btn mui-btn-warning'>结算</button>"+
					"</div>"+
				"</div>"+				 						
			"</div>";
             document.getElementById("right-content").innerHTML=ele; 
       }
   
   
   });
	}
}
//结算页面
function pay()
{
	layer.open({
		  type: 1,
		  title: false,
		  closeBtn: 0,
		  shadeClose: true,
		  skin: 'yourclass',
		  content: ''
		});
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
//					    alert("1");
	    	      		}else{
	    	      			ulele.append("<li>"+d[i].type_name+"</li>");
	    	      			ele+="<div class='layui-tab-item'>"+
					    	  
                            "<div class='mui-table-view-list'>"+
									 
                                   goodslist(d[i].type_id)+
			                    "</div>"+
						    	 
						    "</div>";
//						    alert("1");
	    	      		}	    	      		
	    	      	}
//	    	      	$(".layui-tab-content").innerHTML = ele;
	    	      	tabcon.innerHTML=ele;
//	    	      	console.log(ele);
	       }
	   
	   });
}
//商品列表
function goodslist(type_id){
	var eles="";
	$.ajax({
	       type:"post",
	       url:"main_value?id="+type_id,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(date){
	    	   
	    	    for(var i = 0;i<date.length;i++){
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
//	    	    alert("1");
	    	   
	       }
	  });
	 return eles;
	
}

//添加商品
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
                	orderShow(date.id);
                }else{               	 
                	layer.msg('添加失败',{icon:5});
                } 
	       }
	  });
	 
	
}
//减少商品数量
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

      
 
