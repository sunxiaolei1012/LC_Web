package com.ziyi.control;

import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Tools;
import com.opensymphony.xwork2.ActionSupport;

public class XuBeiControl extends ActionSupport {

	
	private String number;
	private String sellingid;
	public String set()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		boolean bool = Common.ORDER.update_number_xubei(number, sellingid);
		if(bool)
		{
			map.put("state",true);
			map.put("msg", "ok");
		}
		else
		{
			map.put("state",false);
			map.put("msg", "error");
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
