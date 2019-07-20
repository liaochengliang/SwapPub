package com.service;

import com.dao.UsersDao;
import com.entity.User;

public class UserService{
	//ע�Ṧ��
	public static boolean registe(User user){
		UsersDao usersDao = new UsersDao();
		if(usersDao.isExist(user.getUsername())) {
			return false;
		}
		else {
			return usersDao.addUser(user);
		}
	}
	//��¼����
	public static User login(User user) {
		UsersDao usersDao = new UsersDao();
		if(usersDao.isRight(user)) {
			return usersDao.selectUserByName(user.getUsername());
		}
		return null;
	}
	//�޸��û���Ϣ
	public static User UpdateUser(User user) {
		UsersDao usersDao = new UsersDao();
		if(usersDao.updateUser(user)){
			return usersDao.selectUserById(user.getId());
		}
		return null;	
	}
	//�޸��û�����
	public static User UpdatePassword(User user) {
		UsersDao usersDao = new UsersDao();
		if(usersDao.updatePassword(user)){
			return usersDao.selectUserById(user.getId());
		}
		return null;	
	}
	//����id��ѯ�û�
	public static User selectUserById(int id){
		UsersDao usersDao = new UsersDao();
		return usersDao.selectUserById(id);	
	}
	//��ӻ���
	public static boolean addHonorScoreById(int id,int Score){
		UsersDao usersDao = new UsersDao();
		return usersDao.addHonorScoreById(id,Score);	
	}
	
}
