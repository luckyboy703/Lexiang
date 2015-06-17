package com.lexiang.entity;

/**
* 处理视频信息的类
* @author zhangyunhao
*/

public class VideoBean {
	private int id = -1;
	private String url = "";
	private String image = "/Lexiang/upload/video/default.jpg";
	private String title = "";
	private String send_time = "";
	private String describe = "";
	private int like_count = 0;
	private String length = "";
	private String username = "";
	private int uid = -1;
	
	public int getId(){
		return id;
	}
	
	public boolean setId(int id) {
		if(id!=-1){
			this.id = id;
			return true;
		}
		else
			return false;
	}
	
	public String getUrl(){
		return url;
	}
	
	public boolean setUrl(String url) {
		if(!url.isEmpty()){
			this.url = url;
			return true;
		}
		else
			return false;
	}
	
	public String getImage(){
		return image;
	}
	
	public boolean setImage(String img) {
		if(!img.isEmpty()){
			image = img;
			return true;
		}
		else
			return false;
	}
	
	public String getTitle(){
		return title;
	}
	
	public boolean setTitle(String title) {
		if(!title.isEmpty()){
			this.title = title;
			return true;
		}
		else
			return false;
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
	
	public String getDescribe(){
		return describe;
	}
	
	public boolean setDescribe(String des) {
		if(!des.isEmpty()){
			describe = des;
			return true;
		}
		else
			return false;
	}
	
	public int getCount(){
		return like_count;
	}
	
	public boolean setCount(int cnt) {
		if(cnt!=-1){
			like_count = cnt;
			return true;
		}
		else
			return false;
	}
	
	public String getLength(){
		return length;
	}
	
	public boolean setLength(String len) {
		if(!len.isEmpty()){
			length = len;
			return true;
		}
		else
			return false;
	}

	public String getUsername(){
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
