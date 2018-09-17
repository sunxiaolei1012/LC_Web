package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Tea_House;


/**
 * 茶室房屋接口
 * @author 陈玉博
 * @date 2018年7月11日下午5:01:29
 */
public interface Tea_HouseDao {

	
	/**
	 * 添加房屋
	 * @param str
	 * @return
	 */
	public boolean insert_house(String str);
	
	/**
	 * 查询全部房屋信息
	 * @return
	 */
	public List<Tea_House> select_House();
	/**
	 * 根据ID 查询房屋信息
	 * @param id
	 * @return
	 */
	public Tea_House select_House_id(int id);
	/**
	 * 根据ID 修改桌子状态
	 * @param id
	 * @param status
	 * @return
	 */
	public boolean update_house_tea(int id , int status);
	
	/**
	 * 根据ID 删除桌子信息
	 * @param id
	 * @return
	 */
	public boolean del_house(int id);
	
}
