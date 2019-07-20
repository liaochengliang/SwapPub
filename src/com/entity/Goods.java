package com.entity;

import java.sql.Date;

public class Goods {
	private int id;
	private int belong_user;
	private String goodName;
	private int hs_consumption;
	private String g_img;
	private String description;
	private int s_category;
	private int g_category;
	private Date date;
	
	public Goods(int id, int belong_user, String goodName, int hs_consumption, String g_img, String description,
			int s_category, int g_category, Date date) {
		super();
		this.id = id;
		this.belong_user = belong_user;
		this.goodName = goodName;
		this.hs_consumption = hs_consumption;
		this.g_img = g_img;
		this.description = description;
		this.s_category = s_category;
		this.g_category = g_category;
		this.date = date;
	}
	public Goods(int belong_user, String goodName, int hs_consumption, String g_img, String description, int s_category,
			int g_category, Date date) {
		super();
		this.belong_user = belong_user;
		this.goodName = goodName;
		this.hs_consumption = hs_consumption;
		this.g_img = g_img;
		this.description = description;
		this.s_category = s_category;
		this.g_category = g_category;
		this.setDate(date);
	}
	public Goods() {
		
	}
	public Goods(int id, int belong_user, String goodName, int hs_consumption, String g_img, String description,
			int s_category, int g_category) {
		super();
		this.id = id;
		this.belong_user = belong_user;
		this.goodName = goodName;
		this.hs_consumption = hs_consumption;
		this.g_img = g_img;
		this.description = description;
		this.s_category = s_category;
		this.g_category = g_category;
	}
	public Goods(int belong_user, String goodName, int hs_consumption, String g_img, String description,
			int s_category, int g_category) {
		super();
		this.belong_user = belong_user;
		this.goodName = goodName;
		this.hs_consumption = hs_consumption;
		this.g_img = g_img;
		this.description = description;
		this.s_category = s_category;
		this.g_category = g_category;
	}
	public String getType(int flag){
		if(flag == 1) {
			return "书籍";
		}
		if(flag == 2) {
			return "家用品";
		}
		if(flag == 3) {
			return "箱包";
		}
		if(flag == 4) {
			return "电子产品";
		}
		if(flag == 5) {
			return "运动用品";
		}
		return null;
	}
	public String getSwapType(){
		if(this.s_category  == 1) {
			return "交换";
		}
		if(this.s_category  == 2) {
			return "赠送";
		}
		if(this.s_category == 3) {
			return "积分兑换";
		}
		if(this.s_category == 4) {
			return "购买";
		}
		return null;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBelong_user() {
		return belong_user;
	}
	public void setBelong_user(int belong_user) {
		this.belong_user = belong_user;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public int getHs_consumption() {
		return hs_consumption;
	}
	public void setHs_consumption(int hs_consumption) {
		this.hs_consumption = hs_consumption;
	}
	public String getG_img() {
		return g_img;
	}
	public void setG_img(String g_img) {
		this.g_img = g_img;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getS_category() {
		return s_category;
	}
	public void setS_category(int s_category) {
		this.s_category = s_category;
	}
	public int getG_category() {
		return g_category;
	}
	public void setG_category(int g_category) {
		this.g_category = g_category;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}	
}
