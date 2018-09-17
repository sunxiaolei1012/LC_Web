package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Card;

/**
 * 会员卡接口
 * @author 陈玉博
 * @date 2018年7月11日下午4:59:55
 */
public interface CardDao {
	
	
	/**
	 * 添加卡信息
	 * @param ca
	 * @return
	 */
	public boolean insert_card(Card ca);
	/**
	 * 根据卡编号 判断卡是否已经存在
	 * @param number
	 * @return
	 */
	public boolean select_card_id(String number);
	
	/**
	 * 根据卡编号 获取卡信息
	 * @param number
	 * @return
	 */
	public Card select_card_number(String number);
	
	
	public boolean del_card_number(String number);
	
	
	public boolean update_card_number(Card ca);
	
	/**
	 * 查询全部会员卡
	 * @return
	 */
	public List<Card> select_card();
	
	/**
	 * 根据卡ID 查询卡信息
	 * @param id
	 * @return
	 */
	public Card select_card_id(int id);
	
	/**
	 * 根据会员卡ID 修改会员信息
	 * @param ca
	 * @return
	 */
	public boolean update_card(Card ca);
	
	/**
	 * 根据会员卡ID 删除会员信息
	 * @param id
	 * @return
	 */
	public boolean del_card_id(int id);
	
	/**
	 * 分页查询数据
	 * @return
	 */
	public List<Card> select_card(int page, int count);

}
