package com.cyb.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class Util<T> {
	
	
	
	/**
	 * 锟斤拷态锟斤拷锟斤拷锟�
	 */
	static{
		try {
			Class.forName(Common.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param sql
	 * @param args
	 * @param clazz
	 * @return
	 * 
	 * while(res.next()){
	 * 	UserInfo ui=new UserInfo();
	 * 	ui.setId(res.xxxx);
	 * }
	 */
	public  List<T> query(String sql, Object[] args, Class clazz) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<T> list=new ArrayList<T>();
		try
		{
			Field[] fields=clazz.getDeclaredFields();
			Method method=null;
			conn=getConn();
			ps=conn.prepareStatement(sql);
			if(args !=null && args.length>0)
			{
				for(int i=0;i<args.length;i++)
				{
					ps.setObject(i+1,args[i]);
				}
			}
			rs=ps.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			int count =rsmd.getColumnCount();
			while(rs.next())
			{
				Constructor c0=  clazz.getDeclaredConstructor();
				c0.setAccessible(true); 
				T obj=(T)c0.newInstance();
				for(int i=1;i<=count;i++)
				{
					String cname=rsmd.getColumnName(i);
					int type=rsmd.getColumnType(i);
					for(Field f : fields)
					{
						if(cname.equalsIgnoreCase(f.getName()))
						{
							String methodName="set"+f.getName().substring(0,1).toUpperCase()+f.getName().substring(1);
							
							switch(type)
							{
							
							case Types.INTEGER:
								method = clazz.getMethod(methodName,Integer.class);
								method.invoke(obj, rs.getInt(i));
								break;
							case Types.DOUBLE:
								method = clazz.getMethod(methodName,Double.class);
								method.invoke(obj, rs.getDouble(i));
								break;
							case Types.TIMESTAMP:
								method =clazz.getMethod(methodName, String.class);
								method.invoke(obj, rs.getString(i));
								break;
							case Types.VARCHAR:
							case Types.NVARCHAR:	
								method = clazz.getMethod(methodName,String.class);
								method.invoke(obj, rs.getString(i));
								break;
							}
						}
					}
				}
				list.add(obj);
			}
			
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeRes(conn,ps,rs);
		}
		return list;
	}
	/**
	 * 
	 * @return
	 */
	public static int sqlCount(String sql)
	{
		Connection con=null;
		ResultSet res=null;
		PreparedStatement ps=null;
		try
		{
			con=getConn();
			ps=con.prepareStatement(sql);
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
			closeRes(con,ps,res);
		}
		return 0;
	}
	public static Connection getConn(){
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(
					Common.URL,Common.USERNAME,Common.PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static void closeRes(Connection con,Statement sta,ResultSet res){
		
		try {
			if(con!=null){
				con.close();
			}
			if(sta!=null){
				sta.close();
			}
			if(res!=null){
				res.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public static int getRes(String sql,Object[] obj){
		Connection con=null;
		PreparedStatement ps=null;
		int res=0;
		try
		{
			con=getConn();
			ps=con.prepareStatement(sql);
			if(obj!=null)
			{
				for(int i=0;i<obj.length;i++)
				{
					ps.setObject(i+1, obj[i]);
				}
			}
			res=ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			closeRes(con,ps,null);
		}
		return res;
	}
	}
