package com.cyb.util;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

public class Gsons {
	static Gson gson = new Gson(); 
	/**
	 * json解析,返回json对象
	 */
	public static JsonObject jsonObject(String msg){
		 // 1.获得 解析者  
        JsonParser parser = new JsonParser();  
        // 2.获得 根节点元素  
        JsonElement element = parser.parse(msg);  
        // 3.根据 文档判断根节点属于 什么类型的 Gson节点对象  
        JsonObject root = element.getAsJsonObject();
        // 4.返回节点对象
        return root;
	}
	
	/**
	 * json解析，判断type，返回类型
	 */
	public static String TypeEnum(JsonObject root){
        
		JsonPrimitive flagJson = root.getAsJsonPrimitive("type");  
        
		return flagJson.getAsString(); 
	}
	public static String TypeEnum(JsonObject root,String string){
        
		JsonPrimitive flagJson = root.getAsJsonPrimitive(string);  
        
		return flagJson.getAsString(); 
	}
	/**
	 * json解析，判断cmd,返回类型
	 */
	public static String CmdEnum(JsonObject root){
        
		JsonPrimitive flagJson = root.getAsJsonPrimitive("cmd");  
        
		return flagJson.getAsString(); 
	}
	/**
	 * json解析，处理配置数据数据，
	 */
	public static String ConfigType(JsonObject root){
		
		return root.getAsJsonPrimitive("data").getAsString();
	}

	/**
	 * json解析，判断其data内的内容 返回json对象
	 */
	public static  JsonObject Socket_Data(JsonObject root){
		
		JsonObject data = root.getAsJsonObject("data");
		
		return data;
		
	}
	/**
	 * json解析，将Object对象转为json
	 * @param m
	 */
	  public static String tojson(Object m) {  
	        // 将对象编译成json  
	        Gson gson = new Gson();  
	        String result = gson.toJson(m);
			return result;  
	    }
	
	  /**
	   * json解析，获取传来的房间rid
	   */
	  public static String selectRoomId(JsonObject obj){
		  
			JsonPrimitive flagJson = obj.getAsJsonPrimitive("rid");  
	        
			return flagJson.getAsString(); 
	  }
	  /**
	   * json解析，获取程序传来的id
	   */
	  public static String select_loginx(JsonObject obj){
		  JsonPrimitive flagJson = obj.getAsJsonPrimitive("id");
		  return flagJson.getAsString();
	  }
	  
//	  
//	  /**
//		 * json解析，处理数据信息
//		 */
//		public static JianKong Socket_JianKong_Data(JsonObject msg){
//			
//			return gson.fromJson(msg.getAsJsonObject("data"),JianKong.class);
//		}
//		/**
//		* json解析，处理数据信息2
//		*/
//		public static JianKong2 Socket_JianKong_Data2(JsonObject msg){
//					
//			return gson.fromJson(msg.getAsJsonObject("data"),JianKong2.class);
//		}
//		/**
//		 * json解析，处理携带uuid的login信息
//		 */
//		public static Login Socket_JianKong_Login(JsonObject msg){
//			
//			return gson.fromJson(msg.getAsJsonObject("data"),Login.class);
//		}
//		/**
//		 * json解析，处理携带控制信息的control信息
//		 */
//		public static Controls Socket_JianKong_Control(JsonObject msg){
//			return gson.fromJson(msg.getAsJsonObject("data"), Controls.class);
//		}
//		/**
//		 * json解析，处理返回Object信息
//		 */
//		public static Object Socket_Cache(JsonObject msg){
//			return gson.fromJson(msg.getAsJsonObject("data"), Object.class);
//		}
//		/**
//		 * json解析，处理返回Login_User信息
//		 */
//		public static Login_User Socket_Login_User(JsonObject msg){
//			return gson.fromJson(msg.getAsJsonObject("data"), Login_User.class);
//		}
		
}
