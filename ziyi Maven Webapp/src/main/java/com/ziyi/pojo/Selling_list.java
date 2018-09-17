package com.ziyi.pojo;

import java.util.List;

/**
 * 物品表
 * @author 陈玉博
 * @date 2018年7月11日下午4:52:16
 */
public class Selling_list {

	private Integer sellingid;
	private String name;
	private Double price;
	private String unit;
	private Integer rebate;
	private Double proportion;
	private Integer userid;
	private String pycode;
	private Integer typeid;
	private String xiangxi;
	private Integer number;
	
	private List<Selling_Image> imgurl;
	public Integer getSellingid() {
		return sellingid;
	}

	public void setSellingid(Integer sellingid) {
		this.sellingid = sellingid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getRebate() {
		return rebate;
	}

	public void setRebate(Integer rebate) {
		this.rebate = rebate;
	}

	public Double getProportion() {
		return proportion;
	}

	public void setProportion(Double proportion) {
		this.proportion = proportion;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getPycode() {
		return pycode;
	}

	public void setPycode(String pycode) {
		this.pycode = pycode;
	}

	public Integer getTypeid() {
		return typeid;
	}

	public void setTypeid(Integer typeid) {
		this.typeid = typeid;
	}

	public String getXiangxi() {
		return xiangxi;
	}

	public void setXiangxi(String xiangxi) {
		this.xiangxi = xiangxi;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public List<Selling_Image> getImgurl() {
		return imgurl;
	}

	public void setImgurl(List<Selling_Image> imgurl) {
		this.imgurl = imgurl;
	}

	@Override
	public String toString() {
		return "Selling_list [sellingid=" + sellingid + ", name=" + name + ", price=" + price + ", unit=" + unit
				+ ", rebate=" + rebate + ", proportion=" + proportion + ", userid=" + userid + ", pycode=" + pycode
				+ ", typeid=" + typeid + ", xiangxi=" + xiangxi + ", number=" + number + ", imgurl=" + imgurl + "]";
	}

	
	
	
	
}
