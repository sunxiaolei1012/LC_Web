package com.ziyi.pojo;
/**
 * 订单详情表
 * @author 陈玉博
 * @date 2018年7月11日下午4:58:32
 */
public class Order_list {

	private Integer id;
	private Integer orderid;
	private Integer sellingid;
	private Integer number;
	private Integer state;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public Integer getSellingid() {
		return sellingid;
	}
	public void setSellingid(Integer sellingid) {
		this.sellingid = sellingid;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + ((sellingid == null) ? 0 : sellingid.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
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
		Order_list other = (Order_list) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
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
		if (sellingid == null) {
			if (other.sellingid != null)
				return false;
		} else if (!sellingid.equals(other.sellingid))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		return true;
	}
	public Order_list(Integer orderid, Integer sellingid, Integer number, Integer state) {
		super();
		this.orderid = orderid;
		this.sellingid = sellingid;
		this.number = number;
		this.state = state;
	}
	public Order_list() {
		super();
	}
	@Override
	public String toString() {
		return "Order_list [id=" + id + ", orderid=" + orderid + ", sellingid=" + sellingid + ", number=" + number
				+ ", state=" + state + "]";
	}
	
	
}
