package com.lexiang.entity;

public class VideoReviewBean {
	private int id = -1;
	private int parent_id = -1;
	private String title = "";
	private String content = "";
	private String sdtime = "";
	private String video_title = "";
	private int video_id = -1;
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
		else 
			return false; 
	}
	
	public int getParent_id() {
		return parent_id;
	}
	
	public boolean setParent_id(int pid) {
		if(pid!=0){
			parent_id = pid;
			return true;
		}
		else
			return false;
	}
	
	public String getTitle() {
		return title;
	}
	
	public boolean setTitle(String tit) {
		if(!tit.isEmpty()){
			title = tit;
			return true;
		}
		else
			return false;
	}
	
	public String getContent() {
		return content;
	}
	
	public boolean setContent(String con) {
		if(!con.isEmpty()){
			content = con;
			return true;
		}
		else
			return false;
	}
	
	public String getSdtime() {
		return sdtime;
	}
	
	public boolean setSdtime(String sdt) {
		if(!sdt.isEmpty()){
			sdtime = sdt;
			return true;
		}
		else
			return false;
	}
	
	public String getVideo_title() {
		return video_title;
	}
	
	public boolean setVideo_title(String vtit) {
		if(!vtit.isEmpty()){
			video_title = vtit;
			return true;
		}
		else
			return false;
	}
	
	public int getVideo_id() {
		return video_id;
	}
	
	public boolean setVideo_id(int vid) {
		if(vid!=0){
			video_id = vid;
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
	
	public int getUid() {
		return uid;
	}
	
	public boolean setUid(int uid) {
		if(uid!=0){
			this.uid = uid;
			return true;
		}
		else
			return false;
	}
}
