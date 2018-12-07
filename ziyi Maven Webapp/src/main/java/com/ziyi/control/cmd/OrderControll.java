package com.ziyi.control.cmd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cyb.util.Common;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Order;


public class OrderControll  extends ActionSupport{
	
	
	//员工结账userid
	private Integer accountuserid;
	
	
	// 开始时间和结束时间
	private String begintime;
	private String endtime;
	   

//	public static void main(String[] args) {
//		Map<String , String> map = type_price("2018-03-06","2018-09-29");
//		
//	}
	@SuppressWarnings("unused")
	public String sumPrice(){
       
		if(begintime!=null&&endtime!=null){
			System.out.println(begintime+1);
			System.out.println(1+endtime);
			Map<String , String> map = type_price(begintime.trim(),endtime.trim());
			ActionContext.getContext().put("maps", map);
			System.out.println(map);
			
		}else{
			Calendar c = Calendar.getInstance();
			c.setTime(new Date());
	        c.add(Calendar.MONTH, -1);
	        Date m = c.getTime();
	        String mon = Common.df.format(m);
			begintime=mon;
			endtime=Common.df.format(new Date());
			System.out.println(begintime+endtime);
			
		Map<String , String> map = type_price(begintime,endtime);
		ActionContext.getContext().put("maps", map);
		System.out.println(map);
		}
		
		//		//每页显示条数
//		 int  pageCount=3;
//		 //页码
//		 if(pageNo==0){
//			 pageNo=1;
//		 }
//		 StringBuffer sb=new StringBuffer();
//		 	sb.append("select sum(pay_price) from t_order where 1=1 ");
//		 	
//		 	//拼接日期
//			if(begintime !=null && endtime != null)
//				sb.append(" and checkouttime between '"+begintime.trim()+"' and '"+endtime.trim()+"'");
//			Map<String , String> map = new HashMap<String , String>();
////			map.put("1", sum1);
//			
//			//统计此日期订单 总条数  
//			 List<Order> listAll=Common.od.select_IcOrder(sb.toString());
//			 int totalCount=listAll.size();
//			 //总页数
//			  int allPage=PageCount.getCount(totalCount, pageCount);
//			  
//			  	//添加付款类型
//			  sb.append("and type=0");
//			  System.out.println(sb.toString());	
//			  
//			  //添加分页条件
//			  	sb.append(" limit "+  (pageNo-1)*pageCount +","+pageCount);
//			  		System.out.println(sb.toString());
//			  		
//			  		List<Order> listIc=Common.od.select_IcOrder(sb.toString());
		return "sumPrice";
	}
	/**
	 * @author sxl666
	 * 查询个人的业绩
	 */
	
	public  String  person_score() {

		System.out.println("员工号"+accountuserid);
		List<Order> list=Common.ORDER.select_person_score(accountuserid);
			System.out.println(list);
			
			ActionContext.getContext().put("person_score",list);
			
		return "person_score";
	}
	
	
	
	/**
	 * 用来计算分类付款金额
	 * @return
	 */
	public static Map<String , String> type_price(String begintime , String endtime)
	{
		Map<String , String> map = new HashMap<String, String>();
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		try
		{
			con=Common.UTIL.getConn();
			ps=con.prepareStatement("select type , SUM(pay_price) as price   from t_order where checkouttime  BETWEEN '"+begintime+"' and '"+endtime+"'   GROUP BY type order by type");
			res=ps.executeQuery();
			while(res.next())
			{
				map.put(res.getInt(1)+"", res.getObject(2)+"");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Common.UTIL.closeRes(con,ps,res);
		}
		return map;
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
	public Integer getAccountuserid() {
		return accountuserid;
	}
	public void setAccountuserid(Integer accountuserid) {
		this.accountuserid = accountuserid;
	}
	
	
}
