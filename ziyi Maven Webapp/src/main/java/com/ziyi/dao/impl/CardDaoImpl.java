package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.CardDao;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Order;


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
	public Card select_card_numbers(String number) {
		List<Card> list = Common.UTIL.query("select * from t_card where number=? ORDER BY selltime desc LIMIT 0,1", new Object[]{number}, Card.class);
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
		String sql = "select * from t_card limit "+(page-1)*count+","+count+" ";
		return Common.UTIL.query(sql, null, Card.class);
	}
	public List<Card> select_cards() {
		String sql = "select * from t_card ";
		return Common.UTIL.query(sql, null, Card.class);
	}
	public List<Card> select_cardtype(String id , String str) {
		String sql = "select * from t_card where status="+id + str;
		System.out.println(sql);
		return Common.UTIL.query(sql, null, Card.class);
	}
	
	//sxl
	public List<Card> showCardType() {
		// TODO Auto-generated method stub
		return null;
	}


	public List<Card> showCardByTime() {
		String sql="select *  from t_card where date(selltime) = curdate();  ";
			List<Card> list=Common.UTIL.query(sql, null, Card.class);
		return list;
	}

	
	public int addCard(Card card) {
		String sql="insert into  t_card  values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
			int a =Util.getRes(sql, new Object[]{card.getCtid(),card.getNumber(),card.getName(),
					card.getPhone(),card.getAddress(),card.getIdcard(),card.getPrice(),card.getSpend(),
					card.getRemain(),card.getSelltime(),card.getStatus(),card.getUserid()});
		return a;
	}

	
	public int checkCardId(String  number) {
			String sql="select * from t_card where number=?";
			List<Card> list=Common.UTIL.query(sql, new Object[]{number}, Card.class);
			if(list.size()>0 && list!=null)
				return 1;
		return 0;
	}


	public List<Card> select_card(String sql) {
		List<Card> list=Common.UTIL.query(sql, null, Card.class);
		if(list.size()>0 && list!=null)
			return list;
	return null;
	}

	
	public int allCount() {
		  String sql ="select count(ctid) from t_card ";
		   int a=Common.UTIL.sqlCount(sql);
		   
		return a;
	}

	
	public List<Card> icCount(String begintime, String endtime) {
		String  sql="select * from t_card where selltime between '?' and '?'";
		List<Card> list=Common.UTIL.query(sql, new Object[]{begintime ,endtime}, Card.class);
		if(list.size()>0&& list!=null)
			return list;
		
		return null;
	}

	@Override
	public List<Order> check_oder_cardid(int cardid) {
			String sql="select * from t_order where cardid=?  order by checkouttime desc limit 0,10";
			List<Order> list=Common.UTIL.query(sql, new Object[]{cardid}, Order.class);
			if(list.size()>0&& list!=null)
				return list;
			
			return null;
		
	}
		
	

}
