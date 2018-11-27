package com.ziyi.control.cmd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.cyb.util.config;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Card_type;

/**
 * 会员卡管理
 * 
 * @author 陈玉博
 * @date 2018年9月16日下午3:48:53
 */
public class CardControl {

	/**
	 * 获取会员卡信息 //分页
	 * 
	 * @return
	 */
	public String get_cards() {
		List<Card> list = Common.CARDDAO.select_cards();
		ActionContext.getContext().put("card", list);
		ActionContext.getContext().put("id", -1);
		ActionContext.getContext().put("value", null);
		ActionContext.getContext().put("card_type", Common.CARDTYPE.select_card_type());

		return "get_card";
	}

	/**
	 * 获取会员卡信息 //分页
	 * 
	 * @return
	 */
	public String get_card(String page) {
		// 1、获取到要取第几页内容
		int new_page = 0;
		if (page != null)
			new_page = new Integer(page);
		// 2、查询总共有多少条数据
		int a = Util.sqlCount("select COUNT(cardid) as count from t_card");
		if (a != 0) {

			int zong = a / config.PAGE_CARD_SHOW_NUMBER;
			// 判断总共有多少页，
			if (a % config.PAGE_CARD_SHOW_NUMBER != 0)
				zong += 1;

			if (new_page <= 0 || new_page > zong)
				new_page = 1;

			List<Card> list = Common.CARDDAO.select_card(new_page, config.PAGE_CARD_SHOW_NUMBER);

			ActionContext.getContext().put("card", list);
			ActionContext.getContext().put("zong", zong);
			ActionContext.getContext().put("page", new_page);
			ActionContext.getContext().put("card_type", Common.CARDTYPE.select_card_type());
		}

		return "get_card";
	}

	/**
	 * 添加会员卡信息
	 * 
	 * @return
	 */
	public String add_card_type(String cardtype, String rebate) {
		Map<String, String> map = new HashMap<String, String>();

		Card_type cardtypes = Common.CARDTYPE.select_name(cardtype);
		if (cardtypes != null) {
			map.put("state", "false");
			map.put("msg", config.ADD_CARD_TYPE_ERROR_MSG);
		} else {
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
	public String get_card_id(String id) {
		Card card = Common.CARDDAO.select_card_id(new Integer(id));
		ActionContext.getContext().put("card", card);
		ActionContext.getContext().put("card_type", Common.CARDTYPE.select_card_type());
		return "update_card";
	}

	/**
	 * 根据会员卡类型ID 修改会员卡信息
	 */
	public String xiu_card(String id, String number, String ctid, String name, String phone, String address,
			String idcard, String price, String spend, String remain) {
		Card card = new Card();
		card.setAddress(address);
		card.setCardid(new Integer(id));
		card.setCtid(new Integer(ctid));
		card.setIdcard(idcard);
		card.setName(name);
		card.setNumber(number);
		card.setPhone(new Integer(phone));
		card.setPrice(new Double(price));
		card.setRemain(new Double(remain));
		card.setSpend(new Double(spend));
		boolean bool = Common.CARDDAO.update_card(card);
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		return "json";
	}

	/**
	 * 根据ID 删除会员卡
	 * 
	 * @param id
	 * @return
	 */
	public String del_card(String id) {
		Common.CARDDAO.del_card_id(new Integer(id));
		return "del_card";
	}
}
