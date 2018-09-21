package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Order_list;

/**
 * 订单详情表
 * @author 陈玉博
 * @date 2018年7月11日下午5:02:45
 */
public interface Order_listDao {
	
	/**
	 * 添加订单信息
	 * @return
	 */
	public boolean insert_order_list(Order_list ol);
	/**
	 * 查询订单信息
	 * @param orderid
	 * @param goodsid
	 * @return
	 */
	public Order_list select_number_order(Integer orderid , Integer goodsid);
	/**
	 * 根据ID 修改数量
	 * @param id
	 * @param number
	 * @return
	 */
	public boolean update_id_number(Double dou , Integer id , Integer orderid);
	public boolean update_id_numbers(Integer id, Integer number);
	/**
	 * 执行删除
	 * @param id
	 * @return
	 */
	public boolean del_id(Integer id , Double price , Integer orderid);
	
	/**
	 * 根据订单ID 查询订单信息
	 * @param order
	 * @return
	 */
	public List<Order_list> select_number_order(Integer order);

}
