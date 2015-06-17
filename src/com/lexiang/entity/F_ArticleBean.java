package com.lexiang.entity;

/**
* 封装文章收藏夹的类
* @author zhangyunhao
*/

public class F_ArticleBean {
	private int id = -1;
	private int article_id = -1;
	private String title = "";
	private String info = "";
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
	
	public int getArticle_id() {
		return article_id;
	}
	
	public boolean setArticle_id(int id) {
		if(id!=0){
			article_id = id;
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
	
	public String getInfo() {
		return info;
	}
	
	public boolean setInfo(String info) {
		if(!info.isEmpty()){
			this.info = info;
			return true;
		}
		else return false;
	}
	
	public String getUsername() {
		return username;
	}
	
	public boolean setUsername(String uname) {
		if(!username.isEmpty()){
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
