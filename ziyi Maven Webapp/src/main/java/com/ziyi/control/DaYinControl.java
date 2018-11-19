package com.ziyi.control;

import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.DaYin;
import com.cyb.util.Tools;
import com.cyb.util.config;
import com.google.gson.Gson;

/**
 * 打印机
 * @author 陈玉博
 * @date 2018年11月19日下午3:27:23
 */
public class DaYinControl {

	private String number;
	private String table;
	private String value;
	
	/**
	 * 設置打印屬性
	 * @return
	 */
	public String set()
	{
		return "json";
	}
	/**
	 * 打印
	 * @return
	 */
	public String get()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		if(number == null || number.equals("") || table == null || table.equals("") || value == null || value.equals("") )
		{
			map.put("status", false);
			map.put("msg", config.DAYIN_CONFIG_IS_NULL);
		}
		else
		{
			String[] str = value.split(",");
			DaYin.printSheet(config.TEA_NAME,number, table, config.TEA_PHONE, config.TEA_ADDRESS, str);
		}
		new Tools().return_object(new Gson().toJson(map));
		return "json";
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getTable() {
		return table;
	}
	public void setTable(String table) {
		this.table = table;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
