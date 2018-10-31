package com.ziyi.pojo;

public class PayTypePriceMonth {
	private Integer type;
	private Double price;
	private Integer month;
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "PayTypePriceMonth [type=" + type + ", price=" + price + ", month=" + month + "]";
	}
	
}
