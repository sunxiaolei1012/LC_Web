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


