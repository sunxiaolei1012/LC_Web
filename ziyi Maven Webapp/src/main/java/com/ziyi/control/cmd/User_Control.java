package com.ziyi.control.cmd;

import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.config;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Users;

public class User_Control {
	
	public String insert(String name , String password)
	{
		Map<String , String> map = new HashMap<String , String>();
		//1、判断用户名是否存在
		Users user_name = Common.USERS.select_name_user(name);
		if(user_name != null)
		{
			map.put("state", "false");
			map.put("msg", config.ADD_USER_ERROR_MSG);
		}
		else
		{
			Users user = new Users();
			user.setName(name);
			user.setPassword(password);
			user.setUserrole("3");
			Common.USERS.insert_user(user);
			map.put("state", "true");
			map.put("msg", config.ADD_USER_RIGHT_MSG);
			
		}
		Common.TOOLS.return_object(new Gson().toJson(map));
		return "json";
	}
	
	public String update_select(String id)
	{
		//根据用户ID 查询用户信息
		Users user = Common.USERS.select_id(new Integer(id));
		ActionContext.getContext().put("users", user);
		return "update_user_id";
	}
	public String xiu_user(String id , String name , String password , String userrole)
	{
		Map<String , String> map = new HashMap<String , String>(); 
		Users user_name = Common.USERS.select_name_user(name);
		if(user_name != null)
		{
			map.put("state", "false");
			map.put("msg", config.ADD_USER_ERROR_MSG);
		}
		else
		{
			Users user = new Users();
			user.setName(name);
			user.setPassword(password);
			user.setUserid(new Integer(id));
			user.setUserrole(userrole);
			boolean bool = Common.USERS.update_user(user);
			if(bool)
			{
				map.put("state", "true");
				map.put("msg", config.XIU_USER_RIGHT_MSG);
			}
			else
			{
				map.put("state", "false");
				map.put("msg", config.XIU_USER_ERROR_MSG);
			}
		}
		Common.TOOLS.return_object(new Gson().toJson(map));

		return "json";
	}
	
	public String del_user(String id)
	{
		boolean bool = Common.USERS.del_user(new Integer(id));
		return "del_user";
	}
	
}
