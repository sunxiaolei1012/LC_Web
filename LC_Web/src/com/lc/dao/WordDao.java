package com.lc.dao;

import java.util.List;

import com.lc.entity.Word;

public interface WordDao {
	/**
	 * @author sxl
	 */
	//查询所有内容
	public List<Word> check_AllWord();
	
	//根据jspname查询当前界面的 文字
	public List<Word> check_WordByName(String jspname);
	
	//根据id 来查询 word
	
	public List<Word> check_WordById(int id);
	
	//根据id 来修改 content
	public  int updateContent(int id,String content);
	
	
}
