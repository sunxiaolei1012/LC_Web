package com.ziyi.pojo;

public class KuCun {
	private Integer typeid;
	private Integer  number;
	public Integer getTypeid() {
		return typeid;
	}
	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "KunCun [typeid=" + typeid + ", number=" + number + "]";
	}
	public KuCun() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KuCun(Integer typeid, Integer number) {
		super();
		this.typeid = typeid;
		this.number = number;
	}
	
	
}
