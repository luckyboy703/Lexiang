package com.lexiang.entity;

/**
* 封装文章内容的类
* @author zhangyunhao
*/

public class ArticleBean {
	private int id = -1;
	private String title = "";
	private String content = "";
	private String sdtime = "";
	private String info = "";
	private int visit_count = 0;
	private String image = "/Lexiang/upload/article/default.jpg";
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
	
	public String getContent(int len){
		if(len<=0||len>content.length()){
			len=content.length();
			return content;
		}
		else {
			return content.substring(0,len)+"...";
		}
	}
	
	public boolean setContent(String con) {
		if(!con.isEmpty()){
			content = con;
			return true;
		}
		else
			return false;
	}
	
	public String getTitle(){
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
	
	public String getSdtime(){
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
	
	public String getUsername(){
		return username;
	}
	
	public boolean setUsername(String use) {
		if(!use.isEmpty()){
			username = use;
			return true;
		}
		else
			return false;
	}
	
	public int getCount(){
		return visit_count;
	}
	
	public boolean setCount(int cou) {
		if(cou!=0){
			visit_count = cou;
			return true;
		}
		else
			return false;
	}

	public int getUid(){
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
	
	public String getImage(){
		return image;
	}
	
	public boolean setImage(String ima) {
		if(!ima.isEmpty()){
			image = ima;
			return true;
		}
		else
			return false;
	}
}
