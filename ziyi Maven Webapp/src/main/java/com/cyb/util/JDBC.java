package com.cyb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ziyi.pojo.entity.V_Dian;
import com.ziyi.pojo.entity.V_Jie;

public class JDBC {

	/**
	 * 根据支付类型查询信息
	 * @param year
	 * @param day
	 * @return
	 */
	public List<V_Jie>  select_jie()
	{
		
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		List<V_Jie> list = new ArrayList<V_Jie>();
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select * from v_yeji_jie");
			res=ps.executeQuery();
			while(res.next())
			{
				V_Jie vd = new V_Jie();
				vd.setCount(res.getInt(3));
				vd.setName(res.getString(1));
				vd.setUserid(res.getInt(1));
				list.add(vd);
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
		return list;
	}
	/**
	 * 根据支付类型查询信息
	 * @param year
	 * @param day
	 * @return
	 */
	public List<V_Dian>  select_dian()
	{
		
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		List<V_Dian> list = new ArrayList<V_Dian>();
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select * from v_yeji_dian");
			res=ps.executeQuery();
			while(res.next())
			{
				V_Dian vd = new V_Dian();
				vd.setCount(res.getInt(3));
				vd.setName(res.getString(1));
				vd.setUserid(res.getInt(1));
				list.add(vd);
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
		return list;
	}
	
	
	/**
	 * 根据支付类型查询信息
	 * @param year
	 * @param day
	 * @return
	 */
	public List<Double> sum_pay_money_type(int type , int year)
	{
		
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		List<Double> list = new ArrayList<Double>();
		for (int i = 0; i < 12; i++) {
			list.add(0.00);
		}
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select sum(pay_price) as totalmoney,date_format(checkouttime, '%m') from t_order where type="+type+" and checkouttime like '"+year+"%' group by date_format(checkouttime, '%Y-%m');");
			res=ps.executeQuery();
			while(res.next())
			{
				
				list.set(res.getInt(2)-1, new Double(Common.double_df.format(res.getDouble(1))));
//				mapss.put(res.getInt(2), new Double(Common.double_df.format(res.getDouble(1))));
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
		return list;
	}
	
	
	public Map<Integer, Object> sum_pay_money_day(int year , String day)
	{
		
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		Map<Integer , Object> mapss=Common.TOOLS.monty_day(year, false,new Integer(day));
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select sum(pay_price) as totalmoney,date_format(checkouttime, '%d') from t_order where checkouttime like '"+year+"-%"+day+"%' group by date_format(checkouttime, '%Y-%m-%d');");
			res=ps.executeQuery();
			while(res.next())
			{
				
				mapss.put(res.getInt(2), new Double(Common.double_df.format(res.getDouble(1))));
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
		return mapss;
	}
	
	
	/**
	 * 根据年份 查询对应月总金额
	 * @param str
	 * @return
	 */
	public Map<Integer, Object> sum_pay_money(int str)
	{
		
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		Map<Integer, Object> map = Common.TOOLS.monty_day(0, true, 0);
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select sum(pay_price) as totalmoney,date_format(checkouttime, '%m') from t_order where checkouttime like '"+str+"%' group by date_format(checkouttime, '%Y-%m');");
			res=ps.executeQuery();
			while(res.next())
			{
				
				map.put(res.getInt(2), new Double(Common.double_df.format(res.getDouble(1))));
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
		return map;
	}
	
	
	
	
	/**
	 * 计算当日营业额
	 * @param str
	 * @return
	 */
	public Double price_day_sum(String str)
	{
		
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		try
		{
			con=Util.getConn();
			ps=con.prepareStatement("select SUM(price) from t_order where `status`=1 and checkouttime LIKE '"+str+"%'");
			res=ps.executeQuery();
			if(res.next())
			{
				return res.getDouble(1);
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
		return 0.00;
	}
	
	
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
