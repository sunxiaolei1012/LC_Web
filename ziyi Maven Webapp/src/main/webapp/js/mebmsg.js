layui.use(['element','table','layer','form','layedit', 'laydate','laypage'], function(){
		var element = layui.element;
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var layedit = layui.layedit
  		var laydate = layui.laydate; 
		var laypage = layui.laypage;
		laypage.render({
		    elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
		    ,count: 50 //数据总数，从服务端得到
		    ,limit:10
		  });
    });	   
//会员卡查询框
function mebshow(){
	layer.open({
		title:'会员卡信息',
		type: 2,
		shade: false,
		//btn:['确定','取消'],
		//btnAlign:'c',
		// offset:'t',   //弹出框位置
		closeBtn:1,      //按钮位置
        anim: 1,         //弹窗弹出动画
        maxmin:true,
        fixed:true,
		skin: 'layui-layer-molv', //加上边框
		area: ['800px', '600px'], //宽高
		content: 'mebcard.jsp',   //引入html内容		 
	});
}
//会员卡号，提交
function submitmsg(){
	
	//输入框获取（输入）卡号
	var cardnum = $('#cardnum').val();
//	console.log(cardnum);
	//会员卡信息
	var mebmsg = $('#mebmsg');
	mebmsg.html('');
	//订单信息列表
    var mebOrdermsg = $('#mebOrdermsg');
    mebOrdermsg.html('');
    var mebhtml='';
    var meborder='';
	if(cardnum.length!=0){
		$.ajax({
	       type:"post",
	       url:"Card_checkCardByNnmber?number="+cardnum,
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){
	    	   //d==0:无此卡信息 d==1:无消费信息
	    	   if(d==0){
	    		   layer.msg('无此卡信息');
	    	   }else if(d==1){
	    		   layer.msg('此卡无消费信息');
	    	   }else{	    		   
		    	   //会员卡信息
	    		        var remoney = (d.card.remain).toFixed(2);
		    	    	mebhtml+='<tr><td>'+d.card.name+'</td>'+
		    					      '<td>'+d.card.selltime+'</td>'+
		    					      '<td>'+remoney+'</td></tr>';
		    	   //消费记录
		    	   for (var i = 0; i < d.order.length; i++) {
		    	    	meborder+='<tr><td>'+d.order[i].number+'</td>'+								 							  
		    						'<td>'+d.order[i].pay_price+'</td>'+								 							  
		    						'<td>'+d.order[i].checkouttime+'</td>'+								 							  
		    						'<td>'+
		    							'<a href="javascript:detail('+d.order[i].orderid+');" class="layui-btn layui-btn-mini">详情</a>'+
		    						'</td></tr>';
		    	    }
	    	   }
	    	   mebmsg.html(mebhtml);
	    	   mebOrdermsg.html(meborder);
	       }
	   });
	}else{
//		alert(1);
		layer.msg('会员卡号为空，请输入要查询的会员卡号！');
	}
	
}
//会员消费记录详情，订单id：orderid
function detail(orderid){
		$.ajax({
		       type:"post",
		       url:"Card_checkOrderList_cardid?orderid="+orderid,
		       dataType:"json",
		       cache:false,
		       async: false,
		       success:function(d){
//		    	   alert(1);
		    	    var goods = $('#goodslists');
			   	    var goodshtml = '';
			   	    for(var i=0;i<d.value.length;i++){
			   	    	goodshtml+='<li class="mui-table-view-cell mui-media">'+
			   		        '<a href="javascript:;">'+
			   		            '<div class="mui-media-body">'+
			   		                '<p class="mui-ellipsis mui-table-view-cell"><span class="title mebTitle">'+d.value[i].name+'</span>'+
			   		                	'<span class="mui-badge mui-badge-inverted">'+
			   		                	'<span class="mui-ellipsis mebTitle">×<label>'+d.value[i].number+'</label>'+d.value[i].unit+'</span>'+
			   		                	'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+
			   		                	'<span class="mui-ellipsis title mebTitle">'+d.value[i].price+'</span>'+
			   		                	'</span>'+
			   		                '</p>'+
			   		            '</div>'+
			   		        '</a>'+
			   		    '</li>';	   	
			   	    }
			   	    goods.html(goodshtml);
			   	    //消费总额
			   	    $('#cmoney').text(d.xfprice);
			   	    //实际支付
			   	    $('#paymoney').text(d.allprice);
					   	 layer.open({
					 		title:'会员卡信息详情',
					 		type: 1,
					 		shade: false,
					 		closeBtn:1,      //按钮位置
					         anim: 1,         //弹窗弹出动画
					         maxmin:true,
					         fixed:true,
					 		skin: 'layui-layer-molv', //加上边框
					 		area: ['400px', '400px'], //宽高
					 		content: $("#ordetail"),   //引入html内容
					 		
					 	});
			       },
			       error:function(){
			    	   layer.msg('请求出错');
			       }
		   }); 	
}  




function read_card_select()
{
	 $.ajax({
	       type:"post",
	       url:"card_selectcard",
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){
	    	console.log(d);
	       if(d.state=="true")
	       		{
	    	   		$("#cardnum").val(d.card.number);
	    	   		var str = '<tr><td>'+d.card.name+'</td>'+
				      '<td>'+d.card.selltime+'</td>'+
				      '<td>'+d.card.remain+'</td></tr>';
	    	    	 $('#mebmsg').html(str);
	    	    	 var meborder ='';
	    	    	
	    	    	 if(d.order != "false")
	    	    	 {
	    	    		 for(var i =0 ; i<d.order.length;i++)
	    	    		 {
	    	    			 meborder +='<tr><td>'+d.order[i].number+'</td>'+								 							  
	 	 					'<td>'+d.order[i].price+'</td>'+								 							  
	 						'<td>'+d.order[i].checkouttime+'</td>'+								 							  
	 						'<td>'+
	 							'<a href="javascript:detail('+d.order[i].orderid+');" class="layui-btn layui-btn-mini">详情</a>'+
	 						'</td></tr>';
	    	    		 }
	    	    	 }
	    	    	 else
	    	    	{
	    	    		 meborder +='<tr><td colspan="4" style="text-align:center;">暂无数据</td>'
	    	    		 /*meborder +='<tr><td>201810231314</td>'+								 							  
		 					'<td>1314</td>'+								 							  
							'<td>20181023</td>'+								 							  
							'<td>'+
								'<a href="javascript:detail();" class="layui-btn layui-btn-mini">详情</a>'+
							'</td></tr>';*/
	    	        }
	    	    	 $('#mebOrdermsg').html(meborder);
	    	    	 
	       		}
	       	else
	       		{
	       			alert(d.msg);
	       		}
	      
	       }
	   });
}