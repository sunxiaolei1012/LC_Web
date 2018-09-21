package com.ziyi.control.cmd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.cyb.util.AjaxResponse;
import com.cyb.util.Common;
import com.et.mvc.util.Json;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Selling_type;


public class ProductControll extends ActionSupport{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	private int sellingid;
	private int ids;
	private int type_id;
	
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	private int number;
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getIds() {
		return ids;
	}
	public void setIds(int ids) {
		this.ids = ids;
	}


	public void updateName() throws IOException{
		
		int checkId=Common.SLD.check_pname(name);
		//检测要修改的商品名称是否存在  1存在 0不存在
		if(checkId==1){
			AjaxResponse.responseAjax(0);
			
		}else{
		System.out.println("商品id:"+ids+"-----"+"修改后的名称："+name);
		int a=Common.USERS.updateProductName(ids, name);
		System.out.println(a);
		 HttpServletResponse response=ServletActionContext.getResponse();
		 response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
		   PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print(a);
			out.flush();
			out.close();	
	}}
	
	public void delProduct() throws IOException{
		
		System.out.println("要删除商品的Id:"+sellingid);
		int a =Common.USERS.delProductById(sellingid);
		System.out.println(a);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.print(a);
		out.flush();
		out.close();
	}
	
	//修改商品的数量  Byname
	public void changeNum() throws IOException{
		System.out.println("开始改变商品数量了————————");
		System.out.println("修改的数量："+number);
		 int a =Common.USERS.updateNumByName(number, name);
		 System.out.println(a);
		 HttpServletResponse response=ServletActionContext.getResponse();
		 response.setContentType("text/html;charset=utf-8");
		 response.setCharacterEncoding("UTF-8");
		 PrintWriter pw=response.getWriter();
		 pw.print(a);
		 pw.flush();
		 pw.close();
	}
	public String showSort(){
		
		List<Selling_type> list=Common.SLD.show_productSort();
		System.out.println("showProductSort:"+list);
		 ActionContext.getContext().put("sort",list);
		return "showSort";
	}
	
	
	public  void addSort() throws IOException{
		System.out.println("添加类型的名称"+name);
		
		int a =Common.SLD.add_productSort(name);
		System.out.println(a);
		HttpServletResponse response=ServletActionContext.getResponse();
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw=response.getWriter();
		pw.print(a);
		pw.flush();
		pw.close();
	}
	
	public void delSort() throws IOException{
		System.out.println("开始删除id:"+type_id+"的分类");
		int a=Common.SLD.del_productSort(type_id);
		System.out.println(a);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw=response.getWriter();
		pw.print(a);
		pw.flush();
		pw.close();
	}
	public String  sortProduct() throws IOException{
		System.out.println("查询id为"+ids+"类型的商品");
	
			List<Selling_list> list=Common.SLD.show_sortProduct(sellingid);
			System.out.println(list);
			
			ActionContext.getContext().put("sortProduct", list);
			/*HttpServletResponse  response=ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw=response.getWriter();
			 String json=Json.toJson(list);
			pw.print(json);
			pw.flush();
			pw.close();*/
			return "sortProduct";
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



















	public int getSellingid() {
		return sellingid;
	}



















	public void setSellingid(int sellingid) {
		this.sellingid = sellingid;
	}


	
	
	
	
	
	
	
	
	
	

}
