package com.ziyi.pojo;

public class MonthPrice {
	private Integer month;
	private Double monthPrice;
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public Double getMonthPrice() {
		return monthPrice;
	}
	public void setMonthPrice(Double monthPrice) {
		this.monthPrice = monthPrice;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((month == null) ? 0 : month.hashCode());
		result = prime * result + ((monthPrice == null) ? 0 : monthPrice.hashCode());
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
		MonthPrice other = (MonthPrice) obj;
		if (month == null) {
			if (other.month != null)
				return false;
		} else if (!month.equals(other.month))
			return false;
		if (monthPrice == null) {
			if (other.monthPrice != null)
				return false;
		} else if (!monthPrice.equals(other.monthPrice))
			return false;
		return true;
	}
	public MonthPrice(Integer month, Double monthPrice) {
		super();
		this.month = month;
		this.monthPrice = monthPrice;
	}
	public MonthPrice() {
		super();
	}
	@Override
	public String toString() {
		return "MonthPrice [month=" + month + ", monthPrice=" + monthPrice + ", getMonth()=" + getMonth()
				+ ", getMonthPrice()=" + getMonthPrice() + ", hashCode()=" + hashCode() + ", getClass()=" + getClass()
				+ ", toString()=" + super.toString() + "]";
	}
	

}
