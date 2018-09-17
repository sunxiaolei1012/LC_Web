package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Order;


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
	
	
	
	
}
