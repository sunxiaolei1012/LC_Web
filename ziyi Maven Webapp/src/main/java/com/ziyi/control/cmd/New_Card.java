package com.ziyi.control.cmd;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.dao.CardDao;
import com.ziyi.dao.impl.CardDaoImpl;
import com.ziyi.dao.impl.UsersDaoImpl;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Users;

public class New_Card {

	/**
	 * 添加新卡
	 * @return
	 */
	public void add_newcard(String number , String ctid , String name , String phone, String address, String price , String idcard)
	{
		Map<String , Object> map = new HashMap<String , Object>();
		if (null == number || number.equals(""))
		{
			map.put("state", false);
			map.put("msg", config.CARD_NUMBER_NULL);
		}
		else if (null == ctid || ctid.equals(""))
		{
			map.put("state", false);
			map.put("msg", config.CARD_TYPE_NULL);
		}
		else if (null == price || price.equals(""))
		{
			map.put("state", false);
			map.put("msg", config.CARD_PRICE_ADD_NULL);
		}
		else
		{
			CardDao cd = new CardDaoImpl();
			//根据卡编号判断卡是否已存在
			boolean bool = cd.select_card_id(number);
			if(bool)
			{
				map.put("state", false);
				map.put("msg", config.READ_CARD_NULL);
			}
			else
			{
			Users user = (Users) ActionContext.getContext().getSession().get("user");
			Card ca = new Card();
			ca.setUserid(user.getUserid());
			ca.setCtid(new Integer(ctid));
			ca.setNumber(number);
			ca.setPrice(new Double(price));
			if(null != name && !name.equals(""))
				ca.setName(name);
			if(null != phone && !phone.equals(""))
				ca.setPhone(new Integer(phone));
			if(null != address && !address.equals(""))
				ca.setAddress(address);
			if(null != idcard && !idcard.equals(""))
				ca.setIdcard(idcard);
			
			ca.setSpend(0.00);
			ca.setRemain(new Double(price));
			ca.setSelltime(Common.df.format(new Date()));
			ca.setStatus(1);
			
			
			boolean a = cd.insert_card(ca);
			if(a)
			{
				map.put("state", true);
				map.put("msg", config.ADD_USER_RIGHT_MSG);
				Common.TOOLS.log_time(user.getName()+"添加了会员卡："+number,16);
			}
			else
			{
				map.put("state", false);
				map.put("msg", config.MYSQL_ERROR);
			}
			}
			
		}
		Common.TOOLS.return_object(Gsons.tojson(map));;
		
	}
}