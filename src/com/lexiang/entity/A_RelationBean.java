package com.lexiang.entity;

/**
* 处理文章与标签关系的类
* @author zhangyunhao
*/

public class A_RelationBean {
	private int article_id = -1;
	private int type_id = -1;
	
	public int getArticle_id() {
		return article_id;
	}
	
	public boolean setArticle_id(int id) {
		if(id!=0){
			this.article_id = id;
			return true;
		}
		else
			return false;
	}
	
	public int getType_id() {
		return type_id;
	}
	
	public boolean setType_id(int id) {
		if(id!=0){
			this.type_id = id;
			return true;
		}
		else
			return false;
	}
}
