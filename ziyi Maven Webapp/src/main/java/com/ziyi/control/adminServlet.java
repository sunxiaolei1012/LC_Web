package com.ziyi.control;

import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.control.cmd.Admin;
import com.ziyi.control.cmd.CardControl;
import com.ziyi.control.cmd.CardTypeControl;
import com.ziyi.control.cmd.SellingControl;
import com.ziyi.control.cmd.SellingTypeControl;
import com.ziyi.control.cmd.TeaHouseControl;
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
	 * 查询所有会员信息
	 * @return
	 */
	public String cards()
	{
		return new CardControl().get_cards();
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
	 * 添加房屋位置信息
	 * @return
	 */
	public String teahouse()
	{
		return new TeaHouseControl().get_tea_house();
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
	
	
}
