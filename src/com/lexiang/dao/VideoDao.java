package com.lexiang.dao;

/**
* �����ݿ�video�����ӵ��࣬������Ƶ����ɾ�ĵ������Լ���ѯ��Ƶ
* @author zhangyunhao
*/

import java.sql.*;
import java.util.*;
import com.lexiang.entity.VideoBean;
import com.lexiang.sql.SQL;

public class VideoDao {
	private SQL db = new SQL("my_project");
	private VideoBean video = null;
	
	public VideoDao() throws Exception {
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationVideo(String oper, VideoBean single) throws Exception {
		//����SQL���
		String sql = null;
		if(oper.equals("add"))             	//�����Ƶz	
			sql = "insert into video values(0,'"+single.getUrl()+"','"+single.getImage()+"','"+single.getTitle()+"',null,'"+single.getDescribe()+"','"+single.getCount()+"','"+single.getLength()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("modify"))			//�޸���Ƶ
			sql = "update video set url='"+single.getUrl()+"',describe='"+single.getDescribe()+"' where id="+single.getId();
		if(oper.equals("delete"))			//ɾ����Ƶ
		{
			db.executeUpdate("delete from video_has_video_type where video_id ="+single.getId());
			sql = "delete from video where id="+single.getId();
		}
		if(oper.equals("like"))				//����
			sql = "update video set like_count=(like_count+0.5) where title='"+single.getTitle()+"'";
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<VideoBean> queryVideo(int type_id, String type, int number) throws Exception{  	//typeΪ��ѯ���ͣ� all or ������ǰ���
		List videolist = new ArrayList();
		String sql = "";
		if(type_id == 0)				//������Ƶ
			sql = "select * from video order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -1 ) 		//������Ƶ
				sql = "select * from video order by like_count DESC limit 0,"+number;
		else 							
			if (type_id == -2) 			//���Ƶ
				sql = "select * from video order by length DESC limit 0,"+number;
		else
			if (type_id == -3)			//�ҵ���Ƶ
				sql = "select * from video where user_name='"+type+"' order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -4) 			//����Ŀ����
				sql = "select * from video where title='"+type+"'";
		else
			if(type==null||type.equals("")||!type.equals("all"))			//�����Ͳ�ѯ��Ĭ�ϰ�����ʱ�����򣬷���ǰ����
				sql = "select * from video join video_has_video_type on video.id=video_has_video_type.video_id where type_id = "+type_id+" order by send_time DESC limit 0,"+number;
		else			//�����Ͳ�ѯ��Ĭ�ϰ�����ʱ�����򣬷���������
				sql = "select * from video join video_has_video_type on video.id=video_has_video_type.video_id where type_id=" + type_id + " order by send_time DESC";
			ResultSet rs = null;
			rs = db.executeQuery(sql);
			if(rs!=null){
				try{
					while(rs.next()){
					video = new VideoBean();
					video.setId(rs.getInt("id"));
					video.setUrl(rs.getString("url"));
					video.setImage(rs.getString("image"));
					video.setTitle(rs.getString("title"));
					video.setSdtime(rs.getTimestamp("send_time").toString());
					video.setDescribe(rs.getString("describe"));
					video.setCount(rs.getInt("like_count"));
					video.setLength(rs.getTime("length").toString());
					video.setUsername(rs.getString("user_name"));
					video.setUid(rs.getInt("user_id"));

					videolist.add(video);
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
			return videolist;
	}
}
