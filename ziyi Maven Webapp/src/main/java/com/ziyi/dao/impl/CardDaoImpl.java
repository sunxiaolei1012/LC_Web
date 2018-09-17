package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.CardDao;
import com.ziyi.pojo.Card;


public class CardDaoImpl implements CardDao{

	public boolean insert_card(Card ca) {
		int a = Util.getRes("insert into t_card values(null , ?,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{
				ca.getCtid() , ca.getNumber() , ca.getName() , ca.getPhone() , ca.getAddress() , ca.getIdcard(),
				ca.getPrice() , ca.getSpend() , ca.getRemain(),ca.getSelltime() ,ca.getStatus() ,ca.getUserid()
		});
		return a>0?true:false;
	}

	public boolean select_card_id(String number) {
		List<Card> list = Common.UTIL.query("select * from t_card where number=?", new Object[]{number}, Card.class);
		if(null != list && list.size()>0)
			return true;
		return false;
	}

	public Card select_card_number(String number) {
		List<Card> list = Common.UTIL.query("select * from t_card where number=?", new Object[]{number}, Card.class);
		if(null != list && list.size()>0)
			return list.get(0);
		return null;
	}

	public boolean del_card_number(String number) {
		int a = Common.UTIL.getRes("delete from t_card where number=?", new Object[]{number});
		return a>0?true:false;
	}

	public boolean update_card_number(Card ca) {
		int a =Common.UTIL.getRes("update t_card set price=? ,remain=? where number=?", new Object[]{ca.getPrice() , ca.getRemain() ,ca.getNumber()});
		return a>0?true:false;
	}

	public List<Card> select_card() {
			List<Card> list = Common.UTIL.query("select * from t_card ", null, Card.class);
			if(null != list && list.size()>0)
				return list;
			return null;
	}

	public Card select_card_id(int id) {
		List<Card> list = Common.UTIL.query("select * from t_card where cardid=?", new Object[]{id}, Card.class);
		if(null != list && list.size()>0)
			return list.get(0);
		return null;
	}

	public boolean update_card(Card ca) {
		int a =Util.getRes("update t_card set number=?,ctid=?,name=?,phone=?,address=?,idcard=?,price=?,spend=?,remain=? where cardid=?", new Object[]{
						ca.getNumber(),ca.getCtid(),ca.getName(),ca.getPhone(),ca.getAddress(),ca.getIdcard(),ca.getPrice(),ca.getSpend(),ca.getRemain(),ca.getCardid()});
		return a>0?true:false;
	}

	public boolean del_card_id(int id) {
		int a = Common.UTIL.getRes("delete from t_card where cardid=?", new Object[]{id});
		return a>0?true:false;
	}

	public List<Card> select_card(int page, int count) {
		String sql = "select * from t_card limit "+(page-1)*count+","+count+"";
		return Common.UTIL.query(sql, null, Card.class);
	}

}
