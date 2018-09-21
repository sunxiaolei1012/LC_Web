package com.cyb.util;


public class PageCount {

	/**
	 * 得到总页数
	 * @param totalCount 总记录数
	 * @param pageCount 显示页数
	 * @return
	 */
	public static int getCount(int totalCount,int pageCount){
		return totalCount%pageCount==0?totalCount/pageCount:totalCount/pageCount+1;
	
	}
}