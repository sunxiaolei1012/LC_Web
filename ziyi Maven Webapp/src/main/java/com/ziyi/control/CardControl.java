package com.ziyi.control;

import java.util.HashMap;
import java.util.Map;

import com.atgeretg.serialport.utils.MyUtils;
import com.cyb.util.Common;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Old_Card;
import com.ziyi.pojo.Order;

public class CardControl extends ActionSupport{


	private String number; 
	
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
	public void bo()
	{
		Common.TOOLS.ji_old_card(number);
		reset_read();
	}
	public void yu()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		try {
			int sum = Common.TOOLS.read_card_two();
			if(sum == 2)
			{
				map.put("state", "false");
				map.put("msg", config.READ_CARD_TEXT);
			}
			else if(sum == 0)//新卡
			{
				String str= Common.TOOLS.return_read_card_number(config.READ_CARD);
				if(str == null)
				{
					map.put("state", "false");
					map.put("msg", config.READ_CARD_NEW_NULL);
				}
				else
				{
					map.put("state", "true");
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
					map.put("msg", oc.getNumber());
					Order or = Common.ORDER.select_number_order(oc.getNumber());
					map.put("rebate", Common.CARDTYPE.select_card_ctid(or.getCardid()).getRebate());
				}
				else
				{
					map.put("state", "false");
					map.put("msg", config.READ_CARD_OLD_FALSE);
				}
			}
			Common.TOOLS.return_object(map);
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
	
}
