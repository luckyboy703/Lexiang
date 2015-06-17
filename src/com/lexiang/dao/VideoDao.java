package com.lexiang.dao;

/**
* 与数据库video表连接的类，处理视频的增删改等请求，以及查询视频
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
		//生成SQL语句
		String sql = null;
		if(oper.equals("add"))             	//添加视频z	
			sql = "insert into video values(0,'"+single.getUrl()+"','"+single.getImage()+"','"+single.getTitle()+"',null,'"+single.getDescribe()+"','"+single.getCount()+"','"+single.getLength()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("modify"))			//修改视频
			sql = "update video set url='"+single.getUrl()+"',describe='"+single.getDescribe()+"' where id="+single.getId();
		if(oper.equals("delete"))			//删除视频
		{
			db.executeUpdate("delete from video_has_video_type where video_id ="+single.getId());
			sql = "delete from video where id="+single.getId();
		}
		if(oper.equals("like"))				//点赞
			sql = "update video set like_count=(like_count+0.5) where title='"+single.getTitle()+"'";
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<VideoBean> queryVideo(int type_id, String type, int number) throws Exception{  	//type为查询类型： all or 其他（前五项）
		List videolist = new ArrayList();
		String sql = "";
		if(type_id == 0)				//最新视频
			sql = "select * from video order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -1 ) 		//最热视频
				sql = "select * from video order by like_count DESC limit 0,"+number;
		else 							
			if (type_id == -2) 			//最长视频
				sql = "select * from video order by length DESC limit 0,"+number;
		else
			if (type_id == -3)			//我的视频
				sql = "select * from video where user_name='"+type+"' order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -4) 			//按题目搜索
				sql = "select * from video where title='"+type+"'";
		else
			if(type==null||type.equals("")||!type.equals("all"))			//按类型查询，默认按发布时间排序，返回前五项
				sql = "select * from video join video_has_video_type on video.id=video_has_video_type.video_id where type_id = "+type_id+" order by send_time DESC limit 0,"+number;
		else			//按类型查询，默认按发布时间排序，返回所有项
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
