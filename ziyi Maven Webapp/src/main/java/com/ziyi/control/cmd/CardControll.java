package com.ziyi.control.cmd;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.AjaxResponse;
import com.cyb.util.AjaxResponseJson;
import com.cyb.util.Common;
import com.cyb.util.PageCount;
import com.et.mvc.util.Json;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.Order_list;



public class CardControll {
	private Integer ctid;
	private String number;
	private String name;
	private Integer phone;
	private String address;
	private String idcard;
	private double price;
	
	private Integer cardid;
	public  static final  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	
	private String begintime;
	private String endtime;
	
	
	//当前页数 和 每页显示条数
			private   int pageNo;
			private int pageCount;
	
	private String type;
	public String sellCard(){
		
//		System.out.println("查看当日售卡记录--------");
//		List<Card> list= Common.cd.showCardByTime();
//		  ActionContext.getContext().put("sellCard", list);
//		  System.out.println(list);
		
		int pageCount=2;
		if(pageNo ==0 )
			pageNo=1;
		 
		StringBuffer sb = new StringBuffer();
		sb.append("select * from t_card  where 1=1 ");
		//拼接日期
		if(begintime !=null && endtime != null)
			sb.append(" and selltime between '"+begintime.trim()+"' and '"+endtime.trim()+"'");
		
				System.out.println(sb.toString());
					List<Card> list1=Common.CARDDAO.select_card((sb.toString()));
						int totalCount=list1.size();
						
			     System.out.println("总条数："+totalCount);
			     int allPage=PageCount.getCount(totalCount, pageCount);
			System.out.println("总页数："+allPage);
		
			//拼接页码	
		sb.append(" limit "+  (pageNo-1)*pageCount +","+pageCount);
		   System.out.println(sb.toString());
		     List<Card> list= Common.CARDDAO.select_card((sb.toString()));
		     
		     
		     ActionContext.getContext().put("totalCount", totalCount);
		     ActionContext.getContext().put("allPage", allPage);
		     ActionContext.getContext().put("pageCount", pageCount);
		     ActionContext.getContext().put("PageNo",pageNo );
		     ActionContext.getContext().put("sellCard", list);
		
		
		return "sellCard";
	}
	public void openCard(){
		System.out.println("开始添加会员卡信息-----");
		//检查会员编号是否存在
		 int b=Common.CARDDAO.checkCardId(number);
		 if(b==0){
				System.out.println("开卡类型："+ctid+"卡号："+number+"会员名称："+name+"电话："+phone+"地址："+address+"身份证"+idcard+"开卡金额："+price);
				  System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
			    	String date_time=df.format(new Date());
			    	double spend=0;
			    	double remain=price;
				Card card=new Card();
				card.setCtid(ctid);
				card.setNumber(number);
				card.setName(name);
				card.setPhone(phone);
				card.setAddress(address);
				card.setIdcard(idcard);
				card.setPrice(price);
				card.setSelltime(date_time);
				card.setSpend(spend);
				card.setRemain(remain);
				card.setStatus(0);
				card.setUserid(1);
				
				int a=Common.CARDDAO.addCard(card);
				System.out.println(a);
			 
				try {
					AjaxResponse.responseAjax(a);
				} catch (IOException e) {
					e.printStackTrace();
				}
			 
		 }
		 else{
			 
			 try {
				AjaxResponse.responseAjax(0);
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
	}
	
	
	
	  public void  checkCardByNnmber(){
		  System.out.println("111111111");
		  
		 Card card=Common.CARDDAO.select_card_number(number);
		 if(card==null &card.equals("")){
			 
			 try {
				AjaxResponse.responseAjax(0);
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
		 }
		 System.out.println(card);
		 
		 int a=card.getCardid();
		 
		 System.out.println(a);
		 
		 List<Order> lists=Common.CARDDAO.check_oder_cardid(a);
		 if(lists==null &lists.size()==0) {
			 	
			 try {
				AjaxResponse.responseAjax(1);
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }
		  System.out.println(lists);
		  int b=lists.get(0).getCardid();
		  
		 
		  
		  
		 Map<String,Object> map=new  HashMap<String ,Object>(); 
		 	map.put("card", card);
		 	map.put("order", lists);
		  String jsons=Json.toJson(map);
		  
		  try {
			AjaxResponseJson.responseAjax(jsons);
		} catch (IOException e) {
			e.printStackTrace();
		}
		  
	  }
	  
	  public  void checkOrderList_cardid() {
		  //根据orderid查询 消费订单详情 
		  List<Order_list> orderList= Common.OLD.select_number_order(cardid);
		  System.out.println(orderList);
		  String json= Json.toJson(orderList);
		  try {
			AjaxResponseJson.responseAjax(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		  
		  
	  }
	  
	  
	
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getCtid() {
		return ctid;
	}
	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getCardid() {
		return cardid;
	}
	public void setCardid(Integer cardid) {
		this.cardid = cardid;
	}

	
	
	
}
