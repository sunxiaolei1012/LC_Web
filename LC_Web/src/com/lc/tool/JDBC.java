package com.lc.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class JDBC {

	public int Jdbc(int id, String column)
	{
		 int a = 0;
		 try{   
			    //����MySql��������   
			    Class.forName(Common.DRIVER) ;   
			    }
		 catch(ClassNotFoundException e){   
			    System.out.println("1");   
			    e.printStackTrace() ;   
			    }   
		    Connection con = null;
		    Statement stmt =null;
		    ResultSet rs = null;
		     try{   
		   con =    
		             DriverManager.getConnection(Common.URL , Common.USERNAME , Common.PASSWORD) ;  
	         stmt = con.createStatement() ;  
	        String sql = "insert into t_table_column values(null , "+id+","+column+","+Common.df.format(new Date())+")";
	        rs = stmt.executeQuery(sql) ; 
	        String sql1 = "SELECT LAST_INSERT_ID()";
	        rs = stmt.executeQuery(sql1) ; 
	       while(rs.next()){   
	           a  = rs.getInt(1) ;   
	       }   
	     
		     }catch(SQLException se){   
		    System.out.println("2");   
		    se.printStackTrace() ;   
		     }  
		     finally{
		    	 try {
					con.close();
					stmt.close();
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		     }
		return  a;
	}
	
	
	
	
	public int Log_number(int uid)
	{
		int a = 0;
		 try{   
			    //����MySql��������   
			    Class.forName(Common.DRIVER) ;   
			    }
		 catch(ClassNotFoundException e){   
			    e.printStackTrace() ;   
			    }   
		    Connection con = null;
		    Statement stmt =null;
		    ResultSet rs = null;
		     try{   
		   con =    
		             DriverManager.getConnection(Common.URL , Common.USERNAME , Common.PASSWORD) ;  
	         stmt = con.createStatement() ;  
	        String sql = "select COUNT(uid) from t_log where uid="+uid+";";
	        rs = stmt.executeQuery(sql) ; 
	       while(rs.next()){   
	           a = rs.getInt(1) ;   
	         
	       }   
	     
		     }catch(SQLException se){   
		    System.out.println("���ݿ�����ʧ�ܣ�");   
		    se.printStackTrace() ;   
		     }  
		     finally{
		    	 try {
					con.close();
					stmt.close();
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		     }
		return  a;
	}
	
	
	
	
	
	public int Column_number(int uid)
	{
		int a = 0;
		 try{   
			    //����MySql��������   
			    Class.forName(Common.DRIVER) ;   
			    }
		 catch(ClassNotFoundException e){   
			    e.printStackTrace() ;   
			    }   
		    Connection con = null;
		    Statement stmt =null;
		    ResultSet rs = null;
		     try{   
		   con =    
		             DriverManager.getConnection(Common.URL , Common.USERNAME , Common.PASSWORD) ;  
	         stmt = con.createStatement() ;  
	        String sql = "select COUNT(tlid) from t_table_line where tcid="+uid+";";
	        rs = stmt.executeQuery(sql) ; 
	       while(rs.next()){   
	           a = rs.getInt(1) ;   
	         
	       }   
	     
		     }catch(SQLException se){   
		    System.out.println("���ݿ�����ʧ�ܣ�");   
		    se.printStackTrace() ;   
		     }  
		     finally{
		    	 try {
					con.close();
					stmt.close();
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		     }
		return  a;
	}
}
