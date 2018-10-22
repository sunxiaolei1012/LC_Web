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
import java.util.List;
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
import com.ziyi.pojo.Old_Card;
import com.ziyi.pojo.Order;



public class Tools {
	

	
	/**
	 * 返回读新卡时的卡号
	 * @param list
	 * @return
	 */
	public String return_read_card_number(List<Byte> list)
	{
		StringBuffer sb = new StringBuffer();
		//新卡，读取会员卡的
		
		for (int i = 44; i < 50; i++) {
			
			if(list.get(i).equals((byte)-1))
			{
				return null;
			}
			sb.append((char)MyUtils.byteToInt(list.get(i)));
		}
		return sb.toString();
	}
	/**
	 * 激活老卡
	 * @param number
	 */
	public void ji_old_card(String number)
	{
		try {
			int a = read_card_two();
			if(a == 2)
			{
				//读卡失败
				Common.TOOLS.return_object(config.READ_CARD_TEXT);
			}
			else if (a== 0) // 新卡
			{
				Common.TOOLS.return_object(config.READ_CARD_TEXT_NEW);
			}
			else
			{
				//老卡
				//根据编号与卡内容查询该老卡是否已经激活
				Old_Card oc = Common.OLDDAO.select_number_value(number);
				if(oc == null)
				{
					
					//为空，根据编号 把卡信息插入表中
//					StringBuffer sb = new StringBuffer();
//					for (byte by : config.READ_CARD) {
//						sb.append(by);
//					}
					Common.OLDDAO.insert_old_card(new Old_Card(list_String(config.READ_CARD),number ));
					Common.TOOLS.return_object(1);
				}
				else//该卡编号已经存在
				{
					Common.TOOLS.return_object(config.READ_CARD_NULL);
				}
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String list_String(List<Byte> list)
	{
		StringBuffer sb = new StringBuffer();
		for (byte by : list) {
			sb.append(by);
		}
		return sb.toString();
	}
	
	 /**
     * 对一个数字进行异或加解密
     */
    public int code(int res, String key) {
        return res ^ key.hashCode();
    }
	
	/**
	 * 用来判断是新卡 还是老卡
	 * @return
	 */
	public int new_old_card()
	{
//		for (Byte by : config.READ_CARD) {
//			System.out.println(by);
//		}
		if(config.READ_CARD.get(12).equals((byte)-1) && config.READ_CARD.get(13).equals((byte)-1) && config.READ_CARD.get(14).equals((byte)-1)
				&& config.READ_CARD.get(15).equals((byte)-1) && config.READ_CARD.get(16).equals((byte)-1) && config.READ_CARD.get(17).equals((byte)-1))
		{
			return 0;
		}
		return 1;
	}
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
		  for(int i=0;i<data.length-1;i++)
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
	 * 写卡2
	 */
	public void white_card(String number)
	{
		try {
			
			//写卡流程
			//判断是新卡还是老卡
			int retu = Common.TOOLS.read_card_two();
			if(retu == 2)
			{
				//读卡失败
				Common.TOOLS.return_object(config.READ_CARD_TEXT);
			}
			else if (retu== 0) // 新卡
			{
				//解析新卡 读取卡号
				Main.sendData("10");
				Thread.sleep(300);
				//替换数据
				int a = Common.TOOLS.code(new Integer(number), config.KEY);
				byte[] bys = (a+"").getBytes();
				for (int i = 0; i < bys.length; i++) {
					config.WHITE_CARD[i+17] = bys[i];
				}
				
				
				byte by = MyUtils.HexString2Bytes(getBCC(config.WHITE_CARD))[0];
				config.WHITE_CARD[config.WHITE_CARD.length-1] = by;
				
				
				System.out.println(by);
				SerialPortManager.sendToPort(Main.serialport, config.WHITE_CARD);
				Thread.sleep(500);
			}
			else//老卡
			{
				Common.TOOLS.return_object(config.READ_CARD_TEXT_OLD);
			}
		}
		 catch (SendDataToSerialPortFailure e) {
				e.printStackTrace();
			} catch (SerialPortOutputStreamCloseFailure e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
	}
	/**
	 * 写卡
	 * 
	 */
	public void white_card()
	{
		try {
			//解析新卡 读取卡号
			Main.sendData("10");
			Thread.sleep(300);
			byte by =  MyUtils.HexString2Bytes(getBCC(config.WHITE_CARD))[0];
			config.WHITE_CARD[config.WHITE_CARD.length-1] = by;
			System.out.println(by);
			SerialPortManager.sendToPort(Main.serialport, config.WHITE_CARD);
			Thread.sleep(500);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 读卡3
	 * @throws InterruptedException 
	 */
	public String read_card_three() throws InterruptedException
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
		int a = 0;
		while(true)
		{
			
			if(!config.BOOL)
			{
				if(a<5)
				{
					return config.READ_CARD_TEXT;
				}
				a++;
				Thread.sleep(200);
			}
			else
			{
//				int news = Common.TOOLS.new_old_card();
//				if(news == 0 )//新卡
//				{
//					//1、新卡判断卡位置
//				}
//				else//老卡
//				{
//					//老卡查询数据库
//				}
				for (Byte by : config.READ_CARD) {
					sb.append(by+"&");
				}
				return sb.toString();
			}
		}
	}
	/**
	 * 读卡2
	 * @throws InterruptedException 
	 */
	public int read_card_two() throws InterruptedException
	{
		try {
			Main.sendData("9");
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			
		}
		
		int a = 0;
		while(true)
		{
			
			if(!config.BOOL)
			{
				if(a<5)
				{
					return 2;
				}
				a++;
				Thread.sleep(200);
			}
			else
			{
//				int news = Common.TOOLS.new_old_card();
//				if(news == 0 )//新卡
//				{
//					//1、新卡判断卡位置
//				}
//				else//老卡
//				{
//					//老卡查询数据库
//				}
////				for (Byte by : config.READ_CARD) {
////					sb.append(by+"&");
////				}
				return Common.TOOLS.new_old_card();
			}
		}
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
