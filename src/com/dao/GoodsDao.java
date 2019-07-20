package com.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.Goods;

public class GoodsDao {
		//添加货品操作 :  true 表示添加成功   false 表示添加失败
		public boolean addGoods(Goods goods){
			int belong_user = goods.getBelong_user();
			String goodName = goods.getGoodName();
			int hs_consumption = goods.getHs_consumption();
			String g_img = goods.getG_img();
			String description = goods.getDescription();
			int s_category = goods.getS_category();
			int g_category = goods.getG_category();

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
				String sql="insert into goods set belong_user='"+belong_user+"',goodName='"+goodName+"',hs_consumption='"+hs_consumption+"',g_img='"+g_img+"',g_category='"+g_category+"',s_category='"+s_category+"',description='"+description+"',created_date=CURRENT_TIMESTAMP";  
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
		
		//删除货品操作(根据id) :  true 表示删除成功   false 表示删除失败
		public boolean deleteGoods(int id) {
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
				String sql="delete from goods where id='"+id+"'";  
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
		
		//修改货品操作(根据id及修改后的信息) :  true 表示修改成功   false 表示修改失败
		public boolean updateUser(Goods goods) {
			int id = goods.getId();
			int belong_user = goods.getBelong_user();
			String goodName = goods.getGoodName();
			int hs_consumption = goods.getHs_consumption();
			String g_img = goods.getG_img();
			String description = goods.getDescription();
			int s_category = goods.getS_category();
			int g_category = goods.getG_category();
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
				String sql="update from goods set id='"+id+"', belong_user='"+belong_user+"',goodName='"+goodName+"',hs_consumption='"+hs_consumption+"',g_img='"+g_img+"',g_category='"+g_category+"',s_category='"+s_category+"',description='"+g_category+"'";  
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
		
		//查询货品(根据id):
		public Goods selectGoods(int id) {
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
				String sql="select belong_user,goodName,hs_consumption,g_img,description,s_category,g_category,created_date from goods where id='"+id+"'";  
				ResultSet rs=stmt.executeQuery(sql);
				if(rs.next()) {
					int belong_user = rs.getInt("belong_user");
					String goodName = rs.getString("goodName");
					int hs_consumption = rs.getInt("hs_consumption");
					String g_img = rs.getString("g_img");
					String description = rs.getString("description");
					int s_category = rs.getInt("s_category");
					int g_category = rs.getInt("g_category");
					Date date = rs.getDate("created_date");
					Goods goods=new Goods(id,belong_user,goodName,hs_consumption,g_img,description,s_category,g_category,date);
					stmt.close();
					con.close();
					return goods;	
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

		
		//获取所有货品
		public ArrayList selectAllGoods() {
			ArrayList goodsList=new ArrayList();
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
				String sql="select id,belong_user,goodName,hs_consumption,g_img,description,s_category,g_category from goods";  
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					int id = rs.getInt("id");
					int belong_user = rs.getInt("belong_user");
					String goodName = rs.getString("goodName");
					int hs_consumption = rs.getInt("hs_consumption");
					String g_img = rs.getString("g_img");
					String description = rs.getString("description");
					int s_category = rs.getInt("s_category");
					int g_category = rs.getInt("g_category");
					goodsList.add(new Goods(id,belong_user,goodName,hs_consumption,g_img,description,s_category,g_category));
				}
				stmt.close();
				con.close();
				return goodsList;		
			}catch (SQLException e){ 
				e.printStackTrace();
				return null;
			}	
		}


}
