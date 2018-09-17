package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.UsersDao;
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

}
