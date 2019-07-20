package com.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.User;

public class UsersDao {
	//判断用户信息是否匹配(根据管理员账户与密码)
	public boolean isRight(User user){
		String username=user.getUsername();
		String password=user.getPassword();
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
			String sql="select username,password from user";  
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				String u=rs.getString("username");
				String p=rs.getString("password");
				if(u.equals(username)&&p.equals(password)) {
					stmt.close();
					con.close();
					return true; 
				}
			}	
		}catch (SQLException e){ 
			e.printStackTrace();
		}	
		return false;
	}
	//添加用户操作 :  true 表示添加成功   false 表示添加失败
	public boolean addUser(User user){
		String username=user.getUsername();
		String password=user.getPassword();
		String sex=user.getSex();
		String telephone=user.getTelephone();
		String email=user.getEmail();
		String img=user.getImg();
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
			String sql="insert into user set username='"+username+"', password='"+password+"',sex='"+sex+"',telephone='"+telephone+"',email='"+email+"',img='"+img+"'";  
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
	
	//删除用户操作(根据id) :  true 表示删除成功   false 表示删除失败
	public boolean deleteUser(int id) {
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
			String sql="delete from user where id='"+id+"'";  
			int result=stmt.executeUpdate(sql);
			if(result>0) {
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
	
	//修改用户信息操作(根据id及修改后的信息(不包含密码)) :  true 表示修改成功   false 表示修改失败
	public boolean updateUser(User user) {
		int id=user.getId();
		String username=user.getUsername();
		String sex=user.getSex();
		String telephone=user.getTelephone();
		String email=user.getEmail();
		String img=user.getImg();
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
			String sql="update user set username='"+username+"',sex='"+sex+"',telephone='"+telephone+"',email='"+email+"',img='"+img+"' where id='"+id+"'";  
			int result=stmt.executeUpdate(sql);
			if(result>0) {
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
	//修改用户密码操作(根据id) :  true 表示修改成功   false 表示修改失败
		public boolean updatePassword(User user) {
			int id=user.getId();
			String password=user.getPassword();
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
				String sql="update user set password='"+password+"' where id='"+id+"'";  
				int result=stmt.executeUpdate(sql);
				if(result>0) {
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
	
	//查询用户(根据id):
	public User selectUserById(int id) {
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
			String sql="select username,password,sex,telephone,email,img,honorScore from user where id='"+id+"'";  
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()) {
				String username=rs.getString("username");
				String password=rs.getString("password");
				String sex=rs.getString("sex");
				String telephone=rs.getString("telephone");
				String email=rs.getString("email");
				String img=rs.getString("img");
				int honorScore = rs.getInt("honorScore");
				User user=new User(id,username,password,sex,telephone,email,img,honorScore);
				stmt.close();
				con.close();
				return user;	
			}	
			else{
				stmt.close();
				con.close();
				return null;	
			}		
		}catch (SQLException e){ 
			e.printStackTrace();
			return null;
		}	
	}
	
	//查询用户(根据用户名):
		public User selectUserByName(String username) {
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
				String sql="select id,password,sex,telephone,email,img,honorScore from user where username='"+username+"'";  
				ResultSet rs=stmt.executeQuery(sql);
				if(rs.next()) {
					int id=rs.getInt("id");
					String password=rs.getString("password");
					String sex=rs.getString("sex");
					String telephone=rs.getString("telephone");
					String email=rs.getString("email");
					String img=rs.getString("img");
					int honorScore=rs.getInt("honorScore");
					User user=new User(id,username,password,sex,telephone,email,img,honorScore);
					stmt.close();
					con.close();
					return user;	
				}	
				else{
					stmt.close();
					con.close();
					return null;	
				}		
			}catch (SQLException e){ 
				e.printStackTrace();
				return null;
			}	
		}
	
	//判断用户是否存在(根据用户名)
	public boolean isExist(String username) {
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
			String sql="select username from user";  
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				String u=rs.getString("username");
				if(u.equals(username)) {
					stmt.close();
					con.close();
					return true; 
				}
			}	
		}catch (SQLException e){ 
			e.printStackTrace();
		}	
		return false;
	}
	
	
	//获取所有用户
	public ArrayList selectAllUser() {
		ArrayList userList=new ArrayList();
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
			String sql="select id,username,password,sex,telephone,email,img from user";  
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				int id=rs.getInt("id");
				String username=rs.getString("username");
				String password=rs.getString("password");
				String sex=rs.getString("sex");
				String telephone=rs.getString("telephone");
				String email=rs.getString("email");
				String img=rs.getString("img");
				userList.add(new User(username,password,sex,telephone,email,img));
			}
			stmt.close();
			con.close();
			return userList;		
		}catch (SQLException e){ 
			e.printStackTrace();
			return null;
		}	
	}
	//根据id和积分数增添积分
	public boolean addHonorScoreById(int id,int Score) {
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
			String sql="update user set honorScore=honorScore+'"+Score+"' where id='"+id+"'";  
			int result=stmt.executeUpdate(sql);
			if(result>0) {
				return true;
			}
		}catch (SQLException e){ 
			e.printStackTrace();
		}	
		return false;
	}
}
