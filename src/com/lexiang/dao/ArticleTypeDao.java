package com.lexiang.dao;

/**
* �����ݿ�article_type�����ӵ��࣬�������±�ǩ�����ĵ������Լ���ѯ��ǩ�б�
* @author zhangyunhao
*/

import java.sql.*;
import java.util.*;

import com.lexiang.entity.ArticleTypeBean;
import com.lexiang.sql.SQL;

public class ArticleTypeDao{
	private SQL db = new SQL("my_project");

	public ArticleTypeDao() throws Exception{
		// TODO Auto-generated constructor stub
	}

	public boolean operationArticleType(String oper,ArticleTypeBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//��� ���±�ǩ
			sql = "insert into article_type values(0,'"+single.getName()+"','"+single.getInfo()+"')";
		if (oper.equals("modify"))		//�޸����±�ǩ
			sql = "update article_type set name = '"+single.getName()+"',info = '"+single.getInfo()+"' where id =" +single.getId();
		if (oper.equals("delete"))		//ɾ����ǩ
		{
			db.executeUpdate("delete from article_has_article_type where type_id ="+single.getId());
			sql = "delete from article_type where id="+single.getId();
		}
		boolean flag = db.executeUpdate(sql);
		return flag;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<ArticleTypeBean> queryType(int type, String typename) throws SQLException{
		List typelist = null;
		String sql = "";
		if (type==0) 
			sql = "select * from article_type";
		else if(type==1) 
			sql = "select * from article_type where name='"+typename+"'";
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			typelist = new ArrayList();
			try{
				while (rs.next()){
					ArticleTypeBean typeBean = new ArticleTypeBean();
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