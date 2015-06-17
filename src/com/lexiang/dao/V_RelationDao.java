package com.lexiang.dao;

/**
* 与数据库video_has_video_type表连接的类，处理视频-标签关系的增删等请求，以及查询某视频的所有标签，某个标签下的所有视频
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.V_RelationBean;
import com.lexiang.entity.VideoBean;
import com.lexiang.entity.VideoTypeBean;
import com.lexiang.sql.SQL;

public class V_RelationDao {
	private SQL db = new SQL("my_project");
	
	public V_RelationDao() throws Exception{
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationRelation(String oper,V_RelationBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//添加 文章标签
			sql = "insert into video_has_video_type values("+single.getVideo_id()+","+single.getType_id()+")";
		if (oper.equals("delete"))		//删除文章标签
			sql = "delete from video_has_video_type where video_id="+single.getVideo_id()+" and type_id="+single.getType_id();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllVideo(int i) throws SQLException {		//查询某个标签下的所有视频
		List list = null;
		String sql = "select * from video join video_has_video_type on video_has_video_type.video_id=video.id where type_id ="+i;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					VideoBean video = new VideoBean();
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
					
					list.add(video);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<VideoTypeBean> queryAllType(int i, int number) throws SQLException {		//查询某篇视频的所有标签
		List list = null;
		String sql = "select * from video_type join video_has_video_type on video_has_video_type.type_id=video_type.id"
				+ " where video_id ="+i+" limit 0,"+number;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					VideoTypeBean typeBean = new VideoTypeBean();
					typeBean.setId(rs.getInt(1));
					typeBean.setName(rs.getString(2));
					typeBean.setInfo(rs.getString(3));
					list.add(typeBean);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<String> queryTypeRank() throws SQLException {
		List list = null;
		String sql = "select name from (select distinct name,count(id) as number from video_has_video_type join video_type"
				+ " on video_has_video_type.type_id = video_type.id group by name) A order by number desc limit 0,20";
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					String typename = "";
					typename = rs.getString("name");
					list.add(typename);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
}
