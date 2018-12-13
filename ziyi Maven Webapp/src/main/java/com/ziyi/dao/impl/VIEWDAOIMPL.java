package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.VIEWDAO;
import com.ziyi.pojo.V_ORDER_SELLING;
import com.ziyi.pojo.entity.V_Dian;
import com.ziyi.pojo.entity.V_Jie;

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

	@Override
	public List<V_Dian> select_dian() {
		List<V_Dian> list = Common.UTIL.query("select * from v_yeji_dian ", null, V_Dian.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}

	@Override
	public List<V_Jie> select_jie() {
		List<V_Jie> list = Common.UTIL.query("select * from v_yeji_jie", null, V_Jie.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}

}
