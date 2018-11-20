package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.SubHouseDao;
import com.ziyi.pojo.Sub_House;


public class SubHouseDaoImpl implements SubHouseDao{

	public Sub_House select_SubHouse() {
		@SuppressWarnings("unchecked")
		List<Sub_House>  sh =Common.UTIL.query("select * from t_subhouse", null, Sub_House.class);
		return sh.get(0);
	}

	public boolean update_subhouse(Sub_House sh) {
		int a =Util.getRes("update t_subhouse set name=?,address=?,tel=?,manager=?", new Object[]{sh.getName() , sh.getAddress(),sh.getTel(),sh.getManager()});
		return a>0?true:false;
		
	}

}
