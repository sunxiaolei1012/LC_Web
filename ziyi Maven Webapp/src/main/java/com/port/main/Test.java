package com.port.main;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.ziyi.pojo.PerEvaluation;

public class Test {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		
		config.WHITE_CARD[config.WHITE_CARD.length-1] = new Tools().getBCC(config.WHITE_CARD).getBytes()[0];
		System.out.println(config.WHITE_CARD[config.WHITE_CARD.length-1]);
		
		
		
	}
	
	@org.junit.Test
	public  void testOne() {
		
		StringBuffer str=new StringBuffer();
			String begintime="2018-11-20";
			String endtime="2018-12-06";
			// str.append(" and  o.checkouttime BETWEEN '" + begintime+ "' and '" + endtime+ "'");
		String ss="  and u.name like '1%' group by `u`.`userid`  ";
				List<PerEvaluation> list=Common.PED.select_kindAccount_user(ss);
		System.out.println(list);
	}
	
	@org.junit.Test
	public  void test2() {
		
		
		List<PerEvaluation> list=Common.PED.select_account_user();
		System.out.println(list);
	}
	
}
