package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.Appoint;
import com.entity.Goods;


public class AppointsDao {
	//添加约定操作 :  true 表示添加成功   false 表示添加失败
	public boolean addAppoints(Appoint appoint){	
		
		int user_id_1 = appoint.getUser_id_1();
		int user_id_2 = appoint.getUser_id_2();	
		int state = appoint.getState();
		int good_id_1 = appoint.getGood_id_1();
		int good_id_2 = appoint.getGood_id_2();
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
			String sql="insert into appoint set user_id_1='"+user_id_1+"',user_id_2='"+user_id_2+"',good_id_1='"+good_id_1+"',good_id_2='"+good_id_2+"',state='"+state+"'";  
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
	//约定修改状态
	public boolean updateAppoints(int id,int sta) {
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
			String sql="update appoint set state='"+sta+"' where id='"+id+"'";  
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
	//获取约定
	public ArrayList SelectAllAppoints(){	
		
		ArrayList appointsList = new ArrayList();
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
			String sql="select id,user_id_1,user_id_2,state,good_id_1,good_id_2 from appoint";  
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				int id = rs.getInt("id");
				int user_id_1 = rs.getInt("user_id_1");
				int user_id_2 = rs.getInt("user_id_2");
				int state = rs.getInt("state");
				int good_id_1 = rs.getInt("good_id_1");
				int good_id_2 = rs.getInt("good_id_2");
				appointsList.add(new Appoint(id,user_id_1,user_id_2,good_id_1,good_id_2,state));
			}
			return appointsList;
		}catch (SQLException e){ 
			e.printStackTrace();
			return null;
		}	
	}
}
