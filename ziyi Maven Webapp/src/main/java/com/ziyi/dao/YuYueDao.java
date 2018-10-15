package com.ziyi.dao;

import com.ziyi.pojo.YuYue;

/**
 * 预约表接口
 * @author 陈玉博
 * @date 2018年10月15日下午2:16:13
 */
public interface YuYueDao {
	/**
	 * 添加信息
	 * @param yu
	 * @return
	 */
	public boolean insert_yuyue(YuYue yu);
	/**
	 * 根据桌号，查询预约信息
	 * @param tid
	 * @return
	 */
	public YuYue select_yuyue_tid(int tid);
}
