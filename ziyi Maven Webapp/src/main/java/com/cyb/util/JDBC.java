package com.cyb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class JDBC {
	
	
	/**
	 * 用来计算表中总共有多少数据
	 * @param id 表ID 
	 * @param name 
	 * @return
	 */
	public int count_zong(String id , String name)
	{
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select COUNT("+id+") as count from "+name+";");
			res=ps.executeQuery();
			if(res.next())
			{
				return res.getInt(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			Util.closeRes(con,ps,res);
		}
		return 0;
	}
	
	/**
	 * 计算今日总金额
	 * @return
	 */
	public float sum_order(String time)
	{
		 float a = 0;
		 try{   
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
	        String sql = "select sum(price) from t_order where checkouttime like '"+time+"%'";
	        rs = stmt.executeQuery(sql) ; 
	       while(rs.next()){   
	           a  = rs.getFloat(1) ;   
	       }   
	     
		     }catch(SQLException se){   
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
