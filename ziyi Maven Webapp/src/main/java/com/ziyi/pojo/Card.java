package com.ziyi.pojo;
/**
 * 会员卡表
 * @author 陈玉博
 * @date 2018年7月11日下午4:47:39
 */
public class Card {

	private Integer cardid; //主键
	private Integer ctid;//卡类型id
	private String number;//编号
	private String name;//所属人
	private Integer phone;//所属手机
	private String address;//所属地址
	private String idcard;//身份证号码
	private Double price;//总金额
	private Double spend;//已消费金额
	private Double remain;//剩余金额
	private String selltime;//售卡时间
	private Integer status;//卡状态
	private Integer userid;//售卡人id
	public Integer getCardid() {
		return cardid;
	}
	public void setCardid(Integer cardid) {
		this.cardid = cardid;
	}
	public Integer getCtid() {
		return ctid;
	}
	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getSpend() {
		return spend;
	}
	public void setSpend(Double spend) {
		this.spend = spend;
	}
	public Double getRemain() {
		return remain;
	}
	public void setRemain(Double remain) {
		this.remain = remain;
	}
	public String getSelltime() {
		return selltime;
	}
	public void setSelltime(String selltime) {
		this.selltime = selltime;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "Card [cardid=" + cardid + ", ctid=" + ctid + ", number=" + number + ", name=" + name + ", phone="
				+ phone + ", address=" + address + ", idcard=" + idcard + ", price=" + price + ", spend=" + spend
				+ ", remain=" + remain + ", selltime=" + selltime + ", status=" + status + ", userid=" + userid + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((cardid == null) ? 0 : cardid.hashCode());
		result = prime * result + ((ctid == null) ? 0 : ctid.hashCode());
		result = prime * result + ((idcard == null) ? 0 : idcard.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((remain == null) ? 0 : remain.hashCode());
		result = prime * result + ((selltime == null) ? 0 : selltime.hashCode());
		result = prime * result + ((spend == null) ? 0 : spend.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Card other = (Card) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (cardid == null) {
			if (other.cardid != null)
				return false;
		} else if (!cardid.equals(other.cardid))
			return false;
		if (ctid == null) {
			if (other.ctid != null)
				return false;
		} else if (!ctid.equals(other.ctid))
			return false;
		if (idcard == null) {
			if (other.idcard != null)
				return false;
		} else if (!idcard.equals(other.idcard))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (remain == null) {
			if (other.remain != null)
				return false;
		} else if (!remain.equals(other.remain))
			return false;
		if (selltime == null) {
			if (other.selltime != null)
				return false;
		} else if (!selltime.equals(other.selltime))
			return false;
		if (spend == null) {
			if (other.spend != null)
				return false;
		} else if (!spend.equals(other.spend))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}
	public Card(Integer ctid, String number, String name, Integer phone, String address, String idcard, Double price,
			Double spend, Double remain, String selltime, Integer status, Integer userid) {
		super();
		this.ctid = ctid;
		this.number = number;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.idcard = idcard;
		this.price = price;
		this.spend = spend;
		this.remain = remain;
		this.selltime = selltime;
		this.status = status;
		this.userid = userid;
	}
	public Card() {
		super();
	}
	
	
	
	
	
}
