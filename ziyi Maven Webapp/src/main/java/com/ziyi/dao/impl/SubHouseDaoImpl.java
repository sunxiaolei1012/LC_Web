package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.SubHouseDao;
import com.ziyi.pojo.Sub_House;


public class SubHouseDaoImpl implements SubHouseDao{

	public Sub_House select_SubHouse() {
		@SuppressWarnings("unchecked")
		List<Sub_House>  sh =Common.UTIL.query("select * from t_subhouse", null, Sub_House.class);
		return sh.get(0);
	}

}
