package com.lc.daoImpl;

import java.util.List;

import com.lc.dao.WordDao;
import com.lc.entity.Word;
import com.lc.tool.Common;

public class WordDaoImpl  implements WordDao{

	@Override
	public List<Word> check_WordByName(String name) {
		String sql="select * from t_word where jspname like concat(?,'%')";
		
		@SuppressWarnings("unchecked")
		List<Word> list=Common.UTIL.query(sql, new Object[]{name}, Word.class);
		if(list!=null&&list.size()>0){
			return list;
		}
			return null;
	}

	@Override
	public List<Word> check_WordById(int id) {
			String sql="select * from t_word where id=?";
		
		@SuppressWarnings("unchecked")
		List<Word> list=Common.UTIL.query(sql, new Object[]{id}, Word.class);
		if(list!=null&&list.size()>0){
			return list;
		}
			return null;
	}

	@Override
	public int updateContent(int id, String content) {
			String sql="update t_word set content=?  where id=? ";
			int a = Common.UTIL.getRes(sql, new Object[]{content,id});
		return a;
	}

	@Override
	public List<Word> check_AllWord() {
		String sql ="select * from t_word ";
			 List<Word> list=Common.UTIL.query(sql, null, Word.class);
					 
			 if(list!=null&&list.size()>0){
					return list;
				}
					return null;
	}

	
	

}
