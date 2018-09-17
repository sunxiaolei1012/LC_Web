package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.BannerDao;
import com.ziyi.pojo.Banner;


public class BannerDaoImpl implements BannerDao{

	public List<Banner> show_Banner() {
		List<Banner> list = Common.UTIL.query("select * from t_banner", null, Banner.class);
		if(null != list && list.size()>0)
			return list;
		return null;
	}

}
