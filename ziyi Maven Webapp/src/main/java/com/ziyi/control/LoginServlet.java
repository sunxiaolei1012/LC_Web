package com.ziyi.control;

import java.util.Date;
import java.util.List;

import com.cyb.util.Common;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.port.main.Main;
import com.ziyi.control.cmd.Admin;
import com.ziyi.pojo.Role;
import com.ziyi.pojo.Users;
/**
 * 处理用户登录请求
 * @author 陈玉博
 * @date 2018年9月12日上午11:12:57
 */
public class LoginServlet extends ActionSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	/**
	 * 处理用户登录
	 * @return
	 */
	public String login()
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
			ActionContext.getContext().getSession().put("user", user);
			ActionContext.getContext().getSession().put("role", Common.ROLE.showRole());
			ActionContext.getContext().getSession().put("ctype",Common.CARDTYPE.select_card_type());
			Common.TOOLS.log_time(user.getName()+"登录了系统",1);
			return "main";
		}
	}
	/**
	 * 用来处理用户退出
	 * @return
	 */
	public String exit()
	{
		ActionContext.getContext().getSession().remove("user");
		return "login";
		
	}
	
	/**
	 * 处理用户后台登录
	 * @return
	 */
	public String adminlogin()
	{
		return new Admin().admin_login(name, password);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
