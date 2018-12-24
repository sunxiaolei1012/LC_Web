package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Old_CardDao;
import com.ziyi.pojo.Log;
import com.ziyi.pojo.Old_Card;

public class Old_CardDaoImpl implements Old_CardDao{

	@Override
	public Old_Card select_value_number(String value) {
		// TODO Auto-generated method stub
		List<Old_Card> list = Common.UTIL.query("select * from t_old_card where value=?", new Object[]{value}, Old_Card.class);
		if(null != list && list.size()>0)
			return list.get(0);
		return null;
	}

	@Override
	public Old_Card select_number_value(String number) {
		// TODO Auto-generated method stub
		List<Old_Card> list = Common.UTIL.query("select * from t_old_card where number=?", new Object[]{number}, Old_Card.class);
		if(null != list && list.size()>0)
			return list.get(0);
		return null;
	}

	@Override
	public boolean insert_old_card(Old_Card oc) {
		int a = Common.UTIL.getRes("insert into t_old_card values(null , ? ,? )", new Object[]{oc.getValue() , oc.getNumber()});
		return a>0?true:false;
	}

	@Override
	public boolean del_number_old_card(String number) {
			int a = Common.UTIL.getRes("delete from t_old_card where number=?", new Object[]{number});
			return a>0?true:false;
	}

	@Override
	public boolean del_id_old_card(int id) {
		int a = Common.UTIL.getRes("delete from t_old_card where id=?", new Object[]{id});
		return a>0?true:false;
	}

	@Override
	public List<Old_Card> show(String str) {
		List<Old_Card> list = Common.UTIL.query(str, null, Old_Card.class);
		if(list != null && list.size()>0)
			return list;
		return null;
	}

}
