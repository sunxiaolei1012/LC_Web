package com.ziyi.dao;

import java.util.List;

import com.ziyi.pojo.Users;

/**
 * 用户表接口
 * @author 陈玉博
 * @date 2018年7月11日下午5:00:17
 */
public interface UsersDao {
	/**
	 * 根据用户名与密码查询用户
	 * @param name 用户名
	 * @param password 密码
	 * @return 用户对象
	 */
	public Users select_id_user(String name , String password);
	
	/**
	 * 根据id 修改用户信息
	 * @param user
	 * @return 成功与否
	 */
	public boolean update_user(Users user);
	
	
	
	public String select_id_name(Integer id);
	/**
	 * 查询全部员工信息
	 * @return
	 */
	public List<Users> select_show();
	
	
	/**
	 * 添加用互信息
	 * @param user
	 * @return
	 */
	public boolean insert_user(Users user);
	/**
	 * 根据用户名称查询用户
	 * @param name
	 * @return
	 */
	public Users select_name_user(String name);
	
	/**
	 * 根据用户id查询用户信息
	 */
	public Users select_id(int uid);
	
	/**
	 * 根据id 删除用户信息
	 * @param id
	 * @return
	 */
	public boolean del_user(int id);

}
