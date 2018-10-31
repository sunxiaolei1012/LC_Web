package com.ziyi.control.cmd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.MonthPriceJDBC;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.DayPrice;
import com.ziyi.pojo.KuCun;
import com.ziyi.pojo.MonthPrice;
import com.ziyi.pojo.PayTypePriceDay;
import com.ziyi.pojo.PayTypePriceMonth;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Selling_type;


public class MonthPriceControl  extends ActionSupport{
	
	private Integer typeid;
	
	
	  public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public String monthPrices() throws SQLException{
		  	
		  System.out.println("开始统计每月的营业额-----------");
		//  List<MonthPrice> list =Common.MPD.check_monthPrice();
//			Map<Integer ,Double> map=MonthPriceJDBC.monthPrice();
//			System.out.println(map);
//		  //System.out.println(list.toString());
//		 ActionContext.getContext().put("monthPrice",Common.gson.tojson(map)); 		  
		  List<MonthPrice> list = MonthPriceJDBC.monthPrice();
		  //开始统计当月每天的 营业
		  List<DayPrice>lists=Common.MPD.check_DayPrice();
		  
		  
		  System.out.println(list);
		  System.out.println(lists);
		  ActionContext.getContext().put("monthPrice",list);
		  
		  ActionContext.getContext().put("dayPrice",lists);
		  return "monthPrices";
	  }
	  
	  //营业额 表格 
	  public String YingYePrice() throws SQLException{
		  List<MonthPrice> list = MonthPriceJDBC.monthPrice();
		  	
		  ActionContext.getContext().put("YingYePrice",list);
		  return "YingYePrice";
		  
	  }
	  //highchart统计 商品库存  一级展示 库存商品分类  二级具体 每类的 数量
	  public String sumSellingType(){
		  System.out.println("商品分类展示--highChart----");
		  List<Selling_type> list=Common.STYPE.select_selling_type();
		  System.out.println(list);
		  ActionContext.getContext().put("selling_type", list);
		  //各个商品的图标展示
		  List<Selling_list> lists=Common.SLD.show_selling_list();
		  System.out.println(lists);
		  ActionContext.getContext().put("selling_list", lists);
		  
		  
		  
		  return "sumSellingType";
	  }
	  
	  public String sumlistNumber(){
		  
		  //分类统计 每个 类型产品的库存量
		  List<KuCun> listNumber=Common.MPD.check_NumberByTypeId();
		  System.out.println(listNumber);
		  ActionContext.getContext().put("listNumber", listNumber);
		  return "sumlistNumber";
	  }
	  
	  public String checkByType(){
		  	System.out.println(typeid);
		  List<Selling_list>list=Common.SLD.select_selling_type(typeid);
		  ActionContext.getContext().put("list", list);
		  System.out.println(list);
		  return "checkByType";
	  }
	  
	  
	  
	  

	  //分类统计 每月 每天付款方式金额
	  public  String PayTypePrice(){
		  System.out.println("PayTypePrice----------------");
		  List<PayTypePriceMonth>list=Common.PPD.select_payType_monthtime();//每月
		  System.out.println(list);
		  ActionContext.getContext().put("PayTypePriceMonth", list);
			List<PayTypePriceDay> list1=Common.PPD.select_payType_daystime();//每日	  
			  System.out.println(list1);
			  ActionContext.getContext().put("PayTypePriceDay", list1);
		  return "PayTypePrice";
	  }
	  
	  
	  public  Map< Integer, Double> monthPrice() throws SQLException{
		    Map<Integer,Double> map= new HashMap<Integer,Double>();
		    Connection con=null;
		    ResultSet res=null;
		    PreparedStatement ps=null;
		    
		    
		    con=Common.UTIL.getConn();
		    String sql="select month(ordertime) month,"
					+ "sum(price) monthPrice from t_order"
					+ " group by year(ordertime),month(ordertime)";
		    ps=con.prepareStatement(sql);
		    res=ps.executeQuery();
		    while (res.next()){
		    	map.put(res.getInt(1), res.getDouble(2));
		    }
		    Common.UTIL.closeRes(con,ps, res);
		  		return map;
		  
	  }
	  
}
