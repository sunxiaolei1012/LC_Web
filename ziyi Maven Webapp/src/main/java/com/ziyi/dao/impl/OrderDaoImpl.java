package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.OrderDao;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.Selling_list;


public class OrderDaoImpl implements OrderDao{

	public Order select_number_order(String number) {
		List<Order> list = Common.UTIL.query("select * from t_order where number=?", new Object[]{number}, Order.class);
		if(null != list && list.size() >0)
		{
			return list.get(0);
		}
		return null;
	}
	public boolean insert_number_order(Order order) {
		int a = Common.UTIL.getRes("insert into t_order values(null ,?,?,?,?,?,?,?,?,?,?,?)", new Object[]{order.getNumber() , order.getOrdertime() , order.getPrice() , order.getUserid() ,order.getStatus() , order.getType() , order.getCheckouttime() , order.getPay_price() , order.getCardid(),order.getHouseid(),order.getAccountuserid()});
		return a>0?true:false;
	}

	public boolean update_number_order(String number , Double price) {
		int a = Common.UTIL.getRes("update t_order set price=? where number=?", new Object[]{price , number});
		return a>0?true:false;
	}

	public boolean delete_order_list(Integer orderid) {
		int a = Common.UTIL.getRes("DELETE t_order, t_order_list from t_order LEFT JOIN t_order_list ON t_order.orderid=t_order_list.orderid WHERE t_order.orderid=?", new Object[]{orderid});
		return a>0?true:false;
	}

	public List<Order> list_order_json() {
		List<Order> list = Common.UTIL.query("select number,ordertime,price,status from t_order", null, Order.class);
		if(null != list && list.size() >0)
		{
			return list;
		}
		return null;
	}

	public Order select_number_json(String number) {
	List<Order> list = Common.UTIL.query("select number,ordertime,price,status from t_order where number=?", new Object[]{number}, Order.class);
	if(null != list && list.size() >0)
		return list.get(0);
	return null;
	}

	public boolean update_order_card(Double dou , int type , String time , int orderid , int cardid) {
		
		int a = Util.getRes("update t_order tos ,t_card tc set tc.remain=tc.remain-?,tc.spend=tc.spend+?,tos.`status`=1,tos.type=?,tos.checkouttime=?,tos.pay_price=?,tos.cardid=?  where  tos.orderid=? and tc.cardid=?", 
				new Object[]{dou,dou, type , time , dou, cardid, orderid , cardid});
		return a>0?true:false;
	}

	public boolean update_two_order(int type , String time ,Double dou , String number) {
		int a =Common.UTIL.getRes("update t_order set status=1,type=?,checkouttime=?,pay_price=? where number=?", new Object[]{type ,time , dou,number});
		return a>0?true:false;
	}
	public Order select_houseid_state(int status, int houseid) {
		List<Order> list = Common.UTIL.query("select * from t_order where status=? and houseid=? order by ordertime desc", new Object[]{status , houseid}, Order.class);
		if(null != list && list.size() >0)
			return list.get(0);
		return null;
	}
	//sxl
	public List<Order> select_IcOrder(String sql) {
		List<Order> list=Common.UTIL.query(sql, null, Order.class);
		if(list.size()>0&&list!=null)
			return list;
		return null;
	}

	

	
	public List<Order> select_XjOrder(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<Order> select_ZfOrder(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<Order> select_WxOrder(String sql) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<Order> select_YhOrder(String sql) {
		// TODO Auto-generated method stub
		return null;
	}
	public Selling_list select_xubei_order(String number) {
		List<Selling_list> list = Common.UTIL.query("select * from t_selling_list where sellingid in (select sellingid from t_order_list where  orderid in (select orderid from t_order where number='"+number+"')) and typeid=1 ORDER BY price desc", null, Selling_list.class);
		if(list.size()>0&&list!=null)
			return list.get(0);
		return null;
	}
	@Override
	public List<Order> select_card_id(int id) {
		List<Order> list = Common.UTIL.query("select * from t_order where cardid=? ORDER BY checkouttime desc LIMIT 0,10;", new Object[]{id}, Order.class);
		if(list.size()>0&&list!=null)
			return list;
		return null;
	}
	@Override
	public Order select_number_orderId(int orderid) {
		String sql="select  * from t_order where orderid=?";
		List<Order> order=Common.UTIL.query(sql, new Object[]{orderid}, Order.class);
		if(order.size()>0&&order!=null)
			return order.get(0);
		return null;
		
	}


}
