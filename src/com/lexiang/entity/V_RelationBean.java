package com.lexiang.entity;

/**
* 处理视频与标签关系的类
* @author zhangyunhao
*/

public class V_RelationBean {
	private int video_id = -1;
	private int type_id = -1;
	
	public int getVideo_id() {
		return video_id;
	}
	
	public boolean setVideo_id(int id) {
		if(id!=0){
			this.video_id = id;
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
