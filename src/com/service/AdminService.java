package com.service;

import com.dao.AdminsDao;
import com.dao.UsersDao;
import com.entity.User;
import com.entity.Admin;

public class AdminService {
	//��¼����
	public static boolean login(Admin admin) {
		AdminsDao adminsDao = new AdminsDao();
		return adminsDao.isRight(admin);
	}
}
