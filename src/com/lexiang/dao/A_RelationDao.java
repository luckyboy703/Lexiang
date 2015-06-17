package com.lexiang.dao;

/**
* 与数据库article_has_aiticle_type表连接的类，处理文章-标签关系的增删等请求，以及查询文章的所有标签，某个标签下的所有文章
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.A_RelationBean;
import com.lexiang.entity.ArticleBean;
import com.lexiang.entity.ArticleTypeBean;
import com.lexiang.sql.SQL;

public class A_RelationDao {
	private SQL db = new SQL("my_project");
	
	public A_RelationDao() throws Exception{
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationRelation(String oper,A_RelationBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//添加 文章标签
			sql = "insert into article_has_article_type values("+single.getArticle_id()+","+single.getType_id()+")";
		if (oper.equals("delete"))		//删除文章标签
			sql = "delete from article_has_article_type where article_id="+single.getArticle_id()+" and type_id="+single.getType_id();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllArticle(int i) throws SQLException {		//查询某个标签下的所有文章
		List list = null;
		String sql = "select * from article join article_has_article_type on article_has_article_type.article_id=article.id where type_id ="+i;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					ArticleBean article = new ArticleBean();
					article.setId(rs.getInt("id"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setSdtime(rs.getTimestamp("send_time").toString());
					article.setInfo(rs.getString("info"));
					article.setCount(rs.getInt("visit_count"));
					article.setImage(rs.getString("image"));
					article.setUsername(rs.getString("user_name"));
					article.setUid(rs.getInt("user_id"));
					
					list.add(article);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<ArticleTypeBean> queryAllType(int i) throws SQLException {		//查询某篇文章的所有标签
		List list = null;
		String sql = "select * from article_type join article_has_article_type on article_has_article_type.type_id=article_type.id where article_id ="+i;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					ArticleTypeBean typeBean = new ArticleTypeBean();
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
		String sql = "select name from (select distinct name,count(id) as number from article_has_article_type join article_type"
				+ " on article_has_article_type.type_id = article_type.id group by name) A order by number desc limit 0,20";
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
