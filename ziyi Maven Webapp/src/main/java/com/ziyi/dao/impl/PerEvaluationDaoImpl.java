package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.PerEvaluationDao;
import com.ziyi.pojo.PerEvaluation;

public class PerEvaluationDaoImpl implements PerEvaluationDao {

	@Override
	public List<PerEvaluation> select_account_user() {
		/*String sql="select *  from v_perEvaluation";*/
		
		String sql="select * from v_perEvaluation";
		List<PerEvaluation> list=Common.UTIL.query(sql, null, PerEvaluation.class);
		if(list.size()>0 && list!=null) {
			
			return list;
		}else{
		return null;
		}
	}

}
