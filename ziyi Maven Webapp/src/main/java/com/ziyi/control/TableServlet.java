package com.ziyi.control;

import java.util.Date;
import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.JDBC;
import com.cyb.util.Tools;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.Tea_House;
/**
 * 用来处理餐桌点餐
 * @author 陈玉博
 * @date 2018年9月12日下午1:15:46
 */
public class TableServlet extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//桌子编号ID
	private String id;
	
	/**
	 * 主界面信息获取
	 */
	public String main()
	{  
		
		//1、获取所有桌子信息
		List<Tea_House> list_house = Common.HOUSE.select_House();
		//2、查询今日营业额
		float sum_price = new JDBC().sum_order(Common.df_day.format(new Date()));
		
		//设置返回
		ActionContext.getContext().put("table", list_house);
		ActionContext.getContext().put("sum_price", sum_price);
		return "main";
	}
	/**
	 * 根据桌子id  获取桌子信息
	 * @return
	 */
	public void table_state()
	{
		//1、根据ID 获取信息
		if(null != id && !id.equals(""))
		{
			Tea_House house = Common.HOUSE.select_House_id(new Integer(id));
			
			if(house != null && !house.getStatus().equals(0))
			{
				//根据房屋状态查询房屋订单信息
				Order order = Common.ORDER.select_houseid_state(0, house.getHouseid());
				new Tools().return_object(new Gson().toJson(order));
			}
		}
		
	}
	
	
	
	
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
