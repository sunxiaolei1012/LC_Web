package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Card_type;


/**
 * 卡类型接口
 * @author 陈玉博
 * @date 2018年7月11日下午5:02:04
 */
public interface Card_typeDao {
	
	
	
	/**
	 * 添加卡信息
	 * @param name
	 * @param reabte
	 * @return
	 */
	public boolean insert_card(String name , Double reabte);
	
	/**
	 * 根据id 删除卡类型
	 * @param ctid
	 * @return
	 */
	public boolean delete_card_id(int ctid);
	
	/**
	 * 查询全部卡信息
	 * @return
	 */
	public List<Card_type> select_card_type();
	/**
	 * 根据卡id 修改卡信息
	 * @param ct
	 * @return
	 */
	public boolean update_card_type(Card_type ct);
	
	/**
	 * 根据ctid查询卡信息
	 * @param ctid
	 * @return
	 */
	public Card_type select_card_ctid(int ctid);
	
	/**
	 * 根据卡名称 获取卡信息
	 * @param name
	 * @return
	 */
	public Card_type select_name(String name);
}
