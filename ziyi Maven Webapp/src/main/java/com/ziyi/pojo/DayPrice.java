package com.ziyi.pojo;

public class DayPrice {
	private Integer day;
	private Double dayPrice;
	private Integer month;
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public Double getDayPrice() {
		return dayPrice;
	}
	public void setDayPrice(Double dayPrice) {
		this.dayPrice = dayPrice;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((day == null) ? 0 : day.hashCode());
		result = prime * result + ((dayPrice == null) ? 0 : dayPrice.hashCode());
		result = prime * result + ((month == null) ? 0 : month.hashCode());
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
		DayPrice other = (DayPrice) obj;
		if (day == null) {
			if (other.day != null)
				return false;
		} else if (!day.equals(other.day))
			return false;
		if (dayPrice == null) {
			if (other.dayPrice != null)
				return false;
		} else if (!dayPrice.equals(other.dayPrice))
			return false;
		if (month == null) {
			if (other.month != null)
				return false;
		} else if (!month.equals(other.month))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "DayPrice [day=" + day + ", dayPrice=" + dayPrice + ", month=" + month + "]";
	}
	public DayPrice(Integer day, Double dayPrice, Integer month) {
		super();
		this.day = day;
		this.dayPrice = dayPrice;
		this.month = month;
	}
	public DayPrice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
