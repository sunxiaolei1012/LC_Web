package com.ziyi.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.cyb.util.Common;
import com.cyb.util.Gsons;
import com.cyb.util.Tools;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Selling_Image;

public class ImageServlet extends ActionSupport{

	private String id;
	private String url;
	private String imageid;
	
	private List<File> file ; 
	private List<String> fileFileName ;  
	private List<String> fileContentType ; 
	
	public String del()
	{
		Map<String , Object> map = new HashMap<String , Object>();
		//根据图片ID删除图片
		boolean bool = Common.SID.del_image(new Integer(imageid));
		if(bool)
		{
			String path = ServletActionContext.getRequest().getRealPath("/upload"); 
			try{
				Tools.delFile(path+"\\"+url);
			}
			catch (Exception e) {
			}
		}
		return selling();
	}
	
	
	public String selling()
	{
		//根据商品ID信息，查询商品图片信息
		List<Selling_Image> list = Common.SID.select_selling_images(new Integer(id));
		if(list != null)
		{
			ActionContext.getContext().put("image", list);
			ActionContext.getContext().put("id",id);
		}
		return "image";
	}
	public String image() throws IOException
	{
		Map<String , Object> map = new HashMap<String , Object>();
		if(file!=null)
		{
		String path = ServletActionContext.getRequest().getRealPath("/upload");  
	        for(int i = 0 ; i < file.size() ; i++ )  
	        {  
	        	String file_name = Common.TOOLS.getRandomFileName()+"."+Common.TOOLS.ext(fileFileName.get(i));
	            OutputStream os = new FileOutputStream(new File(path,file_name));  
	              System.out.println(fileContentType.get(i));
	            InputStream is = new FileInputStream(file.get(i));  
	             
	            byte[] buf = new byte[1024];  
	            int length = 0 ;  
	              
	            while(-1 != (length = is.read(buf) ) )  
	            {  
	                os.write(buf, 0, length) ;  
	            } 
	            is.close();  
	            os.close();  
	            //添加图片信息
	            Common.SID.insert_selling_image(new Integer(id), file_name);
	            map.put("state", true);
	            map.put("msg", "上传成功");
	        } 
		}
		else
		{
			 map.put("state", false);
	            map.put("msg", "上传失败");
		}
		Common.TOOLS.return_object(Gsons.tojson(map));
		return "json";
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public List<File> getFile() {
		return file;
	}
	public void setFile(List<File> file) {
		this.file = file;
	}
	public List<String> getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	public List<String> getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}


	

	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getImageid() {
		return imageid;
	}


	public void setImageid(String imageid) {
		this.imageid = imageid;
	}
	
	
}
