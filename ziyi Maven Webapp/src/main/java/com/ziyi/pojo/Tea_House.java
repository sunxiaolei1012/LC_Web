package com.ziyi.pojo;
/**
 * 茶室房屋布置表
 * @author 陈玉博
 * @date 2018年7月11日下午4:55:11
 */
public class Tea_House {

	
	private Integer houseid;
	private String housename;
	private Integer status;
	public Integer getHouseid() {
		return houseid;
	}
	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}
	public String getHousename() {
		return housename;
	}
	public void setHousename(String housename) {
		this.housename = housename;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((houseid == null) ? 0 : houseid.hashCode());
		result = prime * result + ((housename == null) ? 0 : housename.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Tea_House other = (Tea_House) obj;
		if (houseid == null) {
			if (other.houseid != null)
				return false;
		} else if (!houseid.equals(other.houseid))
			return false;
		if (housename == null) {
			if (other.housename != null)
				return false;
		} else if (!housename.equals(other.housename))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	public String toString() {
		return "Tea_House [houseid=" + houseid + ", housename=" + housename + ", status=" + status + "]";
	}
	public Tea_House(String housename, Integer status) {
		super();
		this.housename = housename;
		this.status = status;
	}
	public Tea_House() {
		super();
	}
	
	
}
