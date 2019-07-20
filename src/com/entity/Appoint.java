package com.entity;

import java.sql.Date;

public class Appoint {
	int id;
	int user_id_1;
	int user_id_2;
	String address;
	Date date;
	int state;
	int good_id_1;
	int good_id_2;
	public int getGood_id_1() {
		return good_id_1;
	}
	public void setGood_id_1(int good_id_1) {
		this.good_id_1 = good_id_1;
	}
	public int getGood_id_2() {
		return good_id_2;
	}
	public void setGood_id_2(int good_id_2) {
		this.good_id_2 = good_id_2;
	}
	public Appoint() {
		
	}
	public Appoint(int id,int user_id_1, int user_id_2, int good_id_1,int good_id_2, int state) {
		super();
		this.id=id;
		this.user_id_1 = user_id_1;
		this.user_id_2 = user_id_2;
		this.state = state;
		this.good_id_1 = good_id_1;
		this.good_id_2 = good_id_2;
	}
	public Appoint(int user_id_1, int user_id_2, int good_id_1,int good_id_2, int state) {
		super();
		this.user_id_1 = user_id_1;
		this.user_id_2 = user_id_2;
		this.state = state;
		this.good_id_1 = good_id_1;
		this.good_id_2 = good_id_2;
	}
	public int getUser_id_1() {
		return user_id_1;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setUser_id_1(int user_id_1) {
		this.user_id_1 = user_id_1;
	}
	public int getUser_id_2() {
		return user_id_2;
	}
	public void setUser_id_2(int user_id_2) {
		this.user_id_2 = user_id_2;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
