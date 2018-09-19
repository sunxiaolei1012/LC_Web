package com.ziyi.control.cmd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.config;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Tea_House;

/**
 * 房屋位置管理
 * @author 陈玉博
 * @date 2018年9月18日下午2:06:30
 */
public class TeaHouseControl {

	/**
	 * 获取房屋位置信息
	 * @return
	 */
	public String get_tea_house()
	{
		List<Tea_House> list = Common.HOUSE.select_House();
		ActionContext.getContext().put("list", list);
		return "get_tea_house";
	}
	/**
	 * 添加会员卡信息
	 * @return
	 */
	public String add_tea_house(String housename , String position)
	{
		Tea_House th = new Tea_House();
		th.setHousename(housename);
		th.setStatus(0);
		if(position == null || position.equals(" "))
			position = "1";
		th.setPosition(new Integer(position));
		boolean bool = Common.HOUSE.insert_house(th);
		Common.TOOLS.return_map_object(bool, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
		return "json";
	}
	
	/**
	 * 根据桌位ID  查询桌位信息
	 */
	public String get_tea_house(String id)
	{
		ActionContext.getContext().put("house", Common.HOUSE.select_House_id(new Integer(id)));
		return "update_tea_house";
	}
	
	/**
	 * 根据桌位ID 修改桌位信息
	 */
	public String xiu_card(String id , String housename , String status , String position)
	{
		Tea_House th = new Tea_House();
		th.setHouseid(new Integer(id));
		th.setHousename(housename);
		th.setPosition(new Integer(position));
		th.setStatus(new Integer(status));
		boolean bool = Common.HOUSE.update_house(th);
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		return "json";
	}
	/**
	 * 根据ID 删除会员卡
	 * @param id
	 * @return
	 */
	public String del_card(String id)
	{
//		Common.CARDDAO.del_card_id(new Integer(id));
		Common.HOUSE.del_house(new Integer(id));
		return "del_house";
	}
}
