package com.lc.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.et.mvc.util.Json;
import com.lc.entity.Image;
import com.lc.entity.Word;
import com.lc.tool.AjaxResponse;
import com.lc.tool.Common;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;

public class WordContol extends ActionSupport{
	public Integer id;
	public String jspname;
	public String content;
	
	public Object upload;
	private String file ; 
	private String fileFileName ;  
	private List<String> fileContentType ; 
	
	

	public Object getUpload() {
		return upload;
	}

	public void setUpload(Object upload) {
		this.upload = upload;
	}

	

	

	

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getJspname() {
		return jspname;
	}

	public void setJspname(String jspname) {
		this.jspname = jspname;
	}
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String checkImage(){
			System.out.println("展示Image -------"+jspname);
			String path=ServletActionContext.getServletContext().getRealPath("/image");
			
			if(jspname!=null&&!jspname.equals("")){
				
				List<Image> list=Common.imagedao.check_image_jspname(jspname);
				System.out.println(list);
			
				ActionContext.getContext().put("list", list);
			}else {
				
				List<Image> list=Common.imagedao.check_AllImage();
				System.out.println(list);
				ActionContext.getContext().put("list", list);
			}
			
			
			
		
		return "checkImage";
	}
	
	public String checkJspName(){
			System.out.println("开始查询页面的文字------"+jspname);
		
			if(jspname!=null&&!jspname.equals("")){
				
				List<Word> list=Common.wd.check_WordByName(jspname);
				System.out.println(list);
				ActionContext.getContext().put("list", list);
			}else{
				System.out.println("jspname的值为空");
			List<Word> list=Common.wd.check_AllWord();
					System.out.println(list);
			ActionContext.getContext().put("list", list);
			}
			
		return "checkTest";
	}
	
	
	 public void jspContent() throws IOException{
		 System.out.println("ajax查询页面的文字------"+jspname);
			List<Word> list=Common.wd.check_WordByName(jspname);
			System.out.println(list);
		 HttpServletResponse response=ServletActionContext.getResponse();
		 response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out=response.getWriter();
			 String json=Json.toJson(list);
			
			out.print(json);
			out.flush();
			out.close();
		 
	 }
	 
	 public String changeContent(){
		 	System.out.println("查询 id为："+id+"的word内容");
		 	List<Word> list=Common.wd.check_WordById(id);
		 	System.out.println(list);
		 	
		 	ActionContext.getContext().put("list", list);
		 	
		 
		 return "changeContent";
	 }
	 
	 
	 public String updateContent(){
		 
		 
		 System.out.println("开始修改文本信息-----------");
		 	int a=Common.wd.updateContent(id, content);
		 	System.out.println("a的值："+a);
		 	
		 
		 
		 return "updateContent";
	 }
	 
					public void updateContentss() throws IOException{
							 
							 
							 System.out.println("开始修改文本信息s-----------");
							 	int a=Common.wd.updateContent(id, content);
							 	System.out.println("a的值："+a);
							 	
							 AjaxResponse.responseAjax(a);
							 
							 
						 }
			public void updateAddImage() throws IOException{
				 System.out.println(file);
				 
				 String filename= fileFileName;
				JSONObject 	personJSON = JSONObject.fromObject(upload);

		        System.out.println(personJSON);
					System.out.println(upload);
					
					 HttpServletResponse response=ServletActionContext.getResponse();
					 response.setContentType("text/html;charset=utf-8");
						response.setCharacterEncoding("UTF-8");
						PrintWriter out=response.getWriter();
						 String json=Json.toJson("done");
						
						out.print(json);
						out.flush();
						out.close();
					 
				
			}
	 
}
