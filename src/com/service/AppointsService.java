package com.service;

import java.util.ArrayList;

import com.dao.AppointsDao;

import com.entity.Appoint;


public class AppointsService {
	//约定添加功能
	public static boolean addAppoints(Appoint appoint){
		AppointsDao appointsDao = new AppointsDao();
		return appointsDao.addAppoints(appoint);
	}
	//约定修改功能(根据约定id修改约定状态为1)
		public static boolean updateAppoints(int id,int sta){
			AppointsDao appointsDao = new AppointsDao();
			return appointsDao.updateAppoints(id,sta);
		}
	//获取所有约定
	public static ArrayList SelectAllAppoints(){
		AppointsDao appointsDao = new AppointsDao();
		return appointsDao.SelectAllAppoints();
	}
}
