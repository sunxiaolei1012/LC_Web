package com.ziyi.pojo;
/**
 * 角色表
 * @author 陈玉博
 * @date 2018年7月12日下午2:48:42
 */
public class Role {

	
	private Integer roleid;
	private String name;
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((roleid == null) ? 0 : roleid.hashCode());
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
		Role other = (Role) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (roleid == null) {
			if (other.roleid != null)
				return false;
		} else if (!roleid.equals(other.roleid))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Role [roleid=" + roleid + ", name=" + name + "]";
	}
	public Role(String name) {
		super();
		this.name = name;
	}
	public Role() {
		super();
	}
	
}
