package com.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.dao.MessageDao;
import com.dao.UsersDao;
import com.entity.Goods;
import com.entity.Message;

public class MessageService {
	//�������
	public static boolean addMessage(Message message){
		MessageDao messageDao = new MessageDao();
		return messageDao.addMessage(message);
	}
	//��ȡ��������
	public static ArrayList selectAllMessage(){
		MessageDao messageDao = new MessageDao();
		return messageDao.selectAllMessage();
	}
	

}
