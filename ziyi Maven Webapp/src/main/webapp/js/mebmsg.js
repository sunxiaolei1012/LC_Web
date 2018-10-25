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
	var mebmsg = $('#mebmsg');
    var mebOrdermsg = $('#mebOrdermsg');
    var mebhtml='';
    var meborder='';
    //for (var i = 0; i < 4; i++) {
    	mebhtml+='<tr><td>name</td>'+
				      '<td>2016-11-29</td>'+
				      '<td>1314</td></tr>';
    //}
    mebmsg.html(mebhtml);
     for (var i = 0; i < 17; i++) {
    	meborder+='<tr><td>201810231314</td>'+								 							  
					'<td>1314</td>'+								 							  
					'<td>20181023</td>'+								 							  
					'<td>'+
						'<a href="javascript:detail();" class="layui-btn layui-btn-mini">详情</a>'+
					'</td></tr>';
    }
    mebOrdermsg.html(meborder); 
}
//会员消费记录详情
function detail(){
    	// alert('订单详情');
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
		/*yes:function(index,layero){4+·
			
            layer.close(index);
		},
		btn1:function(index,layero){
           
		}*/
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
	 	 					'<td>1314</td>'+								 							  
	 						'<td>20181023</td>'+								 							  
	 						'<td>'+
	 							'<a href="javascript:detail();" class="layui-btn layui-btn-mini">详情</a>'+
	 						'</td></tr>';
	    	    		 }
	    	    	 }
	    	    	 else
	    	    	{
	    	    		 meborder +='<tr><td>201810231314</td>'+								 							  
		 					'<td>1314</td>'+								 							  
							'<td>20181023</td>'+								 							  
							'<td>'+
								'<a href="javascript:detail();" class="layui-btn layui-btn-mini">详情</a>'+
							'</td></tr>';
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