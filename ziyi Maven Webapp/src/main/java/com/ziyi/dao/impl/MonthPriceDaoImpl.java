package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.MonthPriceDao;
import com.ziyi.pojo.DayPrice;
import com.ziyi.pojo.KuCun;
import com.ziyi.pojo.MonthPrice;

public class MonthPriceDaoImpl  implements MonthPriceDao{

	@Override
	public List<MonthPrice> check_monthPrice() {
		String sql="select month(ordertime) month,"
				+ "sum(price) monthPrice from t_order"
				+ " group by year(ordertime),month(ordertime)";
		List<MonthPrice> mp=Common.UTIL.query(sql, null, MonthPrice.class);
		
		return mp;
	}

	@Override
	public List<DayPrice> check_DayPrice() {
		String sql="select day(ordertime) day,sum(price) dayPrice,"
				+ "month(ordertime) month from t_order"
				+ " group by month(ordertime),day(ordertime)";
		List<DayPrice> mp=Common.UTIL.query(sql, null, DayPrice.class);
		
		return mp;	}
	
	@Override
	public List<KuCun> check_NumberByTypeId() {
		String sql="SELECT typeid, sum(number) as number FROM t_selling_list group by typeid";
		List<KuCun> list=Common.UTIL.query(sql, null, KuCun.class);
	
		return list;
	}

}
