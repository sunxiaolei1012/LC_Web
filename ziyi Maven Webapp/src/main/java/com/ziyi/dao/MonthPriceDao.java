package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.DayPrice;
import com.ziyi.pojo.KuCun;
import com.ziyi.pojo.MonthPrice;

public interface MonthPriceDao {
	
	 	//查询每月的销售额 
	  public  List<MonthPrice>  check_monthPrice();
	  
	  //查询每天的销售额
	  
	  public  List<DayPrice>  check_DayPrice();
	  
	//查询每类商品的库存量
	  public  List<KuCun>  check_NumberByTypeId();

}
