

	function delImage(id){
		$.ajax({
			url:"upload_delImage",
			data:"id="+id,
			type:"POST",
			SUCCESS:function(message){
				if(message!=0){
					alert("删除成功！");
				}else{
					alert("删除失败！");
					
				}
				
				
			}
			
			
			
		})
		location.reload()
	}
