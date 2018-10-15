package com.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.atgeretg.serialport.utils.MyUtils;
import com.cyb.util.Common;
import com.cyb.util.JDBC;
import com.cyb.util.config;
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
		List<Byte> list = new ArrayList<Byte>();
		list.add((byte) -1);
	}
	
	@Test
	public void test6()
	{
		String str = config.KEY;
		int a = Common.TOOLS.code(204818, config.KEY);
		System.out.println(a);
		int b = Common.TOOLS.code(a, str);
		System.out.println(b);
		
	}
	@Test
	public void test7() throws InterruptedException
	{
//		byte[] by = new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x95,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x20,(byte) 0x11,(byte) 0x22,(byte) 0x33,(byte) 0x44,(byte) 0x55,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xE8};
//		System.out.println(config.WHITE_CARD.length);
		Common.TOOLS.white_card();
		System.out.println(Common.TOOLS.read_card_three());
	}
	
	@Test
	public void test8()
	{
		byte[] bytes = new byte[config.WHITE_CARD.length+1];
		for (int i = 0; i < config.WHITE_CARD.length; i++) {
			bytes[i]=config.WHITE_CARD[i];
		}
		
		System.out.println(bytes.length+"-"+config.WHITE_CARD.length);
	}
	
	
	@Test
	public void test9()
	{
		String str = "254789";
		byte[] by = str.getBytes();
		for (byte b : by) {
			System.out.println(b);
		}
//		System.out.println(MyUtils.intToHexString(542482 , false));
	}
	
	@Test
	public void test10()
	{
		byte[] by = new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x95,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x20,(byte) 0x11,(byte) 0x22,(byte) 0x33,(byte) 0x44,(byte) 0x55,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xE8};
	
		System.out.println(MyUtils.byteArrayToHexString(by));
	}
	@Test
	public void test11()
	{
		byte[] by = new byte[]{50,49,56,57,56,55};
		
		System.out.println(new String(by));
	}
	
	@Test
	public void test12()
	{
		
		System.out.println((char)50);
	}
}
