package com.cyb.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.et.mvc.util.Json;

public class AjaxResponseJson {
	
	public static final void responseAjax(String json) throws IOException{
		
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.print(json);
		out.flush();
		out.close();
		
	}

}
