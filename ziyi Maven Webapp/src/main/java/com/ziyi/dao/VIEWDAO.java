package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.V_ORDER_SELLING;

/**
 * 视图接口
 * @author 陈玉博
 * @date 2018年11月20日上午9:38:22
 */
public interface VIEWDAO {
	/**
	 * 根据订单编号 查询订单商品信息
	 * @param number
	 * @return
	 */
	public List<V_ORDER_SELLING> select(String number);
}
