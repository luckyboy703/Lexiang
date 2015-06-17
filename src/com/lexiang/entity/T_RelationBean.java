package com.lexiang.entity;

/**
* 处理交易与标签关系的类
* @author zhangyunhao
*/

public class T_RelationBean {
	private int transact_id = -1;
	private int type_id = -1;
	
	public int getTransact_id() {
		return transact_id;
	}
	
	public boolean setTransact_id(int id) {
		if(id!=0){
			this.transact_id = id;
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
