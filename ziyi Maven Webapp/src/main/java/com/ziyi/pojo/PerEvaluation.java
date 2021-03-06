package com.ziyi.pojo;

public class PerEvaluation {
	
	private Integer userid;
	private String  name;
	private Double pay_price;
	private String count;
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPay_price() {
		return pay_price;
	}
	public void setPay_price(Double pay_price) {
		this.pay_price = pay_price;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((count == null) ? 0 : count.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pay_price == null) ? 0 : pay_price.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
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
		PerEvaluation other = (PerEvaluation) obj;
		if (count == null) {
			if (other.count != null)
				return false;
		} else if (!count.equals(other.count))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pay_price == null) {
			if (other.pay_price != null)
				return false;
		} else if (!pay_price.equals(other.pay_price))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "PerEvaluation [userid=" + userid + ", name=" + name + ", pay_price=" + pay_price + ", count=" + count
				+ "]";
	}
	public PerEvaluation(Integer userid, String name, Double pay_price, String count) {
		super();
		this.userid = userid;
		this.name = name;
		this.pay_price = pay_price;
		this.count = count;
	}
	public PerEvaluation() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
