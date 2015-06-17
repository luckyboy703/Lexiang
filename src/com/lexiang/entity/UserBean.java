package com.lexiang.entity;

/**
* 封装用户信息的类
* @author zhangyunhao
*/

public class UserBean {
	private int id = -1;
	private String name = "";
	private String password = "";
	private String email = "";
	private String address = "";
	private String sex = "";
	private String instrument = "";
	private String introduction = "";
	
	public int getId() {
		return id;
	}
	
	public boolean setId(int id) {
		if(id!=0){
			this.id=id;
			return true;
		}
		else 
			return false;
	}
	
	public String getName(){
		return name;
	}
	
	public boolean setName(String nam) {
		if(!nam.isEmpty()){
			name = nam;
			return true;
		}
		else 
			name = nam;
			return false;
	}
	
	public String getPassword(){
		return password;
	}
	
	public boolean setPassword(String pwd) {
		if(!pwd.isEmpty()){
			password = pwd;
			return true;
		}
		else
			return false;
	}
	
	public String getEmail(){
		return email;
	}
	
	public boolean setEmail(String email) {
		if(!email.isEmpty()){
			this.email = email;;
			return true;
		}
		else
			return false;
	}
	
	public String getAddress(){
		return address;
	}
	
	public boolean setAddress(String add) {
		if(!add.isEmpty()){
			address = add;
			return true;
		}
		else
			return false;
	}
	
	public String getSex(){
		return sex;
	}
	
	public boolean setSex(String sex) {
		if(!sex.isEmpty()){
			this.sex = sex;
			return true;
		}
		else
			return false;
	}
	
	public String getInstrument(){
		return instrument;
	}
	
	public boolean setInstrument(String ins) {
		if(!ins.isEmpty()){
			instrument = ins;
			return true;
		}
		else
			return false;
	}
	
	public String getIntroduction(){
		return introduction;
	}
	
	public boolean setIntroduction(String intro) {
		if(!intro.isEmpty()){
			introduction = intro;
			return true;
		}
		else
			return false;
	}
}
