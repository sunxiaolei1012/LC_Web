package com.ziyi.control;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.JDBC;
import com.cyb.util.Tools;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Tea_House;

/**
 * 主页面请求
 * @author 陈玉博
 * @date 2018年9月19日上午9:43:02
 */
public class MainServlet extends ActionSupport{

	
	
	public String price()
	{
		//1、获取所有桌子信息
		
		Map<String , String> map = new HashMap<String , String>();
		map.put("price", "3572.50");
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}
	
	public String table()
	{
		List<Tea_House> list_house = Common.HOUSE.select_House();
		//2、查询今日营业额
		float sum_price = new JDBC().sum_order(Common.df_day.format(new Date()));
		new Tools().return_object(new Gson().toJson(list_house));
		return "json";
	}
	
	
	
}
