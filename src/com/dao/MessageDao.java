package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.Appoint;
import com.entity.Message;

public class MessageDao {
	//添加留言
	public boolean addMessage(Message message){		
		int mess_from_id = message.getMess_from_id();
		int mess_to_id = message.getMess_to_id();
		String mess_text = message.getMess_text();
		
		Statement stmt=null;
		Connection con=null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/swap_pub?user=root&password=root&characterEncoding=utf8";
		try {
			con=DriverManager.getConnection(url);
			stmt = con.createStatement();
			String sql="insert into message set mess_from_id='"+mess_from_id+"',mess_to_id='"+mess_to_id+"',mess_text='"+mess_text+"',mess_time=CURRENT_TIMESTAMP";  
			int result=stmt.executeUpdate(sql);
			if(result>0){
				stmt.close();
				con.close();
				return true;	
			}	
			else{
				stmt.close();
				con.close();
				return false;	
			}		
		}catch (SQLException e){ 
			e.printStackTrace();
			return false;
		}	
	}
	
	//获取所有留言
	public ArrayList selectAllMessage() {
		ArrayList messageList=new ArrayList();
		Statement stmt=null;
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/swap_pub?user=root&password=root&characterEncoding=utf8";
		try {
			con=DriverManager.getConnection(url);
			stmt = con.createStatement();
			String sql="select mess_id,mess_from_id,mess_to_id,mess_text,mess_time from message";  
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				int mess_id = rs.getInt("mess_id");
				int mess_from_id = rs.getInt("mess_from_id");
				int mess_to_id = rs.getInt("mess_to_id");
				String mess_text = rs.getString("mess_text");
				Date mess_time = rs.getDate("mess_time");
				messageList.add(new Message(mess_id,mess_from_id,mess_to_id,mess_text,mess_time));
			}
			stmt.close();
			con.close();
			return messageList;		
		}catch (SQLException e){ 
			e.printStackTrace();
			return null;
		}	
	}
}
