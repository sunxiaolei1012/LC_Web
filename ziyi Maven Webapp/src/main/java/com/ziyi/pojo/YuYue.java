package com.ziyi.pojo;
/**
 * 预约表
 * @author 陈玉博
 * @date 2018年10月15日下午2:15:07
 */
public class YuYue {

	private Integer id;
	private String name;
	private String phone;
	private String time;
	private Integer state;
	private Integer tid;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	@Override
	public String toString() {
		return "YuYue [id=" + id + ", name=" + name + ", phone=" + phone + ", time=" + time + ", state=" + state
				+ ", tid=" + tid + "]";
	}
	public YuYue(String name, String phone, String time, Integer state, Integer tid) {
		super();
		this.name = name;
		this.phone = phone;
		this.time = time;
		this.state = state;
		this.tid = tid;
	}
	public YuYue() {
		super();
	}
	
	
}
