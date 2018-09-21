package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.UsersDao;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Users;


public class UsersDaoImpl implements UsersDao{

	public Users select_id_user(String name, String password) {
		List<Users> list = Common.UTIL.query("select * from t_users where name=? and password=?", new Object[]{name , password}, Users.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	public boolean update_user(Users user) {
		int a =Common.UTIL.getRes("update t_users set name=?,password=?,userrole=? where userid=? ", new Object[]{user.getName() , user.getPassword() , user.getUserrole() , user.getUserid()});
		if( a>0)
		{
			return true;
		}
		return false;
	}

	public String select_id_name(Integer id) {
		List<Users> list = Common.UTIL.query("select * from t_users where userid=?", new Object[]{id}, Users.class);
		if(null != list && list.size()>0)
		{
			return list.get(0).getName();
		}
		return null;
	}

	public List<Users> select_show() {
		List<Users> list = Common.UTIL.query("select * from t_users", null, Users.class);
		if(null != list && list.size()>0)
		{
			return list;
		}
		return null;
	}

	public boolean insert_user(Users user) {
		int a =Common.UTIL.getRes("insert into t_users values(null , ?,?,?)", new Object[]{user.getName(),user.getPassword(),user.getUserrole()});
		return a>0?true:false;
	}

	public Users select_name_user(String name) {
		List<Users> list = Common.UTIL.query("select * from t_users where name=?", new Object[]{name}, Users.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	public Users select_id(int uid) {
		List<Users> list = Common.UTIL.query("select * from t_users where userid=?", new Object[]{uid}, Users.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	public boolean del_user(int id) {
		int a = Common.UTIL.getRes("delete from t_users where userid=?", new Object[]{id});
		return a>0?true:false;
	}
	//sxl
	public int checkUserLogin(String name, String password) {
		String sql="select userid from t_users where name=? and password=?";
		List<Users> list=Common.UTIL.query(sql, new Object[]{name,password}, Users.class);
		int a=1;
		if(list.size()==0 || list.equals(null)){
			a=0;
		}
		return a;
	}

	
	public List<Users> findSort() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public List<Selling_list> showProductList(int pageNo,int pageCount ) {
		String sql="select * from t_selling_list limit "+pageNo*pageCount+","+pageCount+"";
		@SuppressWarnings("unchecked")
		List<Selling_list> list=Common.UTIL.query(sql, null, Selling_list.class);
		if(list.size()==0&&list.equals(null)){
			return null;
		}
		return list;
	}


	public int allCount() {
		
		String sql="select COUNT(sellingid) from t_selling_list";
		int a=Common.UTIL.sqlCount(sql);
		
		return a;
	}

	public int updateProductName(int sellingid,String name) {
		String sql="update t_selling_list set name=? where sellingid=? ";
		int a=Common.UTIL.getRes(sql, new Object[]{name,sellingid});
		return a;
	}


	public int delProductById(int sellingid) {
		String sql="delete from t_selling_list where sellingid=?";
		int a=Common.UTIL.getRes(sql, new Object[]{sellingid});
		return a;
	}

	
	public int updateNumByName(int num,String name) {
		
		String sql="update t_selling_list set number=? where name=?";
		int a=Common.UTIL.getRes(sql, new Object[]{num,name});
		return a;
	}
	
	

}
