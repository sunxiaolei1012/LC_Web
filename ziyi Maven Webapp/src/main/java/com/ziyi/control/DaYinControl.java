package com.ziyi.control;

import java.math.BigInteger;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.cyb.util.Common;
import com.cyb.util.DaYin;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.et.mvc.RequestContext;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Sub_House;
import com.ziyi.pojo.Users;
import com.ziyi.pojo.V_ORDER_SELLING;

import javassist.expr.NewArray;

/**
 * 打印机
 * @author 陈玉博
 * @date 2018年11月19日下午3:27:23
 */
public class DaYinControl {

	private String number;
	private String table;
	private String value;
	private String price;
	
	private String name;
	private String address;
	private String tel;
	private String manager;
	
	/**
	 * 
	 */
	public String properties()
	{
		Sub_House sh = Common.SUBDAO.select_SubHouse();
		new Tools().return_object(new Gson().toJson(sh));
		return "json";
	}
	
	/**
	 * 設置打印屬性
	 * @return
	 */
	public String set()
	{
		Sub_House sh = new Sub_House();
		sh.setName(name);
		sh.setAddress(address);
		sh.setManager(manager);
		sh.setTel(tel);
		boolean bool = Common.SUBDAO.update_subhouse(sh);
		Map<String , Object> map = new HashMap<String , Object>();
		if(bool)
		{
			config.TEA_NAME = name;
			config.TEA_ADDRESS=address;
			config.TEA_PHONE=tel;
			map.put("status", true);
			map.put("msg", config.XIU_USER_RIGHT_MSG);
		}
		else
		{
			map.put("status", false);
			map.put("msg", config.XIU_USER_ERROR_MSG);
		}
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}
	/**
	 * 打印
	 * @return
	 */
	public String get()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		if(number == null || number.equals("") || table == null || table.equals("") || value == null || value.equals("") )
		{
			map.put("status", false);
			map.put("msg", config.DAYIN_CONFIG_IS_NULL);
		}
		else
		{
			map.put("status", true);
			map.put("msg", config.DAYIN_TRUE);
			String[] str = value.split(",");
			
			//下单时间和 带结账时间
			Order order=Common.ORDER.select_number_order(number);
				String begainTime=order.getOrdertime();
				String endTime=order.getCheckouttime();
				
			//收营员
			 HttpServletRequest request = ServletActionContext.getRequest(); 
			   HttpSession session = request.getSession(); 
//			Users user=   (Users) session.getAttribute("user");
			DaYin.printSheet(begainTime,endTime,Common.USERS.select_id_name(order.getUserid()),config.TEA_NAME,number, table, config.TEA_PHONE, config.TEA_ADDRESS, str , price,false , 0+"",null);
		}
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}
	
	/**
	 * 根据订单号 查询订单信息
	 * @return
	 */
	@SuppressWarnings("unused")
	public String number()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		if(number == null || number.equals(""))
		{
			map.put("status", false);
			map.put("msg", config.DAYIN_CONFIG_IS_NULL);
		}
		else
		{
			List<V_ORDER_SELLING> list = Common.VIEW.select(number);
			
			System.out.println(list.toString());
			
			//续杯商品添加
			Order order = Common.ORDER.select_number_order(number);
			double xubeiprice=0;
			if(order.getXubei()!=0 )
			{
				Selling_list selling = Common.ORDER.select_xubei_order(order.getNumber());
				System.out.println(selling);
				double price=selling.getPrice();
				Selling_list sll = Common.SLD.selecct_id_list(order.getXubei());
				double prices=sll.getPrice();
				String name="(续)"+sll.getName();
				
				if(prices>price) {
					 xubeiprice=prices-price;
						sll.setPrice(xubeiprice);
					}else {
						sll.setPrice(0.00);
					}
				List<V_ORDER_SELLING> list1=new ArrayList<>(); 
				V_ORDER_SELLING vs=new V_ORDER_SELLING(order.getNumber(),order.getCheckouttime(),prices,prices,order.getType(),1,name,"",xubeiprice);
				
				System.out.println(vs.toString());
				list.add(vs);
				System.out.println(list.toString());
			/*	list1.get(0).setCheckouttime(order.getCheckouttime());
				list1.get(0).setPri(prices);
				list1.get(0).setPay_price(prices);
				list1.get(0).setType(order.getType());
				list1.get(0).setOlnumber(1);
				list1.get(0).setName(name);
				list1.get(0).setPri(prices);
				list1.get(0).setHousename("");
				list.add((V_ORDER_SELLING) list1);*/
		
				
				
				
			}
			
			
			
			if(list == null)
			{
				map.put("status", false);
				map.put("msg", config.DAYIN_SELLING_IS_NULL);
			}
			else
			{
				String[] str = new String[list.size()*3];
				
				for (int i = 0; i < list.size(); i++) {
					str[i*3] = list.get(i).getName();
					str[i*3+1] = list.get(i).getOlnumber()+"";
					str[i*3+2] = list.get(i).getPri()+"";
				}
				map.put("status", true);
				map.put("msg", config.DAYIN_TRUE);
				
				//收营员
				 HttpServletRequest request = ServletActionContext.getRequest(); 
				   HttpSession session = request.getSession(); 
//				Users user=   (Users) session.getAttribute("user");
				
				//下单时间和 带结账时间
				//Order order=Common.ORDER.select_number_order(number);
					String begainTime=order.getOrdertime();
					String endTime=order.getCheckouttime();
				DaYin.printSheet(begainTime,endTime,Common.USERS.select_id_name(order.getUserid()),config.TEA_NAME,number, list.get(0).getHousename(), config.TEA_PHONE, config.TEA_ADDRESS, str,list.get(0).getPrice()+"" , true , list.get(0).getPay_price()+"",Common.USERS.select_id_name(order.getAccountuserid()));
			}
		}
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}
	
	
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
	
	
}
