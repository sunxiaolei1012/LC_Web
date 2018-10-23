package com.ziyi.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.components.Debug;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.cyb.util.JDBC;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.dao.CardDao;
import com.ziyi.dao.Card_typeDao;
import com.ziyi.dao.OrderDao;
import com.ziyi.dao.YuYueDao;
import com.ziyi.dao.impl.CardDaoImpl;
import com.ziyi.dao.impl.Card_typeDaoImpl;
import com.ziyi.dao.impl.OrderDaoImpl;
import com.ziyi.dao.impl.UsersDaoImpl;
import com.ziyi.dao.impl.YuYueDaoImpl;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Card_type;
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
	
	private String cnumber;
	
	
	public String price()
	{
		//1、获取所有桌子信息
		
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("price", Common.double_df.format(Common.JD.price_day_sum(Common.df_day.format(new Date()))));
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
			Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		}
		else if (index.equals("2"))
		{
			YuYueDao yu = new YuYueDaoImpl();
			YuYue yy = new YuYue();
			yy.setName(name);
			yy.setPhone(phone);
			yy.setState(0);
			yy.setTid(new Integer(id));
			yy.setTime(Common.df.format(new Date()));
			yu.insert_yuyue(yy);
			Common.TOOLS.return_map_object(bool, config.YUDING_TRUE, config.YUDING_FLASE);
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
			Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		}
		
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
			map.put("houseid",order.getHouseid());
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
					sl.setUserid(se.getState());
					sl.setTypeid(se.getId());
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
	
	/**
	 * 根据订单编号 查询订单下商品
	 * @return
	 */
	public String number()
	{
		Map<String,Object> map = new HashMap<String , Object>();
		if(number != null)
		{
			//根据编号查询订单信息
			Order list = Common.ORDER.select_number_order(number);
			if(list != null)
			{
				//根据订单信息，查询订单详情
//				List<Order_list> list_order = Common.OLD.select_number_order(list.getOrderid());
				
				map.put("number", list.getNumber());
				map.put("ordertime", list.getOrdertime());
				map.put("price", list.getPrice());
				map.put("status", list.getStatus());
				Users user = (Users) ActionContext.getContext().getSession().get("user");
				if(user.getUserrole().equals("2"))
					map.put("bool", false);
				else
					map.put("bool", true);
				map.put("table", Common.HOUSE.select_House_id(new Integer(id)).getHousename());
				
				List<Order_list> order_list = Common.OLD.select_number_order(list.getOrderid());
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
				
			}
			else
			{
				map.put("state", false);
				map.put("msg", config.NUMBER_NULL);
			}
			Common.TOOLS.return_object(new Gson().toJson(map));
		}
		
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
						ol.setState(0);
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
	
	/**
	 * 修改订单商品 是否已上
	 * @return
	 */
	public void sellingstate()
	{
		if(id != null)
		{
			//根据ID 查询订单商品是否存在
			boolean bool = Common.OLD.update_id_state_bool(new Integer(id));
			if(bool)
			{
				Common.OLD.update_id_state(new Integer(id), 1);
			}
		}
	}
	
	
	public void xubei()
	{
		//根据根据 订单编号 查询该订单可续杯商品
		Selling_list selling = Common.ORDER.select_xubei_order(number);
		Map<String , Object> map = new HashMap<String , Object>();
		if(selling != null)//可续杯
		{
			//根据商品最大价格。
			//查询高于此商品 与低于商品
			//大于的
			List<Selling_list> list1 = Common.SLD.select_price_jusl(selling.getPrice(), ">");
			//小于的
			List<Selling_list> list2 = Common.SLD.select_price_jusl(selling.getPrice(), "<");
			map.put("state", true);
			map.put("big",list1);
			map.put("small",list2);
		}
		else//不可续杯
		{
			map.put("state",false);
			map.put("msg", config.XU_ERROR);
		}
		Common.TOOLS.return_object(new Gson().toJson(map));
	}
	
	
	public String pay()
	{
		System.out.println("pay");
			Map<String , Object> map = new HashMap<String , Object>();
			OrderDao orderdao = new OrderDaoImpl();
			Order order = orderdao.select_number_order(number);
			if(order == null)
			{
				map.put("state", false);
				map.put("msg", config.PAY_NUMBER_DEL);
			}
			else if(order.getStatus() == 1)
			{
				map.put("state", false);
				map.put("msg", config.PAY_NUMBER_TRUE);
			}
			else
			{
				int ids = new Integer(id);
				if(ids == 1)//会员卡付款
				{
					if(null == cnumber || "".equals(cnumber))
					{
						map.put("state", false);
						map.put("msg", config.CARD_NULL);
					}
					else
					{
						//有会员卡。根据会员卡号 查询会员卡信息
						CardDao cdd = new CardDaoImpl();
						Card card = cdd.select_card_number(cnumber);
						if(card != null)//卡有效
						{
							Card_typeDao cld = new Card_typeDaoImpl();
							Card_type ctid = cld.select_card_ctid(card.getCtid());
							Double rebate = 1.00;
							if(ctid != null)
								rebate = ctid.getRebate();
							if(order != null)//订单存在
							{
								//判断卡中余额与折扣，是否够付钱
								Double dou = order.getPrice()*rebate;
								if(card.getRemain() >= dou)
								{
									//执行扣钱操作                                                   会员卡是1
									boolean bool = orderdao.update_order_card(dou, 1, Common.df.format(new Date()), order.getOrderid(), card.getCardid());
									if(bool)
									{
										Common.HOUSE.update_house_tea(order.getHouseid(), 0);
										map.put("state", true);
										Users user = (Users) ActionContext.getContext().getSession().get("user");
										Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+dou+"。会员卡付款，卡号："+cnumber,10);
									}
									else
									{
										map.put("state", false);
										map.put("msg", config.PAY_ERROR);
									}
								}
								else
								{
									map.put("state", false);
									map.put("msg", config.CARD_PRICE_FALSE);
								}
								
							}
								
							}
							else//卡无效
							{
								map.put("state", false);
								map.put("msg", config.NUMBER_FALSE);
							}
						}
					}
					else if(ids == 0)//现金付款
					{
						
						//根据订单编号，查询订单信息
						Order orders = Common.ORDER.select_number_order(number);
						boolean bool = orderdao.update_two_order(0, Common.df.format(new Date()),orders.getPrice(), number);
							if(bool)
							{
								Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
								map.put("state", true);
								Users user = (Users) ActionContext.getContext().getSession().get("user");
								Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+orders.getPrice()+"。现金付款",10);
							}
							else
							{
								map.put("state", false);
								map.put("msg", config.PAY_ERROR);
							}
					}
					else if(ids == 2)//支付宝
					{
						//根据订单编号，查询订单信息
						Order orders = Common.ORDER.select_number_order(number);
						boolean bool = orderdao.update_two_order(2, Common.df.format(new Date()),orders.getPrice(), number);
							if(bool)
							{
								Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
								map.put("state", true);
								Users user = (Users) ActionContext.getContext().getSession().get("user");
								Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+orders.getPrice()+"。支付宝付款",10);
							}
							else
							{
								map.put("state", false);
								map.put("msg", config.PAY_ERROR);
							}
					}
					else if(ids == 3)//微信
					{
						//根据订单编号，查询订单信息
						Order orders = Common.ORDER.select_number_order(number);
						boolean bool = orderdao.update_two_order(3, Common.df.format(new Date()),orders.getPrice(), number);
							if(bool)
							{
								Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
								map.put("state", true);
								Users user = (Users) ActionContext.getContext().getSession().get("user");
								Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+orders.getPrice()+"。微信付款",10);
							}
							else
							{
								map.put("state", false);
								map.put("msg", config.PAY_ERROR);
							}
					}
					else //待添加
					{
						
					}
			}
		new Tools().returns(Gsons.tojson(map));
		return "json";
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

	public String getCnumber() {
		return cnumber;
	}

	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	
	
	
	
	
}
