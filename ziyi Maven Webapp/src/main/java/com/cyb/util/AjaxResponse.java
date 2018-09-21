package com.cyb.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class AjaxResponse {
	
	public static final void responseAjax(int a) throws IOException{
		
		
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		out.print(a);
		out.flush();
		out.close();
		
	}

}
