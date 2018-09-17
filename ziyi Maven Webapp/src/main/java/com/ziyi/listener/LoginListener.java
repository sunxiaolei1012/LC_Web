package com.ziyi.listener;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.ziyi.pojo.Users;

public class LoginListener extends AbstractInterceptor {


	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
//		System.out.println("1111");
		//1.获取session对象
			HttpSession session = ServletActionContext.getRequest().getSession();
			//2.在session域中找user对象
			Users user = (Users)session.getAttribute("user");
			//3.没有 前往登录页面
			if(user == null){
				return "logins";
			}
			//4.有 放行
			return invocation.invoke();
	}

}
