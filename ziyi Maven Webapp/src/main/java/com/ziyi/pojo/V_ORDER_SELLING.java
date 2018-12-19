package com.ziyi.pojo;
/**
 * 视图 根据订单 查询订单下商品信息
 * @author 陈玉博
 * @date 2018年11月20日上午9:36:26
 */
public class V_ORDER_SELLING {

	private String onumber;
	private String checkouttime;
	private Double price;
	private Double pay_price;
	private Integer type;
	private Integer olnumber;
	private String name;
	private String housename;
	private Double pri;
	
	public String getOnumber() {
		return onumber;
	}
	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}
	public String getCheckouttime() {
		return checkouttime;
	}
	public void setCheckouttime(String checkouttime) {
		this.checkouttime = checkouttime;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getPay_price() {
		return pay_price;
	}
	public void setPay_price(Double pay_price) {
		this.pay_price = pay_price;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getOlnumber() {
		return olnumber;
	}
	public void setOlnumber(Integer olnumber) {
		this.olnumber = olnumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHousename() {
		return housename;
	}
	public void setHousename(String housename) {
		this.housename = housename;
	}
	public Double getPri() {
		return pri;
	}
	public void setPri(Double pri) {
		this.pri = pri;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((checkouttime == null) ? 0 : checkouttime.hashCode());
		result = prime * result + ((housename == null) ? 0 : housename.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((olnumber == null) ? 0 : olnumber.hashCode());
		result = prime * result + ((onumber == null) ? 0 : onumber.hashCode());
		result = prime * result + ((pay_price == null) ? 0 : pay_price.hashCode());
		result = prime * result + ((pri == null) ? 0 : pri.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		V_ORDER_SELLING other = (V_ORDER_SELLING) obj;
		if (checkouttime == null) {
			if (other.checkouttime != null)
				return false;
		} else if (!checkouttime.equals(other.checkouttime))
			return false;
		if (housename == null) {
			if (other.housename != null)
				return false;
		} else if (!housename.equals(other.housename))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (olnumber == null) {
			if (other.olnumber != null)
				return false;
		} else if (!olnumber.equals(other.olnumber))
			return false;
		if (onumber == null) {
			if (other.onumber != null)
				return false;
		} else if (!onumber.equals(other.onumber))
			return false;
		if (pay_price == null) {
			if (other.pay_price != null)
				return false;
		} else if (!pay_price.equals(other.pay_price))
			return false;
		if (pri == null) {
			if (other.pri != null)
				return false;
		} else if (!pri.equals(other.pri))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		return true;
	}
	

	public V_ORDER_SELLING() {
		super();
		// TODO Auto-generated constructor stub
	}
	public V_ORDER_SELLING(String onumber, String checkouttime, Double price, Double pay_price, Integer type,
			Integer olnumber, String name, String housename, Double pri) {
		super();
		this.onumber = onumber;
		this.checkouttime = checkouttime;
		this.price = price;
		this.pay_price = pay_price;
		this.type = type;
		this.olnumber = olnumber;
		this.name = name;
		this.housename = housename;
		this.pri = pri;
	}
	@Override
	public String toString() {
		return "V_ORDER_SELLING [onumber=" + onumber + ", checkouttime=" + checkouttime + ", price=" + price
				+ ", pay_price=" + pay_price + ", type=" + type + ", olnumber=" + olnumber + ", name=" + name
				+ ", housename=" + housename + ", pri=" + pri + "]";
	}

	
	
}
