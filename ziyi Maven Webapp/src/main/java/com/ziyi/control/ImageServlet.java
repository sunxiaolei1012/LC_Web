package com.ziyi.control;

import java.util.List;

import com.cyb.util.Common;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.pojo.Selling_Image;

public class ImageServlet extends ActionSupport{

	private String id;
	
	public String selling()
	{
		//根据商品ID信息，查询商品图片信息
		List<Selling_Image> list = Common.SID.select_selling_image(new Integer(id));
		if(list != null)
		{
			ActionContext.getContext().put("image", list);
		}
		return "image";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
