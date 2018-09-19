package com.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.cyb.util.Common;
import com.cyb.util.JDBC;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Tea_House;
import com.ziyi.pojo.Users;

public class Test_Action {

	@Test
	public void test1()
	{
		//登录
		Users user = Common.USERS.select_id_user("admin", "admin");
		System.out.println(user);
	}
	@Test
	public void test2()
	{
		//查看桌子状态
		List<Tea_House> list_house = Common.HOUSE.select_House();
		for (Tea_House tea_House : list_house) {
			System.out.println(tea_House);
		}
	}
	@Test
	public void test3()
	{
		System.out.println(Common.df_day.format(new Date()));
		System.out.println(new JDBC().sum_order("2018-07-30"));
	}
	
	
	@Test 
	public void test4()
	{
		//测试添加批量会员卡
		for (int i = 0; i < 100; i++) {
			Card ca = new Card();
			ca.setAddress("测试地址"+i);
			ca.setCtid(1);
			ca.setIdcard("测试身份证"+i);
			ca.setName("测试名称"+i);
			ca.setNumber("测试卡号"+i);
			ca.setPhone(321123);
			ca.setPrice(1000.00);
			ca.setRemain(1000.00);
			ca.setSpend(0.00);
			ca.setSelltime(Common.df.format(new Date()));
			ca.setStatus(1);
			ca.setUserid(1);
			Common.CARDDAO.insert_card(ca);
		}
	}
	
	@Test
	public void test5()
	{
		
		//		System.out.println(new JDBC().count_zong("cardid", "t_card"));
	}
}
