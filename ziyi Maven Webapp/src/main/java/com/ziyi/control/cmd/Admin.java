package com.ziyi.control.cmd;

import java.util.List;

import com.cyb.util.Common;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Users;

public class Admin {
	
	
	
	/**
	 * 处理后台管理登录
	 * @return
	 */
	public String admin_login(String name , String password)
	{
		
	 	Users user = Common.USERS.select_id_user(name, password);
		//根据用户名与密码判断用户是否存在
		if(user == null)
		{
			String str = "用户不存在或密码错误";
			ActionContext.getContext().put("list", str);
			return "login";
		}
		else
		{
			ActionContext.getContext().getSession().put("role", Common.ROLE.showRole());
			ActionContext.getContext().getSession().put("ctype",Common.CARDTYPE.select_card_type());
			ActionContext.getContext().getSession().put("user", user);
			return "main";
		}
	}
	/**
	 * 查询全部用户信息
	 * @return
	 */
	public String admin_user()
	{
		List<Users> list = Common.USERS.select_show();
		ActionContext.getContext().put("list", list);
		return "list";
	}

}
