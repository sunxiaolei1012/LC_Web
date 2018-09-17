package com.ziyi.control.cmd;

import com.cyb.util.Common;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Selling_type;

/**
 * 商品类型管理
 * @author 陈玉博
 * @date 2018年9月16日下午3:48:53
 */
public class SellingTypeControl {

	/**
	 * 获取全部商品类别
	 * @return
	 */
	public String get_selling_type()
	{
		ActionContext.getContext().put("selling_type", Common.STYPE.select_selling_type());
		return "get_selling_type";
	}
	
	
	public String add_selling_type(String type_name)
	{
		Selling_type selling_type = Common.STYPE.select_type_name(type_name);
		if(selling_type != null)
		{
			Common.TOOLS.return_map_object(false, config.XIU_USER_RIGHT_MSG, config.ADD_SELLING_TYPE_ERROR_MSG);
		}
		else
		{
			boolean bool = Common.STYPE.insert_sellect_type(type_name);
			Common.TOOLS.return_map_object(bool, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
		}
		return "json";
	}
	
	public String del_selling_type(String id)
	{
		Common.STYPE.del_selling_type(new Integer(id));
		return "del_selling_type";
	}
	
	public String get_selling_type(String id)
	{
		ActionContext.getContext().put("selling_type", Common.STYPE.select_type_name(new Integer(id)));
		return "update_selling_type";
	}
	
	public String xiu_selling_type(String id , String name)
	{
		Selling_type selling_type = Common.STYPE.select_type_name(name);
		if(selling_type != null)
		{
			Common.TOOLS.return_map_object(false, config.XIU_USER_RIGHT_MSG, config.ADD_SELLING_TYPE_ERROR_MSG);
		}
		else
		{
			Selling_type st = new Selling_type();
			st.setType_id(new Integer(id));
			st.setType_name(name);
			boolean bool = Common.STYPE.update_selling_type(st);
			Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		}
		return "json";
	}

	
}
