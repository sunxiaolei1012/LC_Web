package com.ziyi.pojo;

public class PayTypePriceDay {
	private Integer type;
	
	private Double price;
	private Integer day;
	private  Integer month;
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
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	@Override
	public String toString() {
		return "PayTypePriceDay [type=" + type + ", price=" + price + ", day=" + day + ", month=" + month + "]";
	}
	
}
