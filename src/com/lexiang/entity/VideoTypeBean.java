package com.lexiang.entity;

/**
* 处理视频标签的类
* @author zhangyunhao
*/

public class VideoTypeBean {
	private int id = -1;
	private String name = "";
	private String info = "";
	
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
	
	public String getName(){
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
	
	public String getInfo(){
		return info;
	}
	
	public boolean setInfo(String inf) {
		if(!inf.isEmpty()){
			info = inf;
			return true;
		}
		else
			return false;
	}
}
