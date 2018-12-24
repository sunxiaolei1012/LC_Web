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
import com.cyb.util.PageCount;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Order;
import com.ziyi.pojo.PerEvaluation;


public class OrderControll  extends ActionSupport{
	
	// 当前页数 和 每页显示条数
			private int pageNo;
			private int pageCount;
			
			private Integer orderId;
			private String userrole;
	
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
	 * 订单查询 
	 * @author sxl666
	 * 1.订单编号 number  2.订单时间 checkouttime 3.订单金额 pay_price
	 */
	public String  select_orderStatus() {
		List<Order> list=Common.ORDER.select_order_stats();
		/*Map<String , Object> map = new HashMap<String , Object>();
			if(list==null) {
				map.put("msg", "查询订单为空！");
			}else {
				map.put("msg", "成功查询订单！");
				map.put("order", list);
			}*/
		 //分页
		 int pageCount = 10;
			if (pageNo == 0)
				pageNo = 1;
		
		StringBuffer sb=new StringBuffer();
		
		//orderid值查询 
	//	System.out.println("orderId"+orderId);
		if(orderId!=null )
			sb.append("and (number like '%"+orderId+"%' or  checkouttime like '%"+orderId+"%'  or  pay_price like '%"+orderId+"%' )");
		
		//System.out.println("number后"+sb.toString());
		// 拼接日期
//		System.out.println("时间段："+begintime+endtime);
//		System.out.println(begintime != null);
//		System.out.println(endtime != null);
//		System.out.println(begintime != "null");
//		System.out.println(endtime != "null");
//		System.out.println(begintime != "");
//		System.out.println(endtime != "");
		//if(!begintime.equals("null") && !endtime.equals("null"))
			if(begintime !=null && endtime != null) {
				if(begintime !="" && endtime != "")
			sb.append(" and checkouttime BETWEEN '" + begintime.trim()+ "' and '" + endtime.trim()+ "' ");
			}
			
		
			
			List<Order> lists=Common.ORDER.select_kind_order(sb.toString());
			//System.out.println(lists);
			 int totalCount = 0;
			if(lists!=null) 
				 totalCount=lists.size();
			 
			
				// System.out.println("总条数：" + totalCount);
					int allPage = PageCount.getCount(totalCount, pageCount);
				//	System.out.println("总页数：" + allPage);
					// 拼接页码
					sb.append(" ORDER BY number  DESC limit " + (pageNo - 1) * pageCount + "," + pageCount);
					List<Order> listss=Common.ORDER.select_kind_order(sb.toString());
			
			ActionContext.getContext().put("totalCount", totalCount);
			ActionContext.getContext().put("allPage", allPage);
			ActionContext.getContext().put("pageCount", pageCount);
			ActionContext.getContext().put("PageNo", pageNo);
			ActionContext.getContext().put("begintime", begintime);
			ActionContext.getContext().put("endtime", endtime);
		
			ActionContext.getContext().put("orderId", orderId);
		ActionContext.getContext().put("order", listss);		
		
		return "select_orderStatus";
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
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getUserrole() {
		return userrole;
	}
	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
	
}
