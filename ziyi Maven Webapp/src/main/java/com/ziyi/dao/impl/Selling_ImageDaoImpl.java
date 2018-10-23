package com.ziyi.dao.impl;

import java.util.Date;
import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Selling_ImageDao;
import com.ziyi.pojo.Selling_Image;


public class Selling_ImageDaoImpl implements Selling_ImageDao{

	public boolean insert_selling_image(int id, String url) {
		int a =Common.UTIL.getRes("insert into t_selling_image values(null , ?,?,?)", new Object[]{id ,url , Common.df.format(new Date())});
		return a>0?true:false;
	}

	public List<Selling_Image> select_selling_image(int id) {
		List<Selling_Image> list = Common.UTIL.query("select url from t_selling_image where sellingid=?", new Object[]{id}, Selling_Image.class);
		if(null != list && list.size()>0)
			return list;
		return null;
	}

	@Override
	public boolean del_image(int id) {
		int a =Common.UTIL.getRes("delete from t_selling_image where id=?", new Object[]{id});
		return a>0?true:false;
	}

	@Override
	public List<Selling_Image> select_selling_images(int id) {
		List<Selling_Image> list = Common.UTIL.query("select * from t_selling_image where sellingid=?", new Object[]{id}, Selling_Image.class);
		if(null != list && list.size()>0)
			return list;
		return null;
	}

}
