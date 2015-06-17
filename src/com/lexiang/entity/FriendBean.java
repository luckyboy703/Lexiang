package com.lexiang.entity;

/**
* 封装好友信息的类
* @author zhangyunhao
*/

public class FriendBean {
	private int id = -1;
	private String name = "";
	private String sex = "";
	private String address = "";
	private String instrument = "";
	private String username = "";
	private int uid = -1;
	
	public int getId(){
		return id;
	}
	
	public boolean setId(int id) {
		if(id!=0){
			this.id = id;
			return true;
		}
		else
			return false;
	}
	
	public String getName() {
		return name;
	}
	
	public boolean setName(String nam) {
		if(!nam.isEmpty()){
			name = nam;
			return true;
		}
		else
			return false;
	}
	
	public String getSex() {
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
	
	public String getAddress() {
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
	
	public String getInstrument() {
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
	
	public String getUsername() {
		return username;
	}
	
	public boolean setUsername(String uname) {
		if(!uname.isEmpty()){
			username = uname;
			return true;
		}
		else
			return false;
	}
	
	public int getUid(){
		return uid;
	}
	
	public boolean setUid(int uid) {
		if(uid!=-1){
			this.uid = uid;
			return true;
		}
		else
			return false;
	}
}
