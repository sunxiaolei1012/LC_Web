package com.ziyi.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Tools;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Order;

public class XuBeiControl extends ActionSupport {

	
	private String number;
	private String sellingid;
	public String set()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		
		Order order= Common.ORDER.select_number_order(number);
	  //查询订单是否已经点单
		if(order.getPrice()==0 && order.getPrice()==null) {
			map.put("state",false);
			map.put("msg", "还没点茶，不能续杯");
		}else {
		
	
		//查询订单内是否已续杯
		if(order.getXubei()!=null && order.getXubei()!=0) {
			map.put("state",false);
			System.out.println(order.getXubei());
			map.put("msg", "已经有续杯");
			
		}else {
		  boolean bool = Common.ORDER.update_number_xubei(number, sellingid);
		   if(bool)
		     {
			   
				map.put("state",true);
				map.put("msg", "ok");
				map.put("id",order.getHouseid() );
		     }
				else
				{
					map.put("state",false);
					map.put("msg", "error");
				}
			}
		}
		new Tools().return_object(Common.gson.tojson(map));
		//设置续杯
		return "json";
	
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getSellingid() {
		return sellingid;
	}
	public void setSellingid(String sellingid) {
		this.sellingid = sellingid;
	}
	
	
}
