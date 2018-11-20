package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.VIEWDAO;
import com.ziyi.pojo.V_ORDER_SELLING;

public class VIEWDAOIMPL implements VIEWDAO{

	@Override
	public List<V_ORDER_SELLING> select(String number) {
		List<V_ORDER_SELLING> list = Common.UTIL.query("select * from v_order_selling_two where onumber = '"+number+"'", null, V_ORDER_SELLING.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}

}
