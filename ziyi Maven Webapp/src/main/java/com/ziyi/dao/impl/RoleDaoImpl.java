package com.ziyi.dao.impl;

import java.util.List;

import com.cyb.util.Common;
import com.ziyi.dao.RoleDao;
import com.ziyi.pojo.Role;

public class RoleDaoImpl implements RoleDao{

	public List<Role> showRole() {
		List<Role> list = Common.UTIL.query("select * from t_role", null, Role.class);
		if(null != list && list.size()>0)
			return list;
		return null;
	}

}
