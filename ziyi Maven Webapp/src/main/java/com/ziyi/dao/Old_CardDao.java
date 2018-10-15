package com.ziyi.dao;

import com.ziyi.pojo.Old_Card;

/**
 * 老卡接口
 * @author 陈玉博
 * @date 2018年10月11日上午10:50:48
 */
public interface Old_CardDao {
	/**
	 * 根据value值查询卡编号是否存在
	 * @param value 卡信息
	 * @return
	 */
	public Old_Card select_value_number(String value);
	
	/**
	 * 根据卡编号 查询value是否存在
	 * @param number 卡编号
	 * @return
	 */
	public Old_Card select_number_value(String number);
	/**
	 * 添加老卡片信息
	 * @param oc
	 * @return
	 */
	public boolean insert_old_card(Old_Card oc);
	/**
	 * 根据卡编号 删除卡信息
	 * @param number
	 * @return
	 */
	public boolean del_number_old_card(String number);
	/**
	 * 根据卡ID 删除卡信息
	 * @param id
	 * @return
	 */
	public boolean del_id_old_card(int id);

}
