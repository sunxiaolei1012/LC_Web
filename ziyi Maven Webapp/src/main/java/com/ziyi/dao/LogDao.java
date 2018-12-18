package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Log;


/**
 * 日志接口
 * @author 陈玉博
 * @date 2018年7月11日下午5:03:04
 */
public interface LogDao {

	
//	public int insert_log(Log lg);
	
	
	public void insert_log_time(Log log);
	
	public List<Log> select_log_string(String str);
	
//	public List<Log> select_log_Stringbuffer(String str);
	
	
}
