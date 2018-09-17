package com.ziyi.control.cmd;

import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.config;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Card_type;

/**
 * 会员卡类型管理
 * @author 陈玉博
 * @date 2018年9月16日下午3:48:53
 */
public class CardTypeControl {

	/**
	 * 获取全部会员卡信息
	 * @return
	 */
	public String get_card_type()
	{
		ActionContext.getContext().put("card_type", Common.CARDTYPE.select_card_type());
		return "get_card_type";
	}
	/**
	 * 添加会员卡信息
	 * @return
	 */
	public String add_card_type(String cardtype , String rebate)
	{
		Map<String , String> map = new HashMap<String , String>();
		
		Card_type cardtypes = Common.CARDTYPE.select_name(cardtype);
		if(cardtypes != null)
		{
			map.put("state", "false");
			map.put("msg", config.ADD_CARD_TYPE_ERROR_MSG);
		}
		else
		{
			Common.CARDTYPE.insert_card(cardtype, new Double(rebate));
			map.put("state", "true");
			map.put("msg", config.ADD_USER_RIGHT_MSG);
		}
		Common.TOOLS.return_object(new Gson().toJson(map));
		return "json";
	}
	
	/**
	 * 根据会员卡ID 获取会员卡信息
	 */
	public String get_cardtype_id(String id)
	{
		Card_type card = Common.CARDTYPE.select_card_ctid(new Integer(id));
		ActionContext.getContext().put("cardType", card);
		return "update_cardtype";
	}
	
	/**
	 * 根据会员卡类型ID  修改会员卡信息
	 */
	public String xiu_cardtype(String id , String catdtype , String rebate)
	{
		Card_type cardtypes = Common.CARDTYPE.select_name(catdtype);
		if(cardtypes != null)
		{
			Common.TOOLS.return_map_object(false, config.XIU_USER_RIGHT_MSG, config.ADD_CARD_TYPE_ERROR_MSG);
		}
		else
		{
		Card_type ct = new Card_type();
		ct.setCardtype(catdtype);
		ct.setCtid(new Integer(id));
		ct.setRebate(new Double(rebate));
		boolean bool = Common.CARDTYPE.update_card_type(ct);
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		}
		return "json";
	}
	/**
	 * 根据ID 删除卡类型
	 * @param id
	 * @return
	 */
	public String del_cardtype(String id)
	{
		Common.CARDTYPE.delete_card_id(new Integer(id));
		return "del_cardtype";
	}
}
