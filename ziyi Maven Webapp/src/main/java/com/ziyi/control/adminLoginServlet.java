package com.ziyi.control;

import com.cyb.util.Common;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.control.cmd.Admin;
import com.ziyi.pojo.Users;
/**
 * 处理用户登录请求
 * @author 陈玉博
 * @date 2018年9月12日上午11:12:57
 */
public class adminLoginServlet extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	/**
	 * 处理用户后台登录
	 * @return
	 */
	public String adminlogin()
	{
		System.out.println("111");
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
