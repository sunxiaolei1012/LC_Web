package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Selling_type;


public interface Selling_typeDao {
	/**
	 * 查询商品类别
	 * @return
	 */
	public List<Selling_type> select_selling_type();
	/**
	 * 根据ID 获取商品类别
	 * @param id
	 * @return
	 */
	public String select_selling_type_name(int id);
	
	/**
	 * 根据商品名称 查询信息
	 * @param type_name
	 * @return
	 */
	public Selling_type select_type_name(String type_name);
	/**
	 * 添加商品信息
	 * @param type_name
	 * @return
	 */
	public boolean insert_sellect_type(String type_name);
	/**
	 * 根据ID 删除商品信息
	 * @param id
	 * @return
	 */
	public boolean del_selling_type(int id);
	
	
	/**
	 * 根据ID 获取类别信息
	 * @param id
	 * @return
	 */
	public Selling_type select_type_name(int id);
	/**
	 * 根据商品类别ID 修改商品类别
	 * @param selling_type
	 * @return
	 */
	public boolean update_selling_type(Selling_type selling_type);
}
