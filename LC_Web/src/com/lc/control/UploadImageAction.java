package com.lc.control;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.lc.tool.AjaxResponse;
import com.lc.tool.Common;
import com.opensymphony.xwork2.ActionSupport;

public class UploadImageAction extends  ActionSupport {
	
		private List<File> upload; 
		private  List<String> contentType;
	
		private List<String> uploadFileName;
		private String result;
	    private int id;//图片id
	


	
	


		public void  delImage() throws IOException{
			int a =Common.imagedao.del_image_id(id);
			System.out.println(a);
			
			 AjaxResponse.responseAjax(a);
			
			
			
			
		} 
		
		

	public String image() throws Exception {
		System.out.println("111111111");
		String path=ServletActionContext.getServletContext().getRealPath("/image");
		File file=new File(path);
		System.out.println(path);
		System.out.println(file);
		
		
		
		if(!file.exists()){
			
			file.mkdir();
		}
		for(int i=0;i<upload.size();i++){
			Date now = new Date(); 
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");//可以方便地修改日期格式
			
			
				String name="logo";
				String jspname="index";
				
				Random random = new Random();
				 
				int rannum = (int) (random.nextDouble() * (9999 - 1000 + 1)) + 1000;// 获取4位随机数
				String route = dateFormat.format(now)+rannum+".jpg"; 
				System.out.println(route);
			int a =Common.imagedao.insertImage(name, route, jspname);
			System.out.println(a);
			FileUtils.copyFile(upload.get(i), new File(file,route));
		}
		
	
		result="上传成功";
		return "image";
	}
		
	public List<File> getUpload() {
		return upload;
	}






	public void setUpload(List<File> upload) {
		this.upload = upload;
	}






	public List<String> getContentType() {
		return contentType;
	}






	public void setContentType(List<String> contentType) {
		this.contentType = contentType;
	}






	public List<String> getUploadFileName() {
		return uploadFileName;
	}






	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}






	public String getResult() {
		return result;
	}






	public void setResult(String result) {
		this.result = result;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}


}
