package com.ziyi.control;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
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
 * 
 * @author 陈玉博
 * @date 2018年9月19日上午9:43:02
 */
public class MainServlet extends ActionSupport {

	private String id;
	private String index;
	private String number;

	private String name;
	private String phone;
	private String state;

	private String cnumber;

	private String xubei;

	private String houseid;
	private String tableid;

	/**
	 * 换桌
	 * 
	 * @return
	 */
	public String huan() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		// 1、根据桌子ID 查询桌子的状态
		if (tableid == null || tableid.equals("") || tableid.equals("undefined"))
			map.put("msg", "要换桌号不为空");
		else if (houseid == null || houseid.equals("") || tableid.equals("undefined"))
			map.put("msg", "原来桌号不为空");
		else {
			Tea_House tea_houseid = Common.HOUSE.select_House_id(new Integer(houseid));
			if(houseid != null)
			{
				if(tea_houseid.getStatus() == 0 || tea_houseid.getStatus() == 3)
					map.put("msg", "桌子状态不对");
				else
				{
					Users user = (Users) ActionContext.getContext().getSession().get("user");
					// 根据要换桌子 查询桌子状态
					Tea_House tea = Common.HOUSE.select_House_id(new Integer(tableid));
					if (tea != null) {
						if (tea.getStatus() == 1)
							map.put("msg", "不可更换，要换位置已有订单");
						else if (tea.getStatus() == 2)
							map.put("msg", "不可更换，要换位置已有预约");
						else {
							//查询原来
							if(tea_houseid.getStatus() == 1)//有订单
							{
								//根据桌号查询订单信息
								Order order = Common.ORDER.select_houseid_state(0, new Integer(houseid));
								if(order != null)
								{
									boolean bool = Common.ORDER.update_number_house(order.getNumber(), tableid);
									if(bool)
									{
										Common.HOUSE.update_number_table(new Integer(tableid), 1);
										Common.HOUSE.update_number_table(new Integer(houseid), 0);
										map.put("msg", "修改成功");
										map.put("status", true);
										Common.TOOLS.log_time(user.getUserrole() + "执行换桌,把"+Common.HOUSE.select_House_id(new Integer(houseid)).getHousename()+"换到"+Common.HOUSE.select_House_id(new Integer(houseid)).getHousename(), 4);
									}
									else
										map.put("msg", "修改失败");
								}
								else
									map.put("msg", "订单不存在");
							}
							else if (tea_houseid.getStatus() == 2)//有预约
							{
								YuYueDao yu = new YuYueDaoImpl();
								YuYue yuyue = yu.select_yuyue_tid(new Integer(houseid));
								if(yuyue != null)
								{
									Common.HOUSE.update_number_table(new Integer(tableid), 2);
									Common.HOUSE.update_number_table(new Integer(houseid), 0);
									yu.update_id_tid(yuyue.getId(), new Integer(tableid));
									map.put("msg", "修改成功");
									map.put("status", true);
									Common.TOOLS.log_time(user.getUserrole() + "执行换桌,把"+Common.HOUSE.select_House_id(new Integer(houseid)).getHousename()+"换到"+Common.HOUSE.select_House_id(new Integer(houseid)).getHousename(), 4);
								}
								else
									map.put("msg", "预约不存在");
							}
						}
					} else
						map.put("msg", "桌子不存在");
				}
			}
			else
			{
				map.put("msg", "桌子不存在");
			}
		}
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}

	/**
	 * 查询换桌
	 * 
	 * @return
	 */
	public String house() {

		// 查询出所有桌子信息
		Map<String, Object> map = new HashMap<String, Object>();
		List<Tea_House> list_house = Common.HOUSE.select_House();
		map.put("table", list_house);
		map.put("houseid", houseid);
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}

	public String price() {
		// 1、获取所有桌子信息

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("price", Common.double_df.format(Common.JD.price_day_sum(Common.df_day.format(new Date()))));
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}

	public String table() {
		List<Tea_House> list_house = Common.HOUSE.select_House();
		// 2、查询今日营业额
		// float sum_price = new JDBC().sum_order(Common.df_day.format(new
		// Date()));
		new Tools().return_object(new Gson().toJson(list_house));
		return "json";
	}

	public String state() {
		boolean bool = Common.HOUSE.update_house_tea(new Integer(id), new Integer(index));
		// Tea_House tea = Common.HOUSE.select_House_id(new Integer(id));
		Order order = Common.ORDER.select_houseid_state(0, new Integer(id));
		Users user = (Users) ActionContext.getContext().getSession().get("user");
		if (index.equals("1")) {
			create();
			Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		} else if (index.equals("2")) {
			YuYueDao yu = new YuYueDaoImpl();
			YuYue yy = new YuYue();
			yy.setName(name);
			yy.setPhone(phone);
			yy.setState(0);
			yy.setTid(new Integer(id));
			yy.setTime(Common.df.format(new Date()));
			yu.insert_yuyue(yy);
			Common.TOOLS.log_time(name+"预定了桌子《"+Common.HOUSE.select_House_id(new Integer(id)).getHousename()+"》。服务员："+user.getName(),2);
			Common.TOOLS.return_map_object(bool, config.YUDING_TRUE, config.YUDING_FLASE);
		} else {
			try {
				Common.ORDER.delete_order_list(order.getOrderid());
			} catch (Exception e) {
				System.out.println("状态不在");
			}
			// 3其他
			Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		}

		return "json";

	}

	/**
	 * 预约
	 * 
	 * @return
	 */
	public String yuyue() {
		YuYueDao yu = new YuYueDaoImpl();
		YuYue yuyue = yu.select_yuyue_tid(new Integer(index));
		Common.TOOLS.return_object(new Gson().toJson(yuyue));
		return "json";
	}

	public String order() {
		if (id != "undefined") {
			Order order = Common.ORDER.select_houseid_state(0, new Integer(id));
			// 判断订单中是否有续杯茶品
			// if(order.getXubei() != 0)
			// {
			// //查询出最高的茶的商品价格
			// Selling_list selling =
			// Common.ORDER.select_xubei_order(order.getNumber());
			//
			// }

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("number", order.getNumber());
			map.put("ordertime", order.getOrdertime());
			//添加差价
			double xubeiprice=0;
			if(order.getXubei()!=0 )
			{
				Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
				double price=selling.getPrice();
				Selling_list slll = Common.SLD.selecct_id_list(order.getXubei());
				double prices=slll.getPrice();
				if(prices>price) {
				 xubeiprice=prices-price;
					
				}
			}
			map.put("price", Common.double_df.format((order.getPrice())+xubeiprice));
			map.put("houseid", order.getHouseid());
			map.put("status", order.getStatus());
			Users user = (Users) ActionContext.getContext().getSession().get("user");
			if (user == null) {
				return "login";
			}
			if (user.getUserrole().equals("3"))
				map.put("bool", false);
			else
				map.put("bool", true);
			map.put("table", Common.HOUSE.select_House_id(new Integer(id)).getHousename());

			List<Order_list> order_list = Common.OLD.select_number_order(order.getOrderid());
			if (order_list != null) {
				List<Selling_list> selling_list = new ArrayList<Selling_list>();
				for (Order_list se : order_list) {
					Selling_list sl = Common.SLD.selecct_id_list(se.getSellingid());
					sl.setNumber(se.getNumber());
					sl.setUserid(se.getState());
					sl.setTypeid(se.getId());
					selling_list.add(sl);
				}
						
				if(order.getXubei()!=0 )
				{
					Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
					
					double price=selling.getPrice();
					Selling_list sll = Common.SLD.selecct_id_list(order.getXubei());
					sll.setNumber(1);
					double prices=sll.getPrice();
					sll.setName("(续)"+sll.getName());
					if(prices>price) {
					 xubeiprice=prices-price;
						sll.setPrice(xubeiprice);
					}else {
						sll.setPrice(0.00);
					}
					
					selling_list.add(sll);
				}
				map.put("sel", selling_list);
			}
			Common.TOOLS.return_object(new Gson().toJson(map));

		}
		return "json";
	}

	/**
	 * 获取商品类别
	 * 
	 * @return
	 */
	public String type() {
		List<Selling_type> list = Common.STYPE.select_selling_type();
		// System.out.println(new Gson().toJson(list));
		Common.TOOLS.return_object(new Gson().toJson(list));
		return "json";
	}

	/**
	 * 获取商品
	 * 
	 * @return
	 */
	public String value() {
		// 根据类别ID 查询其对应商品信息
		int a = 1;
		if (id != null && !id.equals("") && !id.equals("undefined"))
			a = new Integer(id);
		List<Selling_list> list = Common.SLD.select_selling_type(a);
		if (list != null) {
			for (Selling_list selling_list : list) {
				// 根據商品列表 查詢商品圖片
				selling_list.setImgurl(Common.SID.select_selling_image(selling_list.getSellingid()));
			}
		}
		// System.out.println(list.size());
		Common.TOOLS.return_object(new Gson().toJson(list));
		return "json";
	}

	/**
	 * 根据订单编号 查询订单下商品
	 * 
	 * @return
	 */
	public String number() {
		Map<String, Object> map = new HashMap<String, Object>();
		if (number != null) {
			// 根据编号查询订单信息
			Order order = Common.ORDER.select_number_order(number);
			if (order != null) {
				// 根据订单信息，查询订单详情
				// List<Order_list> list_order =
				// Common.OLD.select_number_order(list.getOrderid());

				map.put("number", order.getNumber());
				map.put("ordertime", order.getOrdertime());
				//添加差价
				double xubeiprice=0;
				if(order.getXubei()!=0 )
				{
					Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
					double price=selling.getPrice();
					Selling_list slll = Common.SLD.selecct_id_list(order.getXubei());
					double prices=slll.getPrice();
					if(prices>price) {
					 xubeiprice=prices-price;
						
					}
				}
				map.put("price", Common.double_df.format((order.getPrice())+xubeiprice));
				
				
				
			
				map.put("status", order.getStatus());
				Users user = (Users) ActionContext.getContext().getSession().get("user");
				if (user.getUserrole().equals("2"))
					map.put("bool", false);
				else
					map.put("bool", true);
				map.put("table", Common.HOUSE.select_House_id(new Integer(id)).getHousename());

				List<Order_list> order_list = Common.OLD.select_number_order(order.getOrderid());
				if (order_list != null) {
					List<Selling_list> selling_list = new ArrayList<Selling_list>();
					for (Order_list se : order_list) {
						Selling_list sl = Common.SLD.selecct_id_list(se.getSellingid());
						sl.setNumber(se.getNumber());
						selling_list.add(sl);
					}
					
					
					if(order.getXubei()!=0 )
					{
						Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
						
						double price=selling.getPrice();
						Selling_list slll = Common.SLD.selecct_id_list(order.getXubei());
						double prices=slll.getPrice();
						slll.setName("(续)"+slll.getName());
						if(prices>price) {
						 xubeiprice=prices-price;
							slll.setPrice(xubeiprice);
						}else {
							slll.setPrice(0.00);
						}
						
						selling_list.add(slll);
					}
					
					map.put("sel", selling_list);
				}

			} else {
				map.put("state", false);
				map.put("msg", config.NUMBER_NULL);
			}
			Common.TOOLS.return_object(new Gson().toJson(map));
		}

		return "json";
	}

	public String selling() {
		boolean bool = false;
		String trues = null;
		String falses = null;
		Map<String, String> map = new HashMap<String, String>();
		if (number != null && id != null) {
			// 1、查询订单是否存在
			Order order = Common.ORDER.select_number_order(number);
			// 2、查询商品是否存在
			Selling_list sl = Common.SLD.selecct_id_list(new Integer(id));
			if (null == order) {
				falses = config.ORDER_NULL_ERROR_MSG;
			} else if (null == sl) {
				falses = config.SELLING_NULL_ERROR_MSG;
			} 
			
				//查询商品是否存在续杯商品 加上差价
			else if(order.getXubei()!=0) {
				
				Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
				System.out.println("下单续杯"+selling);
				double price=selling.getPrice();
				Selling_list slll = Common.SLD.selecct_id_list(order.getXubei());
				double prices=slll.getPrice();
				double xubeiprice = 0;
				if(prices>price) {
					xubeiprice=prices-price;
					System.out.println("续杯差价"+xubeiprice);
				}
				boolean bool_s = Common.ORDER.update_number_order(number, order.getPrice() + sl.getPrice()+xubeiprice);
				if (bool_s)// 修改成功
				{
					// 根据订单与商品表 查询是否有数据
					int goods = new Integer(id);
					Order_list order_list = Common.OLD.select_number_order(order.getOrderid(), goods);
					boolean bools = false;
					if (null != order_list) {
						bools = Common.OLD.update_id_numbers(order_list.getId(), 1 + order_list.getNumber());
					} else {
						Order_list ol = new Order_list();
						ol.setOrderid(order.getOrderid());
						ol.setSellingid(goods);
						ol.setNumber(1);
						ol.setState(0);
						bools = Common.OLD.insert_order_list(ol);
					}

					if (bools) {
						Users user = (Users) ActionContext.getContext().getSession().get("user");
						map.put("state", "true");
						map.put("msg", config.XIU_USER_RIGHT_MSG);
						map.put("id", "" + order.getHouseid());
						Common.TOOLS.log_time(user.getName()+"在订单：" + number + "中添加了商品：" + sl.getName(), 5);
					} else {
						// 添加失败 数据回滚
						Common.ORDER.update_number_order(number, order.getPrice());
					}

				}
				}
			else {
				// order.setPrice(sl.getPrice());
				//添加差价
				double xubeiprice=0;
				if(order.getXubei()!=0 )
				{
					Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
					double price=selling.getPrice();
					Selling_list slll = Common.SLD.selecct_id_list(order.getXubei());
					double prices=slll.getPrice();
					if(prices>price) {
					 xubeiprice=prices-price;
						
					}
				}
				boolean bool_s = Common.ORDER.update_number_order(number, order.getPrice() + sl.getPrice()+xubeiprice);
				if (bool_s)// 修改成功
				{
					// 根据订单与商品表 查询是否有数据
					int goods = new Integer(id);
					Order_list order_list = Common.OLD.select_number_order(order.getOrderid(), goods);
					boolean bools = false;
					if (null != order_list) {
						bools = Common.OLD.update_id_numbers(order_list.getId(), 1 + order_list.getNumber());
					} else {
						Order_list ol = new Order_list();
						ol.setOrderid(order.getOrderid());
						ol.setSellingid(goods);
						ol.setNumber(1);
						ol.setState(0);
						bools = Common.OLD.insert_order_list(ol);
					}

					if (bools) {

						map.put("state", "true");
						map.put("msg", config.XIU_USER_RIGHT_MSG);
						map.put("id", "" + order.getHouseid());
						Common.TOOLS.log_time("在订单：" + number + "中添加了商品：" + sl.getName(), 5);
					} else {
						// 添加失败 数据回滚
						Common.ORDER.update_number_order(number, order.getPrice());
					}

				}
			}
		}
		if (map.get("state") != null) {
			Common.TOOLS.return_object(new Gson().toJson(map));
		} else {
			Common.TOOLS.return_map_object(bool, trues, falses);
		}

		return "json";
	}

	/**
	 * 创建订单
	 * 
	 * @return
	 */
	/**
	 * 创建订单 //返回订单编号
	 */
	public void create() {
		if (id != null && !id.equals("")) {
			// 1、uuid正确 生成订单 订单号 年月日时分+4位随机数
			String number = new Tools().return_orderid();
			// 2、添加订单信息

			// 收营员
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			Users user = (Users) session.getAttribute("user");
			Order order = new Order();
			order.setNumber(number);
			order.setOrdertime(Common.df.format(new Date()));
			order.setPrice(0.00);
			order.setUserid(user.getUserid());
			// order.setUserid(new Integer(user.getUserrole()));
			order.setStatus(0);
			order.setType(0);
			order.setCheckouttime("");
			order.setPay_price(0.00);
			order.setHouseid(new Integer(id));
			order.setCardid(null);
			order.setAccountuserid(0);
			order.setXubei(0);
			boolean bool = Common.ORDER.insert_number_order(order);
			System.out.println(bool);
			if (bool) {
				Common.TOOLS.log_time(user.getName() + "创建了订单：" + number, 3);
				Common.TOOLS.return_map_object(true, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
			} else {
				Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
			}
		} else {
			Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
		}

	}

	/**
	 * 根据uuid number goodsid 删除一个商品
	 */
	public void delgoods() {
		if (null == number) {
			Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ORDER_NULL_ERROR_MSG);
		} else if (null == id) {
			Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.SELLING_NULL_ERROR_MSG);
		} else {
			int goods = new Integer(id);
			// 1、查询订单是否存在
			Order order = Common.ORDER.select_number_order(number);
			// 2、查询商品是否存在
			Selling_list sl = Common.SLD.selecct_id_list(goods);
			if (null == order) {
				Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.ORDER_NULL_ERROR_MSG);
			} else if (null == sl) {
				Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG, config.SELLING_NULL_ERROR_MSG);
			} else {
				// 3、根据商品与订单 查询信息
				Order_list ol = Common.OLD.select_number_order(order.getOrderid(), goods);
				boolean bools = false;
				if (null != ol) {
					if (ol.getNumber() > 1)
						bools = Common.OLD.update_id_number(sl.getPrice(), ol.getId(), order.getOrderid());
					else
						bools = Common.OLD.del_id(ol.getId(), sl.getPrice(), order.getOrderid());
				} else {
					Common.TOOLS.return_map_object(false, config.ADD_USER_RIGHT_MSG,
							config.SELLING_NULL_ERROR_MSG_FALSE);
				}
				if (bools) {
					Common.TOOLS.return_map_object_id(true, config.ADD_USER_RIGHT_MSG,
							config.SELLING_NULL_ERROR_MSG_FALSE, order.getHouseid() + "");
					Users user = (Users) ActionContext.getContext().getSession().get("user");
					Common.TOOLS.log_time(user.getName()+"在订单：" + number + "中删除了商品：", 6);
				}

			}
		}
	}

	/**
	 * 修改订单商品 是否已上
	 * 
	 * @return
	 */
	public void sellingstate() {
		if (id != null) {
			// 根据ID 查询订单商品是否存在
			boolean bool = Common.OLD.update_id_state_bool(new Integer(id));
			if (bool) {
				Common.OLD.update_id_state(new Integer(id), 1);
			}
		}
	}

	public void xubei() {
		// 根据根据 订单编号 查询该订单可续杯商品
		Selling_list selling = Common.ORDER.select_xubei_order(number);
		Map<String, Object> map = new HashMap<String, Object>();
		if (selling != null)// 可续杯
		{
			// 根据商品最大价格。
			// 查询高于此商品 与低于商品
			// 大于的
			List<Selling_list> list1 = Common.SLD.select_price_jusl(selling.getPrice(), ">");
			// 小于的
			List<Selling_list> list2 = Common.SLD.select_price_jusl(selling.getPrice(), "<");
			map.put("state", true);
			map.put("big", list1);
			map.put("small", list2);
		} else// 不可续杯
		{
			map.put("state", false);
			map.put("msg", config.XU_ERROR);
		}
		Common.TOOLS.return_object(new Gson().toJson(map));
	}

	public String pay() {
//		System.out.println("pay");
		Map<String, Object> map = new HashMap<String, Object>();
		OrderDao orderdao = new OrderDaoImpl();
		Order order = orderdao.select_number_order(number);
		if (order == null) {
			map.put("state", false);
			map.put("msg", config.PAY_NUMBER_DEL);
		} else if (order.getStatus() == 1) {
			map.put("state", false);
			map.put("msg", config.PAY_NUMBER_TRUE);
		} else {
			int ids = new Integer(id);
			if (ids == 1)// 会员卡付款
			{
				if (null == cnumber || "".equals(cnumber)) {
					map.put("state", false);
					map.put("msg", config.CARD_NULL);
				} else {
					// 有会员卡。根据会员卡号 查询会员卡信息
					CardDao cdd = new CardDaoImpl();
					Card card = cdd.select_card_number(cnumber);
					if (card != null)// 卡有效
					{
						Card_typeDao cld = new Card_typeDaoImpl();
						Card_type ctid = cld.select_card_ctid(card.getCtid());
						Double rebate = 1.00;
						if (ctid != null)
							rebate = ctid.getRebate();
						if (order != null)// 订单存在
						{
							// 判断卡中余额与折扣，是否够付钱
							Double dou = order.getPrice() * rebate;
							if (card.getRemain() >= dou) {
								Users user = (Users) ActionContext.getContext().getSession().get("user");
								// 执行扣钱操作 会员卡是1
								boolean bool = orderdao.update_order_card(dou, 1, Common.df.format(new Date()),
										order.getOrderid(), card.getCardid(), user.getUserid());
								if (bool) {
									Common.HOUSE.update_house_tea(order.getHouseid(), 0);
									map.put("state", true);
									map.put("msg", config.PAY_TRUE);
									Common.TOOLS.log_time(user.getName() + "收取了订单号为：" + number + "的账单。金额为：" + dou
											+ "。会员卡付款，卡号：" + cnumber, 7);
								} else {
									map.put("state", false);
									map.put("msg", config.PAY_ERROR);
								}
							} else {
								map.put("state", false);
								map.put("msg", config.CARD_PRICE_FALSE);
							}

						}

					} else// 卡无效
					{
						map.put("state", false);
						map.put("msg", config.NUMBER_FALSE);
					}
				}
			} else if (ids == 0)// 现金付款
			{

				// 根据订单编号，查询订单信息
				Order orders = Common.ORDER.select_number_order(number);
				Users user = (Users) ActionContext.getContext().getSession().get("user");
				//添加差价
				double xubeiprice=0;
				if(order.getXubei()!=0 )
				{
					Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
					double price=selling.getPrice();
					Selling_list slll = Common.SLD.selecct_id_list(order.getXubei());
					double prices=slll.getPrice();
					if(prices>price) {
					 xubeiprice=prices-price;
						
					}
				}
				
				
				boolean bool = orderdao.update_two_order(0, Common.df.format(new Date()), (orders.getPrice()+xubeiprice), number,
						user.getUserid());
				if (bool) {
					Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
					map.put("state", true);
					map.put("msg", config.PAY_TRUE);

					Common.TOOLS.log_time(
							user.getName() + "收取了订单号为：" + number + "的账单。金额为：" + orders.getPrice() + "。现金付款", 10);
				} else {
					map.put("state", false);
					map.put("msg", config.PAY_ERROR);
				}
			} else if (ids == 2)// 支付宝
			{
				// 根据订单编号，查询订单信息
				Order orders = Common.ORDER.select_number_order(number);
				Users user = (Users) ActionContext.getContext().getSession().get("user");
				boolean bool = orderdao.update_two_order(2, Common.df.format(new Date()), orders.getPrice(), number,
						user.getUserid());
				if (bool) {
					Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
					map.put("state", true);
					map.put("msg", config.PAY_TRUE);
					Common.TOOLS.log_time(
							user.getName() + "收取了订单号为：" + number + "的账单。金额为：" + orders.getPrice() + "。支付宝付款", 10);
				} else {
					map.put("state", false);
					map.put("msg", config.PAY_ERROR);
				}
			} else if (ids == 3)// 微信
			{
				// 根据订单编号，查询订单信息
				Users user = (Users) ActionContext.getContext().getSession().get("user");
				Order orders = Common.ORDER.select_number_order(number);
				boolean bool = orderdao.update_two_order(3, Common.df.format(new Date()), orders.getPrice(), number,
						user.getUserid());
				if (bool) {
					Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
					map.put("state", true);
					map.put("msg", config.PAY_TRUE);
					Common.TOOLS.log_time(
							user.getName() + "收取了订单号为：" + number + "的账单。金额为：" + orders.getPrice() + "。微信付款", 10);
				} else {
					map.put("state", false);
					map.put("msg", config.PAY_ERROR);
				}
			} else // 待添加
			{

			}
		}
		new Tools().returns(Gsons.tojson(map));
		return "json";
	}

	public String pay_xubei() {
		System.out.println("pay_xubeoi");
		return "";
		// System.out.println("pay");
		// Map<String , Object> map = new HashMap<String , Object>();
		// OrderDao orderdao = new OrderDaoImpl();
		// Order order = orderdao.select_number_order(number);
		// if(order == null)
		// {
		// map.put("state", false);
		// map.put("msg", config.PAY_NUMBER_DEL);
		// }
		// else if(order.getStatus() == 1)
		// {
		// map.put("state", false);
		// map.put("msg", config.PAY_NUMBER_TRUE);
		// }
		// else
		// {
		// int ids = new Integer(id);
		// if(ids == 1)//会员卡付款
		// {
		// if(null == cnumber || "".equals(cnumber))
		// {
		// map.put("state", false);
		// map.put("msg", config.CARD_NULL);
		// }
		// else
		// {
		// //有会员卡。根据会员卡号 查询会员卡信息
		// CardDao cdd = new CardDaoImpl();
		// Card card = cdd.select_card_number(cnumber);
		// if(card != null)//卡有效
		// {
		// Card_typeDao cld = new Card_typeDaoImpl();
		// Card_type ctid = cld.select_card_ctid(card.getCtid());
		// Double rebate = 1.00;
		// if(ctid != null)
		// rebate = ctid.getRebate();
		// if(order != null)//订单存在
		// {
		// //判断卡中余额与折扣，是否够付钱
		// Double dou = order.getPrice()*rebate;
		// if(card.getRemain() >= dou)
		// {
		// Users user = (Users)
		// ActionContext.getContext().getSession().get("user");
		// //执行扣钱操作 会员卡是1
		// boolean bool = orderdao.update_order_card(dou, 1,
		// Common.df.format(new Date()), order.getOrderid(),
		// card.getCardid(),user.getUserid());
		// if(bool)
		// {
		// Common.HOUSE.update_house_tea(order.getHouseid(), 0);
		// map.put("state", true);
		// map.put("msg", config.PAY_TRUE);
		// Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+dou+"。会员卡付款，卡号："+cnumber,10);
		// }
		// else
		// {
		// map.put("state", false);
		// map.put("msg", config.PAY_ERROR);
		// }
		// }
		// else
		// {
		// map.put("state", false);
		// map.put("msg", config.CARD_PRICE_FALSE);
		// }
		//
		// }
		//
		// }
		// else//卡无效
		// {
		// map.put("state", false);
		// map.put("msg", config.NUMBER_FALSE);
		// }
		// }
		// }
		// else if(ids == 0)//现金付款
		// {
		//
		// //根据订单编号，查询订单信息
		// Order orders = Common.ORDER.select_number_order(number);
		// boolean bool = orderdao.update_two_order(0, Common.df.format(new
		// Date()),orders.getPrice(), number);
		// if(bool)
		// {
		// Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
		// map.put("state", true);
		// map.put("msg", config.PAY_TRUE);
		// Users user = (Users)
		// ActionContext.getContext().getSession().get("user");
		// Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+orders.getPrice()+"。现金付款",10);
		// }
		// else
		// {
		// map.put("state", false);
		// map.put("msg", config.PAY_ERROR);
		// }
		// }
		// else if(ids == 2)//支付宝
		// {
		// //根据订单编号，查询订单信息
		// Order orders = Common.ORDER.select_number_order(number);
		// boolean bool = orderdao.update_two_order(2, Common.df.format(new
		// Date()),orders.getPrice(), number);
		// if(bool)
		// {
		// Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
		// map.put("state", true);
		// map.put("msg", config.PAY_TRUE);
		// Users user = (Users)
		// ActionContext.getContext().getSession().get("user");
		// Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+orders.getPrice()+"。支付宝付款",10);
		// }
		// else
		// {
		// map.put("state", false);
		// map.put("msg", config.PAY_ERROR);
		// }
		// }
		// else if(ids == 3)//微信
		// {
		// //根据订单编号，查询订单信息
		// Order orders = Common.ORDER.select_number_order(number);
		// boolean bool = orderdao.update_two_order(3, Common.df.format(new
		// Date()),orders.getPrice(), number);
		// if(bool)
		// {
		// Common.HOUSE.update_house_tea(orders.getHouseid(), 0);
		// map.put("state", true);
		// map.put("msg", config.PAY_TRUE);
		// Users user = (Users)
		// ActionContext.getContext().getSession().get("user");
		// Common.TOOLS.log_time(user.getName()+"收取了订单号为："+number+"的账单。金额为："+orders.getPrice()+"。微信付款",10);
		// }
		// else
		// {
		// map.put("state", false);
		// map.put("msg", config.PAY_ERROR);
		// }
		// }
		// else //待添加
		// {
		//
		// }
		// }
		// new Tools().returns(Gsons.tojson(map));
		// return "json";
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

	public String getXubei() {
		return xubei;
	}

	public void setXubei(String xubei) {
		this.xubei = xubei;
	}

	public String getHouseid() {
		return houseid;
	}

	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}

	public String getTableid() {
		return tableid;
	}

	public void setTableid(String tableid) {
		this.tableid = tableid;
	}

}
