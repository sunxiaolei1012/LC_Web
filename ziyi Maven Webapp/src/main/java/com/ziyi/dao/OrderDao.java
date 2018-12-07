package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Order;
import com.ziyi.pojo.Selling_list;


/**
 * 订单表接口
 * @author 陈玉博
 * @date 2018年7月11日下午5:02:25
 */
public interface OrderDao {

	/**
	 * 根据订单编号 查询订单信息
	 * @param number
	 * @return
	 */
	public Order select_number_order(String number);
	
	/**
	 * 添加订单信息
	 * @param order
	 * @return
	 */
	public boolean insert_number_order(Order order);
	
	/**
	 * 根据订单编号 修改订单信息
	 * @param order
	 * @return
	 */
	public boolean update_number_order(String number , Double price);
	
	/**
	 * 多表连接删除订单
	 * @param orderid
	 * @return
	 */
	public boolean delete_order_list(Integer orderid);
	/**
	 * 查询全部订单信息
	 * @return
	 */
	public List<Order> list_order_json();
	/**
	 * 根据number查询订单信息
	 * @param number
	 * @return
	 */
	public Order select_number_json(String number);
	
	
	/**
	 * 多表连接 更改订单
	 * @return
	 */
	public boolean update_order_card(Double dou , int type , String time , int orderid , int cardid);
	
	
	/**
	 * 现金付款
	 * @return
	 */
	public boolean update_two_order(int type , String time ,Double dou , String number);
	
	
	/**
	 * 根据房屋状态与桌子id查询该桌子订单信息
	 * @param status
	 * @param houseid
	 * @return
	 */
	public Order select_houseid_state(int status , int houseid);
	
	
	/**
	 * StringBuffer 添加  时间区间，分页,付款类型（0：现金； 1：会员卡  2：支付宝  3：微信   4：银行卡）来查询 sum(pay_price)
	 */
	public List<Order> select_IcOrder(String sql);
	
	/**
	 * StringBuffer 添加  时间区间，分页,付款类型（0：现金； 1：会员卡  2：支付宝  3：微信   4：银行卡）来查询 sum(pay_price)
	 */
	public List<Order> select_XjOrder(String sql);
	/**
	 * StringBuffer 添加  时间区间，分页,付款类型（0：现金； 1：会员卡  2：支付宝  3：微信   4：银行卡）来查询 sum(pay_price)
	 */
	public List<Order> select_ZfOrder(String sql);
	/**
	 * StringBuffer 添加  时间区间，分页,付款类型（0：现金； 1：会员卡  2：支付宝  3：微信   4：银行卡）来查询 sum(pay_price)
	 */
	public List<Order> select_WxOrder(String sql);
	/**
	 * StringBuffer 添加  时间区间，分页,付款类型（0：现金； 1：会员卡  2：支付宝  3：微信   4：银行卡）来查询 sum(pay_price)
	 */
	public List<Order> select_YhOrder(String sql);
	
	
	/**
	 * 根据订单编号查询商品中可续杯的选项
	 * @param number
	 * @return
	 */
	public Selling_list select_xubei_order(String number);
	
	/**
	 * 根据kaid 查询最近10条订单
	 * @param id
	 * @return
	 */
	public List<Order> select_card_id(int id);
	
	/**
	 * 根据orderid 查询订单信息
	 * @param number
	 * @return
	 */
	public Order select_number_orderId(int orderid);
	
	
	/**
	 * @author sxl666
	 * 查询员工个人业绩
	 */
	public List<Order> select_person_score(int accountuserid);
}
