package com.entity;

public class User {
	private int id;
	private String username;
	private String password;
	private String sex;
	private String telephone;
	private String email;
	private String img;
	private int honorScore;
	public User(int id, String username, String password, String sex, String telephone, String email, String img,
			int honorScore) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.telephone = telephone;
		this.email = email;
		this.img = img;
		this.setHonorScore(honorScore);
	}

	public User() {	
	}
	
	public User(String username, String password){
		super();
		this.username = username;
		this.password = password;
	}
	public User(int id,String username,String sex,String telephone,String email,String img) {
		super();
		this.id = id;
		this.username = username;
		this.sex = sex;
		this.telephone = telephone;
		this.email = email;
		this.img = img;
	}
	public User(int id,String username, String password, String sex, String telephone, String email, String img) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.telephone = telephone;
		this.email = email;
		this.img = img;
	}
	public User(String username, String password, String sex, String telephone, String email, String img) {
		super();
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.telephone = telephone;
		this.email = email;
		this.img = img;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	public int getHonorScore() {
		return honorScore;
	}

	public void setHonorScore(int honorScore) {
		this.honorScore = honorScore;
	}
	public String getHonorGrade() {
		if(this.honorScore<200) {
			return "普通会员";
		}else if(this.honorScore<500) {
			return "银牌会员";
		}else if(this.honorScore<1000) {
			return "金牌会员";
		}else{
			return "钻石会员";
		}
		
	}
}
