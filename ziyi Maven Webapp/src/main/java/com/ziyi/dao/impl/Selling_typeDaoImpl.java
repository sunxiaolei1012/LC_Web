package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.Selling_typeDao;
import com.ziyi.pojo.Selling_type;


public class Selling_typeDaoImpl implements Selling_typeDao{

	public List<Selling_type> select_selling_type() {
		List<Selling_type> list = Common.UTIL.query("select * from t_selling_type", null, Selling_type.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}

	public String select_selling_type_name(int id) {
		List<Selling_type> list = Common.UTIL.query("select * from t_selling_type where type_id=?", new Object[]{id}, Selling_type.class);
		if(null != list && list.size()>0)
		{
			return list.get(0).getType_name();
		}
		return null;
	}

	public Selling_type select_type_name(String type_name) {
		List<Selling_type> list = Common.UTIL.query("select * from t_selling_type where type_name=?", new Object[]{type_name}, Selling_type.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	public boolean insert_sellect_type(String type_name) {
		int a =Util.getRes("insert into t_selling_type values(null,?)", new Object[]{type_name});
		return a>0?true:false;
	}

	public boolean del_selling_type(int id) {
		int a =Util.getRes("delete from t_selling_type where type_id=?", new Object[]{id});
		return a>0?true:false;
	}

	public Selling_type select_type_name(int id) {
		List<Selling_type> list = Common.UTIL.query("select * from t_selling_type where type_id=?", new Object[]{id}, Selling_type.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	public boolean update_selling_type(Selling_type selling_type) {
		int a = Common.UTIL.getRes("update t_selling_type set type_name=? where type_id=?", new Object[]{selling_type.getType_name() , selling_type.getType_id()});
		return a>0?true:false;
	}

	
}
