package com.lexiang.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.VideoReviewBean;
import com.lexiang.sql.SQL;

public class VideoReviewDao {
	private SQL db = new SQL("my_project");
	private VideoReviewBean review = null;
	
	public VideoReviewDao() throws Exception {
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationVideoReview(String oper, VideoReviewBean single) throws Exception {
		//����SQL���
		String sql = null;
		if(oper.equals("add"))             	//�������
			sql = "insert into review_video values(0,'"+single.getParent_id()+"','"+single.getTitle()+"','"+single.getContent()+"',null,'"+single.getVideo_title()+"','"+single.getVideo_id()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("modify"))			//�޸�����
			sql = "update review_video set title='"+single.getTitle()+"',content='"+single.getContent()+"' where id="+single.getId();
		if(oper.equals("delete"))			//ɾ�����ۣ���ʱֻ֧�ֶ�������
		{
			db.executeUpdate("delete from review_video where parent_id = "+single.getId());
			sql = "delete from review_video where id="+single.getId();
		}
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<VideoReviewBean> queryVideoReview(int type_id, String type, int number) throws Exception{  	//typeΪ��ѯ���ͣ� all or ������ǰ���
		List reviewlist = new ArrayList();
		String sql = "";
		if(type_id == 0)				//����
			sql = "select * from review_video order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -1) 			//����Ƶtitle����
				sql = "select * from review_video where video_title = '"+type+"' order by send_time limit 0,"+number;
		else 
			if(type_id == -2)			//��������id����
				sql = "select * from review_video where parent_id = "+number;
		else 
			if(type_id == -3)			//�ҵ�����
				sql = "select * from review_video where user_name='"+type+"' order by send_time DESC limit 0,"+number;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			try{
				while(rs.next()){
				review = new VideoReviewBean();
				review.setId(rs.getInt("id"));
				review.setParent_id(rs.getInt("parent_id"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getString("content"));
				review.setSdtime(rs.getTimestamp("send_time").toString());
				review.setVideo_title(rs.getString("video_title"));
				review.setVideo_id(rs.getInt("video_id"));
				review.setUsername(rs.getString("user_name"));
				review.setUid(rs.getInt("user_id"));

				reviewlist.add(review);
				}
			}catch (SQLException e){
				e.printStackTrace();
			}finally{
				try{
					rs.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
				db.close();
			}
		}
		return reviewlist;
	}
}
