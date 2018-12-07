package com.ziyi.control;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.PageCount;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.control.cmd.Admin;
import com.ziyi.control.cmd.CardControl;
import com.ziyi.control.cmd.CardTypeControl;
import com.ziyi.control.cmd.SellingControl;
import com.ziyi.control.cmd.SellingTypeControl;
import com.ziyi.control.cmd.TeaHouseControl;
import com.ziyi.pojo.PerEvaluation;
/**
 * 处理用户登录请求
 * @author 陈玉博
 * @date 2018年9月12日上午11:12:57
 */
public class adminServlet extends ActionSupport{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String password;
	
	
	private String page;
	
	
	private String id;
	private String value;
	
	private Integer userid;
	
	// 当前页数 和 每页显示条数
		private int pageNo;
		private int pageCount;
		
		private String begintime;
		private String endtime;
		private String userrole;
	/**
	 * 处理用户登录
	 * @return
	 */
//	public String login()
//	{
//		
//	}
	/**
	 * 查询所有员工信息
	 * @return
	 */
	public String user()
	{
		return new Admin().admin_user();
	}

	/**
	 * 查询所有会员卡信息
	 * @return
	 */
	public String cardType()
	{
		return new CardTypeControl().get_card_type();
		
	}
	/**
	 * 查询所有会员信息
	 * @return
	 */
	public String card()
	{
		return new CardControl().get_card(page);
	}
	/**
	 * 查询所有会员信息-全部
	 * @return
	 */
	public String cards()
	{
		return new CardControl().get_cards();
	}
	/**
	 * 根据状态查询
	 */
	public String cardtype()
	{
		return new CardControl().get_card_type(id , value);
	}
	/**
	 * 商品类型
	 * @return
	 */
	public String sellingtype()
	{
		return new SellingTypeControl().get_selling_type();
	}
	
	
	/**
	 * 商品列表
	 * @return
	 */
	public String selling()
	{
		return new SellingControl().get_selling(page);
	}
	/**
	 * 商品列表
	 * @return
	 */
	public String sellings()
	{
		return new SellingControl().get_sellings();
	}
	/**
	 * 添加房屋位置信息
	 * @return
	 */
	public String teahouse()
	{
		return new TeaHouseControl().get_tea_house();
	}
	
	//业绩查询
      public String PerEvaluation() {
		//根据name 来查询业绩
    	  
    	 
		List<PerEvaluation> list=Common.PED.select_account_user();
		System.out.println(list);
		ActionContext.getContext().put("PerEvaluation", list);
		
		
		return "PerEvaluation";
		
	}
	
	//多条件查询 业绩
	 public String  term_PerEvaluation() {
		 //分页
		 int pageCount = 5;
			if (pageNo == 0)
				pageNo = 1;
		
		StringBuffer sb=new StringBuffer();
		//角色查询
		System.out.println(userrole);
		if(userrole!=null)
			sb.append("and u.userrole='"+userrole+"' ");
		
		System.out.println("角色后"+sb.toString());
		
		//name值查询
		if(name!=null )
			sb.append("and u.name like '"+name+"%'  ");
		System.out.println("name后"+sb.toString());
		// 拼接日期
		if (begintime != null && endtime != null)
			sb.append(" and  o.checkouttime BETWEEN '" + begintime+ "' and '" + endtime+ "' ");
		System.out.println("时间后"+sb.toString());
	
		 List<PerEvaluation> lists=Common.PED.select_account_user();
		 int totalCount=lists.size();
		 System.out.println("总条数：" + totalCount);
			int allPage = PageCount.getCount(totalCount, pageCount);
			System.out.println("总页数：" + allPage);
			// 拼接页码
			sb.append(" group by `u`.`userid` limit " + (pageNo - 1) * pageCount + "," + pageCount);
		
			System.out.println(sb.toString());
			List<PerEvaluation> list =Common.PED.select_kindAccount_user(sb.toString());
			System.out.println(list);
			
			
			ActionContext.getContext().put("totalCount", totalCount);
			ActionContext.getContext().put("allPage", allPage);
			ActionContext.getContext().put("pageCount", pageCount);
			ActionContext.getContext().put("PageNo", pageNo);
			ActionContext.getContext().put("term_PerEvaluation", list);
		 return "term_PerEvaluation";
	 }


	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	
}
