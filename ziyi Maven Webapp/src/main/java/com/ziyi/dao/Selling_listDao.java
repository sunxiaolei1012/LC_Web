package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Selling_list;


/**
 * 物品表接口
 * @author 陈玉博
 * @date 2018年7月11日下午5:00:44
 */
public interface Selling_listDao {
	/**
	 * 添加商品信息
	 * @param sl
	 * @return
	 */
	public int insert_Selling_list(Selling_list sl);

	/**
	 * 查询商品信息
	 * @param str
	 * @return
	 */
//	public List<Return_Sellings> select_list(String str);
	/**
	 * 根据ID 查询商品信息
	 * @param id
	 * @return 商品对象
	 */
	public Selling_list selecct_id_list(int id);

	
	/**
	 * 根据商品id修改商品信息
	 */
	public boolean update_selling_list(Selling_list list);
	/**
	 * 根据商品id 删除商品信息
	 * @param id
	 * @return
	 */
	public boolean del_selling_list(int id);
	
	
	/**
	 * 查询商品信息 ,按售出数量，倒序查询
	 */
	public List<Selling_list> select_selling_list(int begin , int end);
	
	/**
	 * 查询商品列表 分页
	 * @param page
	 * @param count
	 * @return
	 */
	public List<Selling_list> select_selling_list_page(int page, int count);
	

}
