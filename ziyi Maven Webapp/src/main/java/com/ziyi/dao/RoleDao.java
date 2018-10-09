package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Role;

/**
 * 角色接口表
 * @author 陈玉博
 * @date 2018年10月9日下午1:51:26
 */
public interface RoleDao {

	/**
	 * 查询全部角色信息
	 * @return
	 */
	public List<Role> showRole();
	
}
