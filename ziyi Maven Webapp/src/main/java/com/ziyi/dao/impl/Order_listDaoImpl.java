package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.Order_listDao;
import com.ziyi.pojo.Order_list;


public class Order_listDaoImpl implements Order_listDao{

	public boolean insert_order_list(Order_list ol) {
		int a = Common.UTIL.getRes("insert into t_order_list values(null , ? ,? ,?)", new Object[]{ol.getOrderid() , ol.getSellingid() , ol.getNumber()});
		return a>0?true:false;
	}

	public Order_list select_number_order(Integer orderid, Integer goodsid) {
		List<Order_list> list = Common.UTIL.query("select * from t_order_list where orderid=? and sellingid=?", new Object[]{orderid , goodsid}, Order_list.class);
		if(null != list && list.size()>0)
			return list.get(0);
		return null;
	}

	public boolean update_id_numbers(Integer id, Integer number) {
		int a = Util.getRes("update t_order_list set number=? where id=?", new Object[]{number , id});
		return a>0?true:false;
	}
	public boolean update_id_number(Double dou , Integer id , Integer order) {
		int a = Util.getRes("update t_order_list p ,t_order o set p.number=p.number-1,o.price=o.price-? where p.orderid=o.orderid and p.id=? and o.orderid=?",
				new Object[]{dou , id , order});
		return a>0?true:false;
	}

	public boolean del_id(Integer id , Double price , Integer orderid) {
		int a = Common.UTIL.getRes("delete from t_order_list where id=?", new Object[]{id});
		if(a>0)
		{
			int b = Common.UTIL.getRes("update t_order set price=price-? where orderid=?", new Object[]{price , orderid});
			return b>0?true:false;
		}
		return a>0?true:false;
	}

	public List<Order_list> select_number_order(Integer order) {
		List<Order_list> list = Common.UTIL.query("select * from t_order_list where orderid=?", new Object[]{order}, Order_list.class);
		if(null != list && list.size()>0)
			return list;
		return null;
	}

}
