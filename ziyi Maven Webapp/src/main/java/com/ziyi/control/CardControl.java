package com.ziyi.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.dao.CardDao;
import com.ziyi.dao.impl.CardDaoImpl;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Old_Card;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.Users;

public class CardControl extends ActionSupport{


	private String number; 
	
	private String price;
	
	
	public void selectcard()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		try {
			int sum = Common.TOOLS.read_card_two();
			if(sum == 2)
			{
				map.put("state", "false");
				map.put("button", "fasle");
				map.put("msg", config.READ_CARD_TEXT);
			}
			else if(sum == 0)//新卡
			{
				String str= Common.TOOLS.return_read_card_number(config.READ_CARD);
				if(str == null)
				{
					map.put("state", "false");
					map.put("button", "fasle");
					map.put("msg", config.READ_CARD_NEW_NULL);
				}
				else
				{
					map.put("state", "true");
					map.put("button", "fasle");
					map.put("msg", Common.TOOLS.code(new Integer(str), config.KEY)+"");
				}
			}
			else //老卡
			{
				//根据读取到的会员卡信息 查询会员卡编号
				Old_Card oc = Common.OLDDAO.select_value_number(Common.TOOLS.list_String(config.READ_CARD));
				if(oc != null)
				{
					map.put("state", "true");
					map.put("button", "true");
					map.put("msg", oc.getNumber());
//					Card ca = Common.CARDDAO.select_card_number(oc.getNumber());
					Card ca = Common.CARDDAO.select_card_numbers(oc.getNumber());
					if(ca != null)
					{
						map.put("rebate", Common.CARDTYPE.select_card_ctid(ca.getCtid()).getRebate());
						ca.setRemain(new Double(Common.double_df.format(ca.getRemain())));
						map.put("card", ca);
						
						//根据卡id查询对应10条消费记录
						List<Order> list = Common.ORDER.select_card_id(ca.getCardid());
						if(list != null)
						{
							map.put("order", list);
						}
						else
						{
							map.put("order", "false");
						}
					}
					else
					{
						map.put("state", "false");
						map.put("msg", config.MYSQL_ERROR_CARD_OLD);
					}
					
				}
				else
				{
					map.put("state", "false");
					map.put("button", "false");
					map.put("msg", config.READ_CARD_OLD_FALSE);
				}
			}
			Common.TOOLS.return_object(Gsons.tojson(map));
			reset_read();
		} catch (InterruptedException e) {
			Common.TOOLS.return_object("error");
		}
	}
	/**
	 * 读卡2
	 */
	public void yus()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		try {
			int sum = Common.TOOLS.read_card_two();
			if(sum == 2)
			{
				map.put("state", "false");
				map.put("button", "fasle");
				map.put("msg", config.READ_CARD_TEXT);
			}
			else if(sum == 0)//新卡
			{
				String str= Common.TOOLS.return_read_card_number(config.READ_CARD);
				if(str == null)
				{
					map.put("state", "false");
					map.put("button", "fasle");
					map.put("msg", config.READ_CARD_NEW_NULL);
				}
				else
				{
					map.put("state", "true");
					map.put("button", "fasle");
					map.put("msg", Common.TOOLS.code(new Integer(str), config.KEY)+"");
				}
			}
			else //老卡
			{
				//根据读取到的会员卡信息 查询会员卡编号
				Old_Card oc = Common.OLDDAO.select_value_number(Common.TOOLS.list_String(config.READ_CARD));
				if(oc != null)
				{
					map.put("state", "true");
					map.put("button", "true");
					map.put("msg", oc.getNumber());
//					Order or = Common.ORDER.select_number_order(oc.getNumber());
					Card ca = Common.CARDDAO.select_card_numbers(oc.getNumber());
					if(ca != null)
					{
						map.put("rebate", Common.CARDTYPE.select_card_ctid(ca.getCtid()).getRebate());
						ca.setRemain(new Double(Common.double_df.format(ca.getRemain())));
						map.put("card", ca);
					}
					else
					{
						map.put("state", "false");
						map.put("msg", config.MYSQL_ERROR_CARD_OLD);
					}
					
				}
				else
				{
					map.put("state", "false");
					map.put("button", "false");
					map.put("msg", config.READ_CARD_OLD_FALSE);
				}
			}
			Common.TOOLS.return_object(Gsons.tojson(map));
			reset_read();
		} catch (InterruptedException e) {
			Common.TOOLS.return_object("error");
		}
	}
	
	/**
	 * 充值会员卡
	 * @return
	 */
	public String addprice()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		if (null == number || number.equals(""))
		{
			map.put("state",false);
			map.put("msg", config.CARD_NULL);
		}
		else if (null == price || price.equals(""))
		{
			map.put("state",false);
			map.put("msg", config.CARD_PRICE_ADD_NULL);
		}
		else
		{
			CardDao cad = new CardDaoImpl();
			Card card = cad.select_card_numbers(number);
			if(card != null)
			{
				//充值卡
				card.setPrice(card.getPrice()+new Double(price));
				card.setRemain(card.getRemain()+new Double(price));
				boolean bool = cad.update_card_number(card);
				if(bool)
				{
					Users user = (Users) ActionContext.getContext().getSession().get("user");
					Common.TOOLS.log_time(user.getName()+"在会员卡："+number+"充值了:"+price+"元",9);
					map.put("state",true);
					map.put("msg", config.CARD_PRICE_ADD_TRUE);
					
				}
				else
				{
					map.put("state",false);
					map.put("msg", config.MYSQL_ERROR);
				}
			}
			else
			{
				map.put("state",false);
				map.put("msg", config.READ_CARD_OLD_NULL);
			}
		}
		new Tools().returns(Gsons.tojson(map));	
		return "json";
		
	}
	
	
	public void reset_read()
	{
		config.BOOL=false;
		config.READ_CARD.clear();
	}
	
	
	public 	String chen() throws InterruptedException
	{
		Common.TOOLS.white_card(number);
		Thread.sleep(300);
		Common.TOOLS.return_object(Common.TOOLS.read_card_three());
		reset_read();
		return "json";
	}
	public String bo()
	{
		Map<String , String> map = new HashMap<String , String>();
		map.put("msg", Common.TOOLS.ji_old_card(number));
		Common.TOOLS.return_object(Gsons.tojson(map));
		reset_read();
		return "json";
	}
	public void yu()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		try {
			int sum = Common.TOOLS.read_card_two();
			if(sum == 2)
			{
				map.put("state", "false");
				map.put("button", "fasle");
				map.put("msg", config.READ_CARD_TEXT);
			}
			else if(sum == 0)//新卡
			{
				String str= Common.TOOLS.return_read_card_number(config.READ_CARD);
				if(str == null)
				{
					map.put("state", "false");
					map.put("button", "fasle");
					map.put("msg", config.READ_CARD_NEW_NULL);
				}
				else
				{
					map.put("state", "true");
					map.put("button", "fasle");
					map.put("msg", Common.TOOLS.code(new Integer(str), config.KEY)+"");
				}
			}
			else //老卡
			{
				//根据读取到的会员卡信息 查询会员卡编号
				Old_Card oc = Common.OLDDAO.select_value_number(Common.TOOLS.list_String(config.READ_CARD));
				if(oc != null)
				{
					map.put("state", "true");
					map.put("button", "fasle");
					map.put("msg", oc.getNumber());
//					Order or = Common.ORDER.select_number_order(oc.getNumber());
					Card ca = Common.CARDDAO.select_card_number(oc.getNumber());
					if(ca != null)
					{
						map.put("rebate", Common.CARDTYPE.select_card_ctid(ca.getCtid()).getRebate());
						map.put("card", ca);
					}
					else
					{
						map.put("state", "false");
						map.put("msg", config.MYSQL_ERROR_CARD_OLD);
					}
					
				}
				else
				{
					map.put("state", "false");
					map.put("button", "true");
					map.put("msg", config.READ_CARD_OLD_FALSE);
				}
			}
			Common.TOOLS.return_object(Gsons.tojson(map));
			reset_read();
		} catch (InterruptedException e) {
			Common.TOOLS.return_object("error");
		}
	}

	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}
	
}
