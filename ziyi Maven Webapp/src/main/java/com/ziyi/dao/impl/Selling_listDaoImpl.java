package com.ziyi.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Selling_listDao;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Selling_type;


public class Selling_listDaoImpl implements Selling_listDao{

	public int insert_Selling_list(Selling_list sl) {
		int a =Common.UTIL.getRes("insert into t_selling_list values(null ,?,?,?,?,?,?,?,?,?,?)", 
				new Object[]{sl.getName() , sl.getPrice() , sl.getUnit() , sl.getRebate() , sl.getProportion() , sl.getUserid() , sl.getPycode() , sl.getTypeid(),sl.getXiangxi(),sl.getNumber()});
		
		if(a > 0)
		{
			List<Selling_list> list = Common.UTIL.query("select sellingid from t_selling_list order by sellingid  desc limit 1 ", null,Selling_list.class);
			for (Selling_list ite : list) {
				a=ite.getSellingid();
			}
		}
		return a;
	}

//	public List<Return_Sellings> select_list(String str) {
//		List<Return_Sellings> list = Common.UTIL.query(str, null, Return_Sellings.class);
//		if(null != list && list.size()>0)
//			return list;
//		return null;
//	}
	public Selling_list selecct_id_list(int id) {
		List<Selling_list> list = Common.UTIL.query("select * from t_selling_list where sellingid=?", new Object[]{id}, Selling_list.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	public boolean update_selling_list(Selling_list list) {
       int a =	Common.UTIL.getRes("update t_selling_list set name=?,price=?,unit=?,rebate=?,proportion=?,pycode=?,typeid=?,xiangxi=?,number=? where sellingid=?", new Object[]{list.getName() ,list.getPrice(), list.getUnit() , list.getRebate() , list.getProportion() , list.getPycode() , list.getTypeid() ,list.getXiangxi(),list.getNumber(),list.getSellingid()});
		return a>0?true:false;
	}

	public boolean del_selling_list(int id) {
		int a = Common.UTIL.getRes("delete from t_selling_list where sellingid=?", new Object[]{id});
		return a>0?true:false;
	}

	public List<Selling_list> select_selling_list(int begin , int end) {
		List<Selling_list> list = Common.UTIL.query("select * from t_selling_list ORDER BY number desc LIMIT ?,?", new Object[]{begin,end}, Selling_list.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Selling_list> select_selling_list_page(int page, int count) {
		String sql = "select * from t_selling_list limit "+(page-1)*count+","+count+"";
		return Common.UTIL.query(sql, null, Selling_list.class);
	}
	public List<Selling_list> select_selling_list_pages() {
		String sql = "select * from t_selling_list";
		return Common.UTIL.query(sql, null, Selling_list.class);
	}

	public List<Selling_list> select_selling_type(int id) {
		List<Selling_list> list = Common.UTIL.query("select * from t_selling_list where typeid=?", new Object[]{id}, Selling_list.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}


//sxl
	public List<Selling_type> show_productSort() {
		String sql = "select type_id, type_name from t_selling_type ";
		List<Selling_type> list=Common.UTIL.query(sql, null, Selling_type.class);
		return list;
	}


	public int add_productSort(String name) {
		String sql ="insert into t_selling_type set type_name=? ";
		int a=Common.UTIL.getRes(sql, new Object[]{name});
		
		return a;
	}

	
	public int del_productSort(int type_id) {
		String sql="delete from t_selling_type where type_id=?";
		int a=Common.UTIL.getRes(sql, new Object[]{type_id});
		return a;
	}

	
	public List<Selling_list> show_sortProduct(int sellingid) {
		String sql="select * from t_selling_list where typeid=?";
		List<Selling_list> list=Common.UTIL.query(sql, new Object[]{sellingid}, Selling_list.class);
		
 		return list;
	}

	
	public int Ic_Card_AllMoney() {
		String sql="select SUM(pay_price) from t_order where   date(ordertime) = curdate(); ";
	      int a=Common.UTIL.sqlCount(sql);
		
		
		return a;
	}

	
	public int check_pname(String name) {
		
		String sql="select * from t_selling_list where name=? ";
			List<Selling_list> list =Common.UTIL.query(sql, new Object[]{name},Selling_list.class);
			if(list != null && list.size()>0)
				return 1;
		return 0;
	}

	@Override
	public List<Selling_list> select_price_jusl(double price, String in) {
		List<Selling_list> list = new ArrayList<Selling_list>();
		list = Common.UTIL.query("select * from t_selling_list where price"+in+"? and typeid=1", new Object[]{price}, Selling_list.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}
	@Override
	public List<Selling_list> show_selling_list() {
		
		String sql="select * from t_selling_list";
		List<Selling_list> list=Common.UTIL.query(sql, null, Selling_list.class);
		if(list!=null && list.size()>0)
		return list;
		
	return null;	
	}

	@Override
	public Selling_list selecct_orderid_list(int orderid) {
		List<Selling_list> list = Common.UTIL.query("select * from t_selling_list where sellingid=?", new Object[]{orderid}, Selling_list.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
		
	}

}
