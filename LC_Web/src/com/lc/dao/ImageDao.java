package com.lc.dao;

import java.util.List;

import com.lc.entity.Image;

public interface ImageDao {
	
	//上传图片时 插入图片
	
		public int  insertImage(String name,String route,String jspname);
		
	//根据jspname 查询图片
		public List<Image> check_image_jspname(String jspname);
		
	//查询所有的图片
		public List<Image> check_AllImage();
		
		
		//根据图片id 删除图片
		public int del_image_id(int id);

		
	
	

}
