package com.lc.tool;

import java.text.SimpleDateFormat;
import java.util.Properties;

import com.lc.dao.ImageDao;
import com.lc.dao.WordDao;
import com.lc.daoImpl.ImageDaoImpl;
import com.lc.daoImpl.WordDaoImpl;
/**
 *甯搁噺
 * @author cyb
 *
 */
public class Common {

	
	static Properties pros = null;  
	static {  
			pros = new Properties();
	try {
		pros.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
		
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	 static final String DRIVER=pros.getProperty("driver");
	 static final String URL=pros.getProperty("url");
	 static final String USERNAME=pros.getProperty("user");
	 static final String PASSWORD=pros.getProperty("password");
	 
	 public static final Util UTIL = new Util();
	 
	 public static final WordDao wd= new WordDaoImpl(); 
	
	 public static final JDBC JD = new JDBC();
	 public static final ImageDao  imagedao=new ImageDaoImpl();
	 
	 
	 public static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	 
}
