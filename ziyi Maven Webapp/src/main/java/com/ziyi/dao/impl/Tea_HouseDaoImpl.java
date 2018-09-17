package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Tea_HouseDao;
import com.ziyi.pojo.Tea_House;


public class Tea_HouseDaoImpl implements Tea_HouseDao{

	public boolean insert_house(String str) {
		int a = Common.UTIL.getRes("insert into t_tea_house values(null ,? ,0)", new Object[]{str});
		return a>0?true:false;
	}

	public List<Tea_House> select_House() {
		List<Tea_House> list = Common.UTIL.query("select * from t_tea_house ", null, Tea_House.class);
		if(null != list && list.size() >0)
		{
			return list;
		}
		return null;
	}

	public Tea_House select_House_id(int id) {
		List<Tea_House> list = Common.UTIL.query("select * from t_tea_house where houseid=? ", new Object[]{id}, Tea_House.class);
		if(null != list && list.size() >0)
		{
			return list.get(0);
		}
		return null;
	}

	public boolean update_house_tea(int id, int status) {
		int a = Common.UTIL.getRes("update t_tea_house set status=? where houseid=?", new Object[]{status , id});
		return a>0?true:false;
	}

	public boolean del_house(int id) {
		int a =Common.UTIL.getRes("delete from t_tea_house where houseid=?", new Object[]{id});
		return a>0?true:false;
	}

}
