package com.service;

import com.dao.UsersDao;
import com.entity.User;

public class UserService{
	//注册功能
	public static boolean registe(User user){
		UsersDao usersDao = new UsersDao();
		if(usersDao.isExist(user.getUsername())) {
			return false;
		}
		else {
			return usersDao.addUser(user);
		}
	}
	//登录功能
	public static User login(User user) {
		UsersDao usersDao = new UsersDao();
		if(usersDao.isRight(user)) {
			return usersDao.selectUserByName(user.getUsername());
		}
		return null;
	}
	//修改用户信息
	public static User UpdateUser(User user) {
		UsersDao usersDao = new UsersDao();
		if(usersDao.updateUser(user)){
			return usersDao.selectUserById(user.getId());
		}
		return null;	
	}
	//修改用户密码
	public static User UpdatePassword(User user) {
		UsersDao usersDao = new UsersDao();
		if(usersDao.updatePassword(user)){
			return usersDao.selectUserById(user.getId());
		}
		return null;	
	}
	//根据id查询用户
	public static User selectUserById(int id){
		UsersDao usersDao = new UsersDao();
		return usersDao.selectUserById(id);	
	}
	//添加积分
	public static boolean addHonorScoreById(int id,int Score){
		UsersDao usersDao = new UsersDao();
		return usersDao.addHonorScoreById(id,Score);	
	}
	
}
