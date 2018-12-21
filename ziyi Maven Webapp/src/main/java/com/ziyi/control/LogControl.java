package com.ziyi.control;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Log;

/**
 * 日志查询信息
 * @author 陈玉博
 * @date 2018年12月18日下午1:45:37
 */
public class LogControl  extends ActionSupport{

	private String page;
	
	private String begintime;
	private String endtime;
	private String type;
	
	private String value;
	
	/**
	 * 
	 * @return
	 */
	public String get()
	{
		//分页 多条件查询
		int pages = 1;
		if(page != null && !page.equals(""))
		{
			pages = new Integer(page);
		}
		String sb  = pinjie("count(id)",false ,pages);
//		System.out.println(sb);
		//用来求总共有多少条数据
		int zong = Util.sqlCount(sb);
		//处理当前页与页码
//		int sum = 0;
//		if(zong%Common.PAGE_CARD_SHOW_NUMBER == 0)
//			sum = zong/Common.PAGE_CARD_SHOW_NUMBER;
//		else
//			sum = zong/Common.PAGE_CARD_SHOW_NUMBER+1;
		
		String str = pinjie("*",true,pages);
		List<Log> list = Common.LOG.select_log_string(str);
		
		ActionContext.getContext().put("sum", zong);
		ActionContext.getContext().put("page", pages);
		ActionContext.getContext().put("list", list);
		ActionContext.getContext().put("begintime", begintime);
		ActionContext.getContext().put("endtime", endtime);
		ActionContext.getContext().put("type", type);
		ActionContext.getContext().put("value", value);
		return "get";
	}
	
	public String pinjie(String types , boolean bool , int page)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("select "+types+" from t_log where 1=1 ");
		if(type != null && !type.equals(""))
			if(!type.equals("0"))
				sb.append(" and type="+type);
		if(begintime != null && !begintime.equals(""))
			sb.append(" and time>'"+begintime+"'");
		if(endtime != null && !endtime.equals(""))
		{
			if(begintime.equals(endtime))
			{
				
			}
		}
		if(value != null && !value.equals(""))
			sb.append("  and (value LIKE '%"+value+"%' or time LIKE '%"+value+"%' or type LIKE '%"+value+"%')");
		if(bool)
			sb.append("  limit "+(page-1)*Common.PAGE_CARD_SHOW_NUMBER+","+Common.PAGE_CARD_SHOW_NUMBER+"");
		System.out.println(sb.toString());
		return sb.toString();
	}
	

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
