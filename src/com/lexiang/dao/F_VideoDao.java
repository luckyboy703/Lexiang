package com.lexiang.dao;

/**
* �����ݿ�favorite_video�����ӵ��࣬������Ƶ�ղص����ĵ������Լ���ѯ�ղص���Ƶ
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.F_VideoBean;
import com.lexiang.sql.SQL;

public class F_VideoDao {
	private SQL db = new SQL("my_project");
	F_VideoBean video = null;

	public F_VideoDao() throws Exception{
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationFavoriteVideo(String oper,F_VideoBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//��� ��Ƶ�ղ�
			sql = "insert into favorite_video values(0,"+single.getVideo_id()+",'"+single.getTitle()+"','"+single.getDescribe()+"',null,'"+single.getUsername()+"',"+single.getUid()+")";
		if (oper.equals("delete"))		//ɾ���ղ�
			sql = "delete from favorite_video where id="+single.getId();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<F_VideoBean> queryFavoriteVideo(int type, String title, int number) throws Exception {
		List videolist = new ArrayList();
		String sql = "";
		if(type == 0)				//����Ƶ���ƺ��û�id�����ղ�
			sql = "select * from favorite_video where video_title = '"+title+"' and user_id = '"+number+"'";
		else if(type == -1)			//�ҵ��ղ�
			sql = "select *, count(distinct video_title) from favorite_video where user_name = '"+title+"' group by video_title order by send_time DESC";
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			try{
				while(rs.next()){
					video = new F_VideoBean();
					video.setId(rs.getInt("id"));
					video.setVideo_id(rs.getInt("video_id"));
					video.setTitle(rs.getString("video_title"));
					video.setDescribe(rs.getString("video_describe"));
					video.setSdtime(rs.getTimestamp("send_time").toString());
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
