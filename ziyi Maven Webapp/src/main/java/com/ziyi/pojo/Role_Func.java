package com.ziyi.pojo;
/**
 * 角色功能表
 * @author 陈玉博
 * @date 2018年7月12日下午2:50:18
 */
public class Role_Func {

	private Integer rfid;
	private Integer roleid;
	private Integer functionid;
	private Integer status;
	public Integer getRfid() {
		return rfid;
	}
	public void setRfid(Integer rfid) {
		this.rfid = rfid;
	}
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public Integer getFunctionid() {
		return functionid;
	}
	public void setFunctionid(Integer functionid) {
		this.functionid = functionid;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((functionid == null) ? 0 : functionid.hashCode());
		result = prime * result + ((rfid == null) ? 0 : rfid.hashCode());
		result = prime * result + ((roleid == null) ? 0 : roleid.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
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
		Role_Func other = (Role_Func) obj;
		if (functionid == null) {
			if (other.functionid != null)
				return false;
		} else if (!functionid.equals(other.functionid))
			return false;
		if (rfid == null) {
			if (other.rfid != null)
				return false;
		} else if (!rfid.equals(other.rfid))
			return false;
		if (roleid == null) {
			if (other.roleid != null)
				return false;
		} else if (!roleid.equals(other.roleid))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Role_Func [rfid=" + rfid + ", roleid=" + roleid + ", functionid=" + functionid + ", status=" + status
				+ "]";
	}
	public Role_Func(Integer roleid, Integer functionid, Integer status) {
		super();
		this.roleid = roleid;
		this.functionid = functionid;
		this.status = status;
	}
	public Role_Func() {
		super();
	}
	
	
}
