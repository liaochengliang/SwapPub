package com.service;

import java.util.ArrayList;

import com.dao.AppointsDao;

import com.entity.Appoint;


public class AppointsService {
	//Լ����ӹ���
	public static boolean addAppoints(Appoint appoint){
		AppointsDao appointsDao = new AppointsDao();
		return appointsDao.addAppoints(appoint);
	}
	//Լ���޸Ĺ���(����Լ��id�޸�Լ��״̬Ϊ1)
		public static boolean updateAppoints(int id,int sta){
			AppointsDao appointsDao = new AppointsDao();
			return appointsDao.updateAppoints(id,sta);
		}
	//��ȡ����Լ��
	public static ArrayList SelectAllAppoints(){
		AppointsDao appointsDao = new AppointsDao();
		return appointsDao.SelectAllAppoints();
	}
}
