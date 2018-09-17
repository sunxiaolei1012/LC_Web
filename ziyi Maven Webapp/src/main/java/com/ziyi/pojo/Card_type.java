package com.ziyi.pojo;
/**
 * 卡类型表
 * @author 陈玉博
 * @date 2018年7月11日下午4:56:09
 */
public class Card_type {

	private Integer ctid;
	private String cardtype;
	private Double rebate;
	public Integer getCtid() {
		return ctid;
	}
	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public Double getRebate() {
		return rebate;
	}
	public void setRebate(Double rebate) {
		this.rebate = rebate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cardtype == null) ? 0 : cardtype.hashCode());
		result = prime * result + ((ctid == null) ? 0 : ctid.hashCode());
		result = prime * result + ((rebate == null) ? 0 : rebate.hashCode());
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
		Card_type other = (Card_type) obj;
		if (cardtype == null) {
			if (other.cardtype != null)
				return false;
		} else if (!cardtype.equals(other.cardtype))
			return false;
		if (ctid == null) {
			if (other.ctid != null)
				return false;
		} else if (!ctid.equals(other.ctid))
			return false;
		if (rebate == null) {
			if (other.rebate != null)
				return false;
		} else if (!rebate.equals(other.rebate))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Card_type [ctid=" + ctid + ", cardtype=" + cardtype + ", rebate=" + rebate + "]";
	}
	
	
}
