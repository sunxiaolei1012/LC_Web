package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.Log_TypeDao;
import com.ziyi.pojo.Log_Type;

public class Log_TypeDaoImpl implements Log_TypeDao{

	@Override
	public List<Log_Type> show() {
		List<Log_Type> list = Common.UTIL.query("select * from t_log_type", null, Log_Type.class);
		if(list != null && list.size()>0)
			return list;
		return null;
	}

}
