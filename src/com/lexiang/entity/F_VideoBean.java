package com.lexiang.entity;

/**
* 封装视频收藏夹的类
* @author zhangyunhao
*/

public class F_VideoBean {
	private int id = -1;
	private int video_id = -1;
	private String title = "";
	private String describe = "";
	private String send_time = "";
	private String username = "";
	private int uid = -1;
	
	public int getId() {
		return id;
	}
	
	public boolean setId(int id) {
		if(id!=0){
			this.id = id;
			return true;
		}
		else return false;
	}
	
	public int getVideo_id() {
		return video_id;
	}
	
	public boolean setVideo_id(int vid) {
		if(vid!=0){
			video_id = vid;
			return true;
		}
		else return false;
	}
	
	public String getTitle() {
		return title;
	}
	
	public boolean setTitle(String title) {
		if(!title.isEmpty()){
			this.title = title;
			return true;
		}
		else return false;
	}
	
	public String getDescribe() {
		return describe;
	}
	
	public boolean setDescribe(String desc) {
		if(!desc.isEmpty()){
			describe = desc;
			return true;
		}
		else return false;
	}
	
	public String getSdtime(){
		return send_time;
	}
	
	public boolean setSdtime(String sdt) {
		if(!sdt.isEmpty()){
			send_time = sdt;
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
		else return false;
	}
	
	public int getUid() {
		return uid;
	}
	
	public boolean setUid(int uid) {
		if(uid!=0){
			this.uid = uid;
			return true;
		}
		else return false;
	}
}
