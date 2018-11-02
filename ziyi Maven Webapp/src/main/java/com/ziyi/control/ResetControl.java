package com.ziyi.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.opensymphony.xwork2.ActionSupport;
import com.port.main.Main;

public class ResetControl extends ActionSupport{

	
	public String di()
	{
		Main.sendData("5");
		return "json";
	}
	
	public String reset()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		try {
			Common.pros.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
			 System.out.println(Common.pros.getProperty("com"));
			 Main.openSerialPort(Common.pros.getProperty("com"));
			 Main.chen();
			 try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 Main.sendData("5");
			 map.put("status", true);
			 map.put("msg", "启动成功");
		} catch (IOException e) {
			 map.put("status", false);
			 map.put("msg", "启动失败");
		}
		Common.TOOLS.return_object(Gsons.tojson(map));
		return "json";
	}
	
}
