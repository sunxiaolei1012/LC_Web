package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Selling_Image;


/**
 * 商品图片接口
 * @author 陈玉博
 * @date 2018年7月27日上午4:15:48
 */
public interface Selling_ImageDao {

	/**
	 * 添加图片信息
	 * @param id
	 * @param url
	 * @return
	 */
	public boolean insert_selling_image(int id , String url);
	
	
	public List<Selling_Image> select_selling_image(int id);
	public List<Selling_Image> select_selling_images(int id);
	/**
	 * 根据图片ID 删除图片信息
	 * @param id
	 * @return
	 */
	public boolean del_image(int id);
}
