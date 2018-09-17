package com.ziyi.pojo;
/**
 * 商品图片表
 * 
 * @author 陈玉博
 * @date 2018年7月27日上午4:13:56
 */
public class Selling_Image {
	
	private Integer id;
	private Integer sellingid;
	private String url;
	private String time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSellingid() {
		return sellingid;
	}
	public void setSellingid(Integer sellingid) {
		this.sellingid = sellingid;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((sellingid == null) ? 0 : sellingid.hashCode());
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Selling_Image other = (Selling_Image) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (sellingid == null) {
			if (other.sellingid != null)
				return false;
		} else if (!sellingid.equals(other.sellingid))
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Selling_Image [id=" + id + ", sellingid=" + sellingid + ", url=" + url + ", time=" + time + "]";
	}
	
	
}
