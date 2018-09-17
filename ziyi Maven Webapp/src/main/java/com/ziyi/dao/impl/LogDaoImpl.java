package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.ziyi.dao.LogDao;
import com.ziyi.pojo.Log;


public class LogDaoImpl implements LogDao{

//	@Override
//	public int insert_log(Log lg) {
//		int a = Common.UTIL.getRes("insert into t_log values(null ,?, ?, ?)", new Object[]{lg.getUserid() , lg.getValue() , lg.getTime()});
//		if(a > 0)
//		{
//			List<Log> list = Common.UTIL.query("select id from t_log order by id  desc limit 1 ", null,Log.class);
//			for (Log ite : list) {
//				System.out.println(ite);
//				a=ite.getId();
//			}
//		}
//		return a ;
//	}

	public void insert_log_time(Log log) {
		Util.getRes("insert into t_log values(null,?,?,?)", new Object[]{log.getValue(),log.getTime() , log.getType() });
	}

	public List<Log> select_log_string(String str) {
		List<Log> list = Common.UTIL.query(str, null, Log.class);
		if(list != null && list.size()>0)
			return list;
		return null;
	}

}
