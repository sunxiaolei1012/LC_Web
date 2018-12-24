package com.ziyi.control;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Log;
import com.ziyi.pojo.Old_Card;

public class OldCardControl extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String page;

	public String card() {
		// 分页 多条件查询
		int pages = 1;
		if (page != null && !page.equals("")) {
			pages = new Integer(page);
		}
		String sb  = pinjie("count(id)","t_old_card",false ,pages);
		int zong = Util.sqlCount(sb);
		
		String str = pinjie("*","t_old_card",true,pages);
		System.out.println(str);
		List<Old_Card> list = Common.OLDDAO.show(str);
		ActionContext.getContext().put("sum", zong);
		ActionContext.getContext().put("page", pages);
		ActionContext.getContext().put("list", list);
		for (Old_Card old_Card : list) {
			System.out.println(old_Card);
		}
		return "card";
	}
	
	public String pinjie(String types ,String table, boolean bool , int page)
	{
		
		StringBuffer sb = new StringBuffer();
		sb.append("select "+types+" from "+table+" where 1=1 ");
		if(bool)
			sb.append("  limit "+(page-1)*Common.PAGE_CARD_SHOW_NUMBER+","+Common.PAGE_CARD_SHOW_NUMBER+"");
//		System.out.println(sb.toString());
		return sb.toString();
	}
	

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
