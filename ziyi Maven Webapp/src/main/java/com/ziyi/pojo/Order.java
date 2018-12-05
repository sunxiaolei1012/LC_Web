package com.ziyi.pojo;
/**
 * 订单表
 * @author 陈玉博
 * @date 2018年9月12日下午1:51:15
 */
public class Order {

	private Integer orderid;//订单ID
	private String number;//订单编号
	private String ordertime;//订单时间
	private Double price;//价钱
	private Integer userid;//下单userID
	private Integer status;//订单装填
	private Integer type;//交易类型
	private String checkouttime;//结账时间
	private Double pay_price;//实付金额
	private Integer cardid;//会员卡id
	private Integer houseid;//房屋ID
	private Integer accountuserid;//结账userid
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getCheckouttime() {
		return checkouttime;
	}
	public void setCheckouttime(String checkouttime) {
		this.checkouttime = checkouttime;
	}
	public Double getPay_price() {
		return pay_price;
	}
	public void setPay_price(Double pay_price) {
		this.pay_price = pay_price;
	}
	public Integer getCardid() {
		return cardid;
	}
	public void setCardid(Integer cardid) {
		this.cardid = cardid;
	}
	public Integer getHouseid() {
		return houseid;
	}
	public void setHouseid(Integer houseid) {
		this.houseid = houseid;
	}
	public Integer getAccountuserid() {
		return accountuserid;
	}
	public void setAccountuserid(Integer accountuserid) {
		this.accountuserid = accountuserid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accountuserid == null) ? 0 : accountuserid.hashCode());
		result = prime * result + ((cardid == null) ? 0 : cardid.hashCode());
		result = prime * result + ((checkouttime == null) ? 0 : checkouttime.hashCode());
		result = prime * result + ((houseid == null) ? 0 : houseid.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + ((ordertime == null) ? 0 : ordertime.hashCode());
		result = prime * result + ((pay_price == null) ? 0 : pay_price.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		Order other = (Order) obj;
		if (accountuserid == null) {
			if (other.accountuserid != null)
				return false;
		} else if (!accountuserid.equals(other.accountuserid))
			return false;
		if (cardid == null) {
			if (other.cardid != null)
				return false;
		} else if (!cardid.equals(other.cardid))
			return false;
		if (checkouttime == null) {
			if (other.checkouttime != null)
				return false;
		} else if (!checkouttime.equals(other.checkouttime))
			return false;
		if (houseid == null) {
			if (other.houseid != null)
				return false;
		} else if (!houseid.equals(other.houseid))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		if (orderid == null) {
			if (other.orderid != null)
				return false;
		} else if (!orderid.equals(other.orderid))
			return false;
		if (ordertime == null) {
			if (other.ordertime != null)
				return false;
		} else if (!ordertime.equals(other.ordertime))
			return false;
		if (pay_price == null) {
			if (other.pay_price != null)
				return false;
		} else if (!pay_price.equals(other.pay_price))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
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
		return "Order [orderid=" + orderid + ", number=" + number + ", ordertime=" + ordertime + ", price=" + price
				+ ", userid=" + userid + ", status=" + status + ", type=" + type + ", checkouttime=" + checkouttime
				+ ", pay_price=" + pay_price + ", cardid=" + cardid + ", houseid=" + houseid + ", accountuserid="
				+ accountuserid + "]";
	}
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(Integer orderid, String number, String ordertime, Double price, Integer userid, Integer status,
			Integer type, String checkouttime, Double pay_price, Integer cardid, Integer houseid,
			Integer accountuserid) {
		super();
		this.orderid = orderid;
		this.number = number;
		this.ordertime = ordertime;
		this.price = price;
		this.userid = userid;
		this.status = status;
		this.type = type;
		this.checkouttime = checkouttime;
		this.pay_price = pay_price;
		this.cardid = cardid;
		this.houseid = houseid;
		this.accountuserid = accountuserid;
	}

	
	
	
}
