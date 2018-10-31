package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.PayTypePriceDao;
import com.ziyi.pojo.PayTypePriceDay;
import com.ziyi.pojo.PayTypePriceMonth;

public class PayTypePriceDaoImpl implements PayTypePriceDao {

	@Override
	public List<PayTypePriceMonth> select_payType_monthtime() {
		
		String sql="select type , SUM(pay_price) as price,month(checkouttime)as month  "
				+ " from t_order  GROUP BY year(checkouttime),"
				+ "month(checkouttime),type  order by type";
		List<PayTypePriceMonth> list=Common.UTIL.query(sql, null, PayTypePriceMonth.class);
		if(list!=null && list.size()>0)
			return list;
		
		return null;
	}

	@Override
	public List<PayTypePriceDay> select_payType_daystime() {
		String sql="select type , SUM(pay_price) as price,day(checkouttime) day,month(checkouttime) month "
				+ " from t_order  GROUP BY month(checkouttime),"
				+ "day(checkouttime), type order by type";
		List<PayTypePriceDay> list=Common.UTIL.query(sql, null, PayTypePriceDay.class);
		if(list!=null && list.size()>0) {
			return list;
			}
		return null;
	}

}
