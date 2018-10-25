package com.cyb.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ziyi.pojo.MonthPrice;

public class MonthPriceJDBC {
		
	 
	  public static  List<MonthPrice> monthPrice() throws SQLException{
		  List<MonthPrice> list = new ArrayList<MonthPrice>();
//		    Map<Integer,Double> map= new HashMap<Integer,Double>();
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
		    	MonthPrice mp = new MonthPrice();
		    	mp.setMonth(res.getInt(1));
		    	mp.setMonthPrice(res.getDouble(2));
		    	list.add(mp);
		    }
		    Common.UTIL.closeRes(con,ps, res);
		  		return list;
		  
	  }
	  
}
