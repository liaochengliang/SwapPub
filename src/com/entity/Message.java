package com.entity;

import java.sql.Date;

public class Message {
	int mess_id;
	int mess_from_id;
	int mess_to_id;
	String mess_text;
	Date mess_time;
	public Message(int mess_id, int mess_from_id, int mess_to_id, String mess_text, Date mess_time) {
		super();
		this.mess_id = mess_id;
		this.mess_from_id = mess_from_id;
		this.mess_to_id = mess_to_id;
		this.mess_text = mess_text;
		this.mess_time = mess_time;
	}
	public Message(int mess_from_id, int mess_to_id, String mess_text) {
		super();	
		this.mess_from_id = mess_from_id;
		this.mess_to_id = mess_to_id;
		this.mess_text = mess_text;
	}
	public int getMess_id() {
		return mess_id;
	}
	public void setMess_id(int mess_id) {
		this.mess_id = mess_id;
	}
	public int getMess_from_id() {
		return mess_from_id;
	}
	public void setMess_from_id(int mess_from_id) {
		this.mess_from_id = mess_from_id;
	}
	public int getMess_to_id() {
		return mess_to_id;
	}
	public void setMess_to_id(int mess_to_id) {
		this.mess_to_id = mess_to_id;
	}
	public String getMess_text() {
		return mess_text;
	}
	public void setMess_text(String mess_text) {
		this.mess_text = mess_text;
	}
	public Date getMess_time() {
		return mess_time;
	}
	public void setMess_time(Date mess_time) {
		this.mess_time = mess_time;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

}
