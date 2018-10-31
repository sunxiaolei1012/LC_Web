package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.PayTypePriceDay;
import com.ziyi.pojo.PayTypePriceMonth;

public interface PayTypePriceDao {
	
	/**
	 *分类统计支付方式 每月的营业额
	 * 
	 */
	
 public List<PayTypePriceMonth> select_payType_monthtime(); 
 
 /**
	 *分类统计支付方式 每月每日的营业额
	 * 
	 */
	
public List<PayTypePriceDay> select_payType_daystime(); 
 
 
 

}
