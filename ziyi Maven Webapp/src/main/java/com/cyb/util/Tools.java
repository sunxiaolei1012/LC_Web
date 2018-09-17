package com.cyb.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



public class Tools {
	
	/**
	 * 返回
	 * @param re
	 */
	public void return_map_object(boolean bool , String true_str , String error_str)
	{
		Map<String , String> map = new HashMap<String , String>(); 
		if(bool)
		{
			map.put("state", "true");
			map.put("msg", true_str);
		}
		else
		{
			map.put("state", "false");
			map.put("msg", error_str);
		}
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		 PrintWriter writer = null;
			try {
				writer = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}   
	        writer.print(new Gson().toJson(map));  
	        writer.flush();  
	        writer.close();  
	}
	

	/**
	 * 获取终端IP
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request)  {  
		String ip  =  request.getHeader( " x-forwarded-for " );  
		if (ip == null || ip.length() == 0 || " unknown " .equalsIgnoreCase(ip))  {  
			ip = request.getHeader( " Proxy-Client-IP " );  
		}   
		if (ip  == null || ip.length() == 0 || " unknown " .equalsIgnoreCase(ip))  {  
			ip  =  request.getHeader( " WL-Proxy-Client-IP " );  
		}   
		if (ip  == null || ip.length() == 0 || " unknown " .equalsIgnoreCase(ip))  {  
			ip  =  request.getRemoteAddr();  
		}   
		return  ip;  
	 } 
	
	
		public static String getAccessToken() {  
		    String access_token = "";  
		    String grant_type = "client_credential";//获取access_token填写client_credential   
		    String AppId="wxf5c2981aea3c744e";//第三方用户唯一凭证  
		    String secret="9c49eb37d1fddba70579148356795239";//第三方用户唯一凭证密钥，即appsecret   
		    //这个url链接地址和参数皆不能变  
		    String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type="+grant_type+"&appid="+AppId+"&secret="+secret;  
		       
		    try {  
		        URL urlGet = new URL(url);  
		        HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();  
		        http.setRequestMethod("GET"); // 必须是get方式请求  
		        http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");  
		        http.setDoOutput(true);  
		        http.setDoInput(true);  
		        System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒  
		        System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒  
		        http.connect();  
		        InputStream is = http.getInputStream();  
		        int size = is.available();  
		        byte[] jsonBytes = new byte[size];  
		        is.read(jsonBytes);  
		        String message = new String(jsonBytes, "UTF-8");  
		        JsonObject js = (JsonObject) new JsonParser().parse(message);
		        access_token = js.get("access_token").getAsString();
//		        System.out.println(access_token);
		        is.close();  
		    } catch (Exception e) {  
		            e.printStackTrace();  
		    }  
		    return access_token;  
		} 
		
		
		public static String getTicket(String access_token) {  
		    String ticket = null;  
		    String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+ access_token +"&type=jsapi";//这个url链接和参数不能变  
		    try {  
		        URL urlGet = new URL(url);  
		        HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();  
		        http.setRequestMethod("GET"); // 必须是get方式请求  
		        http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");  
		        http.setDoOutput(true);  
		        http.setDoInput(true);  
		        System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒  
		        System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒  
		        http.connect();  
		        InputStream is = http.getInputStream();  
		        int size = is.available();  
		        byte[] jsonBytes = new byte[size];  
		        is.read(jsonBytes);  
		        String message = new String(jsonBytes, "UTF-8");  
		        JsonObject js = (JsonObject) new JsonParser().parse(message);
		        ticket = js.get("ticket").getAsString();
//		        JSONObject demoJson = JSONObject.fromObject(message);  
//		        System.out.println("JSON字符串："+demoJson);  
//		        ticket = demoJson.getString("ticket");  
		        is.close();  
		    } catch (Exception e) {  
		            e.printStackTrace();  
		    }  
		    return ticket;  
		} 
		
		public static String SHA1(String decript) {  
		    try {  
		        MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");  
		        digest.update(decript.getBytes());  
		        byte messageDigest[] = digest.digest();  
		        // Create Hex String  
		        StringBuffer hexString = new StringBuffer();  
		        // 字节数组转换为 十六进制 数  
		            for (int i = 0; i < messageDigest.length; i++) {  
		                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);  
		                if (shaHex.length() < 2) {  
		                    hexString.append(0);  
		                }  
		                hexString.append(shaHex);  
		            }  
		            return hexString.toString();  
		   
		        } catch (NoSuchAlgorithmException e) {  
		            e.printStackTrace();  
		        }  
		        return "";  
		}  
	/**
	 * 生成随机字符串
	 * 
	 */
	private static int getRandom(int count) {
	   return (int) Math.round(Math.random() * (count));
	   }
	 
	private static String string = "abcdefghijklmnopqrstuvwxyz";   
	 
	public static String getRandomString(int length){
	    StringBuffer sb = new StringBuffer();
	    int len = string.length();
	    for (int i = 0; i < length; i++) {
	        sb.append(string.charAt(getRandom(len-1)));
	    }
	    return sb.toString();
	}

	/**
	 * 生成uuid
	 * @return
	 */
	public String uuid()
	{
		return UUID.randomUUID().toString().replace("-", "");
		
	}
	/**
	 * 根据map value获取key
	 * @param map
	 * @param value
	 * @return
	 */
	public  int getKey(Map<Integer,String> map,String value){
		int key = 0;
		for (Map.Entry<Integer, String> entry : map.entrySet()) {
			if(value.equals(entry.getValue())){
				key=entry.getKey();
			}
		}
		return key;
	}
	/**
	 * 返回
	 * @param re
	 */
	public void returns(String re)
	{
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		 PrintWriter writer = null;
			try {
				writer = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}   
	        writer.print(re);  
	        writer.flush();  
	        writer.close();  
	}
	/**
	 * 返回
	 * @param re
	 */
	public void return_object(Object re)
	{
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		 PrintWriter writer = null;
			try {
				writer = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}   
	        writer.print(re);  
	        writer.flush();  
	        writer.close();  
	}
	
	/**
	 * 返回
	 * @param re
	 */
	public void returns_map(Map re)
	{
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		 PrintWriter writer = null;
			try {
				writer = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}   
	        writer.print(re);  
	        writer.flush();  
	        writer.close();  
	}
	
	
	/**
	 * 统一返回
	 * @param bool
	 */
	public void return_bool(boolean bool)
	{
		
	}
	
	/**
	 * 生成随机文件名：当前年月日时分秒+五位随机数
	 * 
	 * @return
	 */
	public String getRandomFileName() {
 
		SimpleDateFormat simpleDateFormat;
 
		simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmm");
 
		Date date = new Date();
 
		String str = simpleDateFormat.format(date);
 
		Random random = new Random();
 
		int rannum = (int) (random.nextDouble() * (9999 - 1000 + 1)) + 1000;// 获取4位随机数
 
		return str+rannum;// 当前时间
	}
	

}
