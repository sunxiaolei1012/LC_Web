package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Banner;


/**
 * 横幅 接口
 * @author 陈玉博
 * @date 2018年8月21日下午3:42:04
 */
public interface BannerDao {
	
	
	/**
	 * 查询横幅
	 */
	public List<Banner> show_Banner();

}
