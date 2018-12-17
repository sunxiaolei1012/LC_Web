package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.YuYueDao;
import com.ziyi.pojo.YuYue;

public class YuYueDaoImpl implements YuYueDao{

	public boolean insert_yuyue(YuYue yu) {
		int a = Common.UTIL.getRes("insert into t_yuyue values(null,?,?,?,?,?)", new Object[]{yu.getName(),yu.getPhone(),yu.getTime(),yu.getState(),yu.getTid()});
		return a>0?true:false;
	}

	@Override
	public YuYue select_yuyue_tid(int tid) {
		List<YuYue> list = Common.UTIL.query("select * from t_yuyue where tid=? order by time desc", new Object[]{tid}, YuYue.class);
		if(null != list && list.size()>0)
		{
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean update_id_tid(int id, int tid) {
		String sql = "update t_yuyue set tid="+tid+" where id="+id;
		int a = Common.UTIL.getRes(sql, null);
		return a>0?true:false;
	}

}
