package com.ziyi.control.cmd;



import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.PageCount;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Selling_list;


public class UserInfoControl extends ActionSupport{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	
	
	//当前页数 和 每页显示条数
		private   int pageNo;
		private int pageCount;
	
	public String login(){
	System.out.println("检查"+name+"登陆"+password+"-----");
	
	int a=Common.USERS.checkUserLogin(name, password);
	
	System.out.println(a);
			if(a==0){
				ActionContext.getContext().put("logionError", "用户名密码不匹配，请检查后在登陆----");
			}else{
				ActionContext.getContext().put("logionSuccess", "登陆成功！！！！");
			}
		
			return "login";
	}
	
	//展示茶室所有的商品
	public String  showProduct(){
		

		int pageCount=10;
		
		if(pageNo==0){
			pageNo=1;
		}
			List<Selling_list> list=Common.USERS.showProductList(pageNo-1,pageCount);
			
				int totalCount=Common.USERS.allCount();
				
			int allPage=PageCount.getCount(totalCount, pageCount);
			System.out.println("总条数："+totalCount+"."+"总页数"+allPage);
			
			ActionContext.getContext().put("allPage", allPage);
	    	ActionContext.getContext().put("pageCount", pageCount);
	    	ActionContext.getContext().put("PageNo", getPageNo());
			System.out.println("商品列表"+list);
			ActionContext.getContext().put("productList", list);
			
		return "productList";
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

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
	
	

}
