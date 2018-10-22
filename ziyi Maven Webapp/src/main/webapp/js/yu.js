function add_price(func,cmd)
{
   $.ajax({
       type:"post",
       url:func+"_"+cmd,
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
function add_old(func,cmd)
{
   $.ajax({
       type:"post",
       url:func+"_"+cmd,
       cache:false,
       dataType:"json",
       async: false,
       data: $("#form2").serialize(),
       success:function(d){
    	   alert(d.msg);
       }
   });

}

//读卡
function read_card()
{
	 $.ajax({
	       type:"post",
	       url:"card_yu",
	       dataType:"json",
	       cache:false,
	       async: false,
	       success:function(d){
	       if(d.state=="true")
	       		{
//	       			console.log(d);
					alert("已激活该卡");
	    	   		$("#chongzhi").text("已激活该卡");
	    	   		$("#tijiaos").attr('disabled',true);
	       		}
	       	else
	       		{
	       			
	       			$("#chongzhi").text(d.msg);
	       			if(d.button=="true")
	       				$("#tijiaos").attr('disabled',false);
	       			else
	       				$("#tijiaos").attr('disabled',true);
	       		}
	      
	       }
	   });
}