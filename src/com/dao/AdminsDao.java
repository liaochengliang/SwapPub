package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.entity.Admin;
public class AdminsDao {
	//�жϹ���Ա��Ϣ�Ƿ�ƥ��(���ݹ���Ա�˻�������)
		public boolean isRight(Admin admin){
			String adminName=admin.getAdminName();
			String password=admin.getPassword();
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
				String sql="select adminName,password from admin";  
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()) {
					String a=rs.getString("adminName");
					String p=rs.getString("password");
					if(a.equals(adminName)&&p.equals(password)) {
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
		//�޸Ĺ���Ա��Ϣ(����id���޸ĺ����Ϣ) :  true ��ʾ�޸ĳɹ�   false ��ʾ�޸�ʧ��
		public boolean updateAdmin(Admin admin) {
			int id = admin.getId();
			String adminName=admin.getAdminName();
			String password=admin.getPassword();
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
				String sql="update user set adminName='"+adminName+"', password='"+password+"' where id='"+id+"'";  
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
}
