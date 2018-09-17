package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Selling_listDao;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Selling_list;


public class Selling_listDaoImpl implements Selling_listDao{

	public int insert_Selling_list(Selling_list sl) {
		int a =Common.UTIL.getRes("insert into t_selling_list values(null ,?,?,?,?,?,?,?,?,?,0)", 
				new Object[]{sl.getName() , sl.getPrice() , sl.getUnit() , sl.getRebate() , sl.getProportion() , sl.getUserid() , sl.getPycode() , sl.getTypeid(),sl.getXiangxi()});
		
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
       int a =	Common.UTIL.getRes("update t_selling_list set name=?,price=?,unit=?,rebate=?,proportion=?,pycode=?,typeid=?,xiangxi=? where sellingid=?", new Object[]{list.getName() ,list.getPrice(), list.getUnit() , list.getRebate() , list.getProportion() , list.getPycode() , list.getTypeid() ,list.getXiangxi(),list.getSellingid()});
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

}
