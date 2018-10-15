package com.ziyi.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.JDBC;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.dao.YuYueDao;
import com.ziyi.dao.impl.YuYueDaoImpl;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.Order_list;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Selling_type;
import com.ziyi.pojo.Tea_House;
import com.ziyi.pojo.Users;
import com.ziyi.pojo.YuYue;

/**
 * 主页面请求
 * @author 陈玉博
 * @date 2018年9月19日上午9:43:02
 */
public class MainServlet extends ActionSupport{

	private String id;
	private String index;
	private String number;
	
	
	private String name;
	private String phone;
	private String state;
	
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
	
	public String state()
	{
		boolean bool = Common.HOUSE.update_house_tea(new Integer(id), new Integer(index));
//		Tea_House tea = Common.HOUSE.select_House_id(new Integer(id));
		Order order = Common.ORDER.select_houseid_state(0, new Integer(id));
		if(index.equals("1"))
		{
			create();
		}
		else if (index.equals("2"))
		{
			YuYueDao yu = new YuYueDaoImpl();
			YuYue yy = new YuYue();
			yy.setName(name);
			yy.setPhone(phone);
			yy.setState(0);
			yy.setTid(new Integer(index));
			yy.setTime(Common.df.format(new Date()));
			yu.insert_yuyue(yy);
		}
		else
		{  
			try{
				Common.ORDER.delete_order_list(order.getOrderid());
			}
			catch(Exception e)
			{
				System.out.println("状态不在");
			}
			//3其他
		}
		
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		return "json";
		
	}
	/**
	 * 预约
	 * @return
	 */
	public String yuyue()
	{
		YuYueDao yu = new YuYueDaoImpl();
		YuYue yuyue = yu.select_yuyue_tid(new Integer(index));
		Common.TOOLS.return_object(new Gson().toJson(yuyue));
		return "json";
	}
	
	public String order()
	{
		if(id != "undefined")
		{
			Order order = Common.ORDER.select_houseid_state(0, new Integer(id));
			Map<String,Object> map = new HashMap<String , Object>();
			map.put("number", order.getNumber());
			map.put("ordertime", order.getOrdertime());
			map.put("price", order.getPrice());
			map.put("status", order.getStatus());
			Users user = (Users) ActionContext.getContext().getSession().get("user");
			if(user.getUserrole().equals("3"))
				map.put("bool", false);
			else
				map.put("bool", true);
			map.put("table", Common.HOUSE.select_House_id(new Integer(id)).getHousename());
			
			List<Order_list> order_list = Common.OLD.select_number_order(order.getOrderid());
			if(order_list != null)
			{
				List<Selling_list> selling_list = new ArrayList<Selling_list>();
				for (Order_list se : order_list) {
					Selling_list sl = Common.SLD.selecct_id_list(se.getSellingid());
					sl.setNumber(se.getNumber());
					selling_list.add(sl);
				}
				
				map.put("sel", selling_list);
			}
			Common.TOOLS.return_object(new Gson().toJson(map));
			
		}
		return "json";
	}

	/**
	 * 获取商品类别
	 * @return
	 */
	public String type()
	{
		List<Selling_type> list = Common.STYPE.select_selling_type();
		Common.TOOLS.return_object(new Gson().toJson(list));
		return "json";
	}
	
	/**
	 * 获取商品
	 * @return
	 */
	public String value()
	{
		//根据类别ID 查询其对应商品信息
		int a = 1;
		if(id != null && !id.equals(""))
			a= new Integer(id);
		List<Selling_list> list = Common.SLD.select_selling_type(a);
//		System.out.println(list.size());
		Common.TOOLS.return_object(new Gson().toJson(list));
		return "json";
	}
	
	
	public String selling()
	{
		boolean bool = false;
		String trues = null;
		String falses = null;
		Map<String , String> map = new HashMap<String , String>(); 
		if(number != null && id != null)
		{
			//1、查询订单是否存在
			Order order = Common.ORDER.select_number_order(number);
			//2、查询商品是否存在
			Selling_list sl = Common.SLD.selecct_id_list(new Integer(id));
			if(null == order)
			{
				falses = config.ORDER_NULL_ERROR_MSG;
			}
			else if (null == sl)
			{
				falses = config.SELLING_NULL_ERROR_MSG;
			}
			else
			{
//				order.setPrice(sl.getPrice());
				boolean bool_s = Common.ORDER.update_number_order(number, order.getPrice()+sl.getPrice());
				if(bool_s)//修改成功
				{
					//根据订单与商品表 查询是否有数据
					int goods = new Integer(id);
					Order_list order_list = Common.OLD.select_number_order(order.getOrderid(), goods);
					boolean bools = false;
					if(null != order_list)
					{
						bools = Common.OLD.update_id_numbers(order_list.getId(),1+order_list.getNumber());
					}
					else
					{
						Order_list ol = new Order_list();
						ol.setOrderid(order.getOrderid());
						ol.setSellingid(goods);
						ol.setNumber(1);
						bools = Common.OLD.insert_order_list(ol);
					}
					
					if(bools)
					{
						
						map.put("state", "true");
						map.put("msg", config.XIU_USER_RIGHT_MSG);
						map.put("id", ""+order.getHouseid());
						Common.TOOLS.log_time("在订单："+number+"中添加了商品："+sl.getName(), 7);
					}
					else
					{
						//添加失败 数据回滚
						Common.ORDER.update_number_order(number, order.getPrice());
					}
					
				}
			}
		}
		if(map.get("state") != null)
		{
			Common.TOOLS.return_object(new Gson().toJson(map));
		}
		else
		{
			Common.TOOLS.return_map_object(bool, trues, falses);
		}
		
		return "json";
	}
	
	
	/**
	 * 创建订单
	 * @return
	 */
	/**
	 * 创建订单  //返回订单编号
	 */
	public void create()
	{
		if(id != null && !id.equals(""))
		{
			//1、uuid正确 生成订单 订单号 年月日时分+4位随机数
			String number = new Tools().return_orderid();
			//2、添加订单信息
			Order order = new Order();
			order.setNumber(number);
			order.setOrdertime(Common.df.format(new Date()));
			order.setPrice(0.00);
			order.setUserid(1);
			order.setStatus(0);
			order.setType(0);
			order.setCheckouttime("");
			order.setPay_price(0.00);
			order.setHouseid(new Integer(id));
			order.setCardid(null);
			boolean bool = Common.ORDER.insert_number_order(order);
			if(bool)
			{
				Common.TOOLS.log_time("1创建了订单："+number, 6);
				Common.TOOLS.return_map_object(true, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
			}
			else
			{
				Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
			}
		}
		else
		{
			Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
		}
		
	}
	
	
	/**
	 * 根据uuid number goodsid 删除一个商品
	 */
	public void delgoods()
	{
		if (null == number)
		{
			Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ORDER_NULL_ERROR_MSG);
		}
		else if( null == id)
		{
			Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.SELLING_NULL_ERROR_MSG);
		}
		else
		{
			int goods = new Integer(id);
			//1、查询订单是否存在
			Order order = Common.ORDER.select_number_order(number);
			//2、查询商品是否存在
			Selling_list sl = Common.SLD.selecct_id_list(goods);
			if(null == order)
			{
				Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ORDER_NULL_ERROR_MSG);
			}
			else if (null == sl)
			{
				Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.SELLING_NULL_ERROR_MSG);
			}
			else
			{
				//3、根据商品与订单 查询信息
				Order_list ol = Common.OLD.select_number_order(order.getOrderid(), goods);
				boolean bools = false;
				if(null != ol)
				{
					if(ol.getNumber()>1)
						bools = Common.OLD.update_id_number(sl.getPrice(), ol.getId() , order.getOrderid());
					else
						bools = Common.OLD.del_id(ol.getId() , sl.getPrice() , order.getOrderid());
				}
				else
				{
					Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.SELLING_NULL_ERROR_MSG_FALSE);
				}
				if(bools)
				{
					Common.TOOLS.return_map_object_id(true, config.ADD_USER_RIGHT_MSG, config.SELLING_NULL_ERROR_MSG_FALSE , order.getHouseid()+"");
					Common.TOOLS.log_time("1在订单："+number+"中删除了商品："+sl.getName(),8);
				}
				
			}
		}
	}
	
	
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIndex() {
		return index;
	}

	public void setIndex(String index) {
		this.index = index;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	
	
	
}
