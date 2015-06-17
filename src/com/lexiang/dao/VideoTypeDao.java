package com.lexiang.dao;

/**
* �����ݿ�video_type�����ӵ��࣬������Ƶ��ǩ�����ĵ������Լ���ѯ��ǩ�б�
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.VideoTypeBean;
import com.lexiang.sql.SQL;

public class VideoTypeDao {
	private SQL db = new SQL("my_project");

	public VideoTypeDao() throws Exception{
		// TODO Auto-generated constructor stub
	}

	public boolean operationVideoType(String oper,VideoTypeBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//��� ���±�ǩ
			sql = "insert into video_type values(0,'"+single.getName()+"','"+single.getInfo()+"')";
		if (oper.equals("modify"))		//�޸����±�ǩ
			sql = "update video_type set name = '"+single.getName()+"',info = '"+single.getInfo()+"' where id =" +single.getId();
		if (oper.equals("delete"))		//ɾ����ǩ
		{
			db.executeUpdate("delete from video_has_video_type where type_id ="+single.getId());
			sql = "delete from video_type where id="+single.getId();
		}
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<VideoTypeBean> queryTypeList(int type, String typename) throws SQLException{
		List typelist = null;
		String sql = "";
		if (type==0) 
			sql = "select * from video_type";
		else if(type==-1) 
			sql = "select * from video_type where name='"+typename+"'";
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			typelist = new ArrayList();
			try{
				while (rs.next()){
					VideoTypeBean typeBean = new VideoTypeBean();
					typeBean.setId(rs.getInt(1));
					typeBean.setName(rs.getString(2));
					typeBean.setInfo(rs.getString(3));
					typelist.add(typeBean);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return typelist;
	}
}
