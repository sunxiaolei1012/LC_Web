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

import com.atgeretg.serialport.exception.SendDataToSerialPortFailure;
import com.atgeretg.serialport.exception.SerialPortOutputStreamCloseFailure;
import com.atgeretg.serialport.manage.SerialPortManager;
import com.atgeretg.serialport.utils.MyUtils;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.port.main.Main;
import com.ziyi.pojo.Log;
import com.ziyi.pojo.Order;



public class Tools {
	/**
	 * 返回唯一订单码  
	 * @return
	 */
	public String return_orderid()
	{
		String str = getRandomFileName();
		Order order = Common.ORDER.select_number_order(str);
		if(null == order)
			return str;
		return return_orderid();
	}
	
	public void log_time(String value , Integer type)
	{
		
		Log log = new Log();
		log.setValue(value);
		log.setType(type);
		log.setTime(Common.df.format(new Date()));
		Common.LOG.insert_log_time(log);
	}
	
	
	/**
     * 获取文件扩展名
     * @return
     */
    public static String ext(String filename) {
        int index = filename.lastIndexOf(".");
 
        if (index == -1) {
            return null;
        }
        String result = filename.substring(index + 1);
        return result;
    }
	/**
	 * bcc校验
	 */
	public static String getBCC(byte[] data) {

		  String ret = "";
		  byte BCC[]= new byte[1];
		  for(int i=0;i<data.length;i++)
		  {
		  BCC[0]=(byte) (BCC[0] ^ data[i]);
		  }
		  String hex = Integer.toHexString(BCC[0] & 0xFF);
		  if (hex.length() == 1) {
		  hex = '0' + hex;
		  }
		  ret += hex.toUpperCase();
		  return ret;
		}
	
	
	/**
	 * 写卡
	 * 
	 */
	public void white_card()
	{
		try {
			Main.sendData("10");
			Thread.sleep(300);
			byte by =  MyUtils.HexString2Bytes(getBCC(config.WHITE))[0];
			config.WHITE[config.WHITE.length-1] = by;
			SerialPortManager.sendToPort(Main.serialport, config.WHITE);
			Thread.sleep(500);
		} catch (SendDataToSerialPortFailure e) {
			e.printStackTrace();
		} catch (SerialPortOutputStreamCloseFailure e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 读卡2
	 * @throws InterruptedException 
	 */
	public String read_card_two() throws InterruptedException
	{
		try {
			Main.sendData("9");
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		}
		Date da = new Date();
		StringBuffer sb = new StringBuffer();
		while(true)
		{
			if(!config.BOOL)
			{
				Thread.sleep(200);
			}
			else
			{
				for (Byte by : config.READ_CARD) {
					sb.append(by);
				}
				break;
			}
		}
		return sb.toString();
	}
	/**
	 * 读卡1
	 * @throws InterruptedException 
	 */
	public String read_card() throws InterruptedException
	{
		
		try {
			Main.sendData("9");
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
		}
		Date da = new Date();
		StringBuffer sb = new StringBuffer();
		while(true)
		{
			if(da.getTime() > config.READ_CARD_MAP.get(1).getDate().getTime())
			{
				Thread.sleep(200);
			}
			else
			{
				sb.append(MyUtils.byteArray2HexString(config.READ_CARD_MAP.get(1).getRead(), config.READ_CARD_MAP.get(1).getRead().length, true));
				break;
			}
		}
		while(true)
		{
			if(config.READ_CARD_MAP.get(2).getRead() == null || da.getTime() > config.READ_CARD_MAP.get(2).getDate().getTime())
			{
				Thread.sleep(200);
			}
			else
			{
				sb.append(MyUtils.byteArray2HexString(config.READ_CARD_MAP.get(2).getRead(), config.READ_CARD_MAP.get(2).getRead().length, true));
				break;
			}
		}
		while(true)
		{
			if(config.READ_CARD_MAP.get(3).getRead() == null || da.getTime() > config.READ_CARD_MAP.get(3).getDate().getTime())
			{
				Thread.sleep(200);
			
			}else
			{
				sb.append(MyUtils.byteArray2HexString(config.READ_CARD_MAP.get(3).getRead(), config.READ_CARD_MAP.get(3).getRead().length, true));
				break;
			}
		}
			
		return sb.toString();
	}
	
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
	
	public void return_map_object_id(boolean bool , String true_str , String error_str,String id)
	{
		Map<String , String> map = new HashMap<String , String>(); 
		if(bool)
		{
			map.put("state", "true");
			map.put("id", id);
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
