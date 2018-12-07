package com.ziyi.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 图表统计
 * @author 陈玉博
 * @date 2018年10月24日下午2:12:42
 */
public class ChartsControl extends ActionSupport{
	

	private  Integer  year;

	
	
	
	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	private static final long serialVersionUID = 1L;
	public String sumprice()
	{
		Map<Integer , Object> maps = Common.JD.sum_pay_money(2018);
		List<Map> list = new ArrayList<Map>();
		
		for(int i=1 ; i<13;i++)
		{
//			Map<String , Object> map = new HashMap<String , Object>();
			Map<String , Object> map_month = new HashMap<String , Object>();
//			map.put("money",maps);
			map_month.put("month", i);
			map_month.put("value", maps.get(i));
			if(i<10)
				map_month.put("day_value", Common.JD.sum_pay_money_day(2018, "0"+i));
			else
				map_month.put("day_value", Common.JD.sum_pay_money_day(2018, i+""));
			map_month.put("year", 2018);
			list.add(map_month);
		}
		Common.TOOLS.return_object(Gsons.tojson(list));
		return "json";
	}
	
	public String sumprices()
	{

		
		if(year==null) {
			year=2018;
		}
		Map<Integer , Object> maps = Common.JD.sum_pay_money(year);
		List<Map> list = new ArrayList<Map>();
		
		for(int i=1 ; i<13;i++)
		{
//			Map<String , Object> map = new HashMap<String , Object>();
			Map<String , Object> map_month = new HashMap<String , Object>();
//			map.put("money",maps);
			map_month.put("month", i);
			map_month.put("value", maps.get(i));
			if(i<10)
				map_month.put("day_value", Common.JD.sum_pay_money_day(year, "0"+i));
			else
				map_month.put("day_value", Common.JD.sum_pay_money_day(year, i+""));
			map_month.put("year", year);
			list.add(map_month);
		}
		ActionContext.getContext().put("list", list);

		return "aa";
	}
	
	/**
	 * 支付方式
	 * @return
	 */
	public String paytype()
	{
		
		System.out.println("支付方式："+year);
		List<Double> xianjin = Common.JD.sum_pay_money_type(0, year);
		List<Double> huiyuanka = Common.JD.sum_pay_money_type(1, year);
		List<Double> zhifubao= Common.JD.sum_pay_money_type(2, year);
		List<Double> weixin = Common.JD.sum_pay_money_type(3, year);
		ActionContext.getContext().put("xianjin", xianjin);
		ActionContext.getContext().put("huiyuanka", huiyuanka);
		ActionContext.getContext().put("zhifubao", zhifubao);
		ActionContext.getContext().put("weixin", weixin);
		return "paytype";
	}
	
	
	
	
	

}
