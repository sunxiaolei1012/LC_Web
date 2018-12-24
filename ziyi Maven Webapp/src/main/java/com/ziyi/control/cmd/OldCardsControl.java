package com.ziyi.control.cmd;

import com.cyb.util.Common;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Old_Card;

public class OldCardsControl {

	
	public String update(String id)
	{
		Old_Card old = Common.OLDDAO.select_number_card(new Integer(id));
		if(old!=null)
		{
			ActionContext.getContext().put("old", old);
		}
		return "update_old_card";
	}
	
	public String xiu(String id , String number)
	{
		boolean bool = Common.OLDDAO.update_id_number(new Integer(id), number);
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		return "json";
	}
}
