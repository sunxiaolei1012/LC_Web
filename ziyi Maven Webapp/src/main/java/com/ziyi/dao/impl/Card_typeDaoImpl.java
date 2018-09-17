package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Card_typeDao;
import com.ziyi.pojo.Card_type;


public class Card_typeDaoImpl implements Card_typeDao{

	public boolean insert_card(String name, Double reabte) {
		int a = Common.UTIL.getRes("insert into t_card_type values(null , ? , ?)", new Object[]{name , reabte});
		return a>0?true:false;
	}

	public boolean delete_card_id(int ctid) {
		int a = Common.UTIL.getRes("delete from t_card_type where ctid=?", new Object[]{ctid});
		return a>0?true:false;
	}

	public List<Card_type> select_card_type() {
		List<Card_type> card = Common.UTIL.query("select * from t_card_type", null, Card_type.class);
		if(null != card && card.size()>0)
			return card;
		return null;
	}

	public boolean update_card_type(Card_type ct) {
		int a = Common.UTIL.getRes("update t_card_type set cardtype=?,rebate=? where ctid=?", new Object[]{ct.getCardtype() , ct.getRebate() , ct.getCtid()});
		return a>0?true:false;
	}

	public Card_type select_card_ctid(int ctid) {
		List<Card_type> card = Common.UTIL.query("select * from t_card_type where ctid=?", new Object[]{ctid}, Card_type.class);
		if(null != card && card.size()>0)
			return card.get(0);
		return null;
	}

	public Card_type select_name(String name) {
		List<Card_type> card = Common.UTIL.query("select * from t_card_type where cardtype=?", new Object[]{name}, Card_type.class);
		if(null != card && card.size()>0)
			return card.get(0);
		return null;
	}

}
