package com.lc.daoImpl;

import java.util.List;

import com.lc.dao.ImageDao;
import com.lc.entity.Image;
import com.lc.tool.Common;

public class ImageDaoImpl  implements ImageDao{

	@Override
	public int insertImage(String name,String route,String jspname) {
		String sql="insert into t_image (name,route,jspname) value (?,?,?) ";
		int a=Common.UTIL.getRes(sql, new Object[]{name,route,jspname});
		return a;
	}

	@Override
	public List<Image> check_image_jspname(String jspname) {
		String sql="select  * from t_image where jspname like concat(?,'%')";
			 List<Image> list=Common.UTIL.query(sql, new Object[]{jspname},Image.class);
			 if(list!=null&&list.size()>0)
				 return list;
		
		return null;
	}

	@Override
	public List<Image> check_AllImage() {
		
		String sql="select * from t_image";
		List<Image> list=Common.UTIL.query(sql, null, Image.class);
		if(list.size()>0&&list!=null)
			return list;
		return null;
	}

	@Override
	public int del_image_id(int  id) {
		
		String sql="delete from t_image where id=? ";
		int a=Common.UTIL.getRes(sql, new Object[]{id});
		return a;
	}
	
	

}
