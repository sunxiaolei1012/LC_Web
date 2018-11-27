package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Card;
import com.ziyi.pojo.Order;

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
	/**
	 * 根据卡编号 获取卡信息 //按时间倒序查询
	 * @param number
	 * @return
	 */
	public Card select_card_numbers(String number);
	
	
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
	public List<Card> select_cards();
	public List<Card> select_cardtype(String id , String str);
	
	/**
	 *展示全部卡分类
	 * @return
	 */
		public List<Card> showCardType();
		
		
//sxl		
		public List<Order> check_oder_cardid(int cardid);
		
	/**
	 * 当天售卡记录
	 */
		public List<Card> showCardByTime();
		
		
		
		public  int addCard(Card card);
	/**
	 * 判断卡号是否存在
	 */
		public int checkCardId(String number);
		
	/**
	 * StringBuffer 条件分页查询 sql
	 */
		public List<Card> select_card(String sql);
		
		/**
		 * 卡总条数	
		 */
			public int allCount();
	/**
	 * 查询区间段 ic卡销售金额
	 */
	  public  List<Card>  icCount(String begintime,String endtime);

}
