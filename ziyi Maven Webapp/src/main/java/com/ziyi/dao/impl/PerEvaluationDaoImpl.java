package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.PerEvaluationDao;
import com.ziyi.pojo.PerEvaluation;

public class PerEvaluationDaoImpl implements PerEvaluationDao {

	@Override
	public List<PerEvaluation> select_account_user() {
		/*String sql="select `u`.`userid` AS `userid`,`u`.`name` AS `name`,"
				+ "sum(o.pay_price) AS `pay_price`,cast(count(0) as char charset utf8) AS `count` "
				+ "from (`t_users` `u` join `t_order` `o`) where (`u`.`userid` = `o`.`accountuserid`)"
				+ "group by `u`.`userid` ";*/
		
		String sql="select * from v_perEvaluation";
		
		List<PerEvaluation> list=Common.UTIL.query(sql, null, PerEvaluation.class);
		if(list.size()>0 && list!=null) {
			
			return list;
		}else{
		return null;
		}
	}
	@Override
	public List<PerEvaluation> select_kindAccount_user(String str) {
		String sql="select `u`.`userid` AS `userid`,`u`.`name` AS `name`,"
				+ "sum(o.pay_price) AS `pay_price`,cast(count(0) as char charset utf8) AS `count`"
				+ " from (`t_users` `u` join `t_order` `o`) where (`u`.`userid` = `o`.`accountuserid`)"
				+str;
		
		//String sql="select * from v_perEvaluation";//k
		System.out.println(sql);
		List<PerEvaluation> list=Common.UTIL.query(sql,null, PerEvaluation.class);
//				List<PerEvaluation> list=Common.UTIL.query(sql,new Object[]{str}, PerEvaluation.class);
		if(list.size()>0 && list!=null) {
			
			return list;
		}else{
		return null;
		}
	}

}
