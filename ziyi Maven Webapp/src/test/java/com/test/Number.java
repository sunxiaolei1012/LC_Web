package com.test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Number {

	
	public static void main(String[] args) {
		StringBuilder sb = new StringBuilder();
		sb.append("T");
		sb.append(getRandom(6));
		SimpleDateFormat df_day = new SimpleDateFormat("yyyyMMdd");
		String new_date = df_day.format(new Date());
		sb.append(new_date);	
		
		String str = "T1079311020181015000012";
		 
		sb.append(num_add_one(str.split(new_date)[1]));
		System.out.println(sb.toString());
		//读数据库 判断 编号是否存在
	}
	//随机数 
	private static String getRandom(int count) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < count; i++) {
			sb.append(Math.round(Math.random() * 10));
		}
		   return sb.toString();
	}
	//+1
	private static String num_add_one(String str)
	{
		int a = new Integer(str);
		a++;
		if(a/100000>0)
			return a+"";
		else if (a/10000>0)
			return "0"+a;
		else if (a/1000>0)
			return "00"+a;
		else if (a/100>0)
			return "000"+a;
		else if (a/10>0)
			return "0000"+a;
		else
			return "00000"+a;
		
	}
}
