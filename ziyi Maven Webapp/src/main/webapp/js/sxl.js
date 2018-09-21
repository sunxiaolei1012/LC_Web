	
	
function newCard()
		  {
		     $.ajax({
		         type:"post",
		         url:"Card_openCard",
		         dataType:"json",
		         cache:false,
		         async: false,
		         data: $("#form2").serialize(),
		         success:function(d){
		         if(d!=0)
		         		{
		  				
		  			 	parent.layer.closeAll();
		  		       	parent.location.reload();
		         		}
		         	else
		         		{
		         	}
		         }
		     });
		  } 
		  
		  
function sellCard()
                     { 
                     	layer.open({
					      type: 2,
					      title: "编辑",				       
					      area: ['1000px', '600px'],
					      content: "Card_sellCard",
					      cancel: function (index, layero) {
					        $(".dw-refresh").trigger('click');
					        return true;
					      }
					    });
                     }
			


		  
		  function opens()
          { 
          	layer.open({
			      type: 2,
			      title: "编辑",				       
			      area: ['1000px', '600px'],
			      content: "openCard.jsp",
			      cancel: function (index, layero) {
			        $(".dw-refresh").trigger('click');
			        return true;
			      }
			    });
          }
		  function sumPrice()
          { 
          	layer.open({
			      type: 2,
			      title: "编辑",				       
			      area: ['1000px', '600px'],
			      content: "Order_sumPrice",
			      cancel: function (index, layero) {
			        $(".dw-refresh").trigger('click');
			        return true;
			      }
			    });
          }
	
		  
		  