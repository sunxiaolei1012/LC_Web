package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.PerEvaluation;

public interface PerEvaluationDao {
	/**
	 * 
	 * @author sxl666
	 * 账单操作统计
	 */
	
		public List<PerEvaluation>  select_account_user();
}
