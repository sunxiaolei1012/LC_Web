package com.ziyi.pojo;
/**
 * 功能表
 * @author 陈玉博
 * @date 2018年7月12日下午2:49:17
 */
public class Func {

	private Integer functionid;
	private String name;
	private Integer fatherid;
	public Integer getFunctionid() {
		return functionid;
	}
	public void setFunctionid(Integer functionid) {
		this.functionid = functionid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getFatherid() {
		return fatherid;
	}
	public void setFatherid(Integer fatherid) {
		this.fatherid = fatherid;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fatherid == null) ? 0 : fatherid.hashCode());
		result = prime * result + ((functionid == null) ? 0 : functionid.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Func other = (Func) obj;
		if (fatherid == null) {
			if (other.fatherid != null)
				return false;
		} else if (!fatherid.equals(other.fatherid))
			return false;
		if (functionid == null) {
			if (other.functionid != null)
				return false;
		} else if (!functionid.equals(other.functionid))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Func [functionid=" + functionid + ", name=" + name + ", fatherid=" + fatherid + "]";
	}
	public Func(String name, Integer fatherid) {
		super();
		this.name = name;
		this.fatherid = fatherid;
	}
	public Func() {
		super();
	}
	
}
