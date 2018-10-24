package com.ziyi.control;

import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 图表统计
 * @author 陈玉博
 * @date 2018年10月24日下午2:12:42
 */
public class ChartsControl extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String sumprice()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		Map<Integer , Object> maps = Common.JD.sum_pay_money(2018);
		map.put("money",maps);
		Map<Integer , Object> mapss=Common.TOOLS.monty_day(2018, false, 2);
		map.put("two",mapss);
		Common.TOOLS.return_object(Gsons.tojson(map));
		return "json";
	}

}
