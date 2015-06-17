package com.lexiang.dao;

/**
* 与数据库article表连接的类，处理文章的增删改等请求，以及按类型查询文章
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.ArticleBean;
import com.lexiang.sql.SQL;

public class ArticleDao {
	private SQL db = new SQL("my_project");
	private ArticleBean article = null;
	
	public ArticleDao() throws Exception {
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationArticle(String oper, ArticleBean single) throws Exception {
		//生成SQL语句
		String sql = null;
		if(oper.equals("add"))             	//添加文章
			sql = "insert into article values(0,'"+single.getTitle()+"','"+single.getContent(0)+"',null,'"+single.getInfo()+"',0,'"+single.getImage()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("modify"))			//修改文章
			sql = "update article set title='"+single.getTitle()+"',content='"+single.getContent(0)+"',info='"+single.getInfo()+"' where id="+single.getId();
		if(oper.equals("delete"))			//删除文章
		{
			db.executeUpdate("delete from article_has_article_type where article_id ="+single.getId());
			sql = "delete from article where id="+single.getId();
		}
		if(oper.equals("visit"))			//增加访问人数
			sql = "update article set visit_count=visit_count+1 where id="+single.getId();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<ArticleBean> queryArticle(int type_id, String type, int number) throws Exception{  	//type为查询类型： all or 其他（前五项）
		List articlelist = new ArrayList();
		String sql = "";
		if(type_id == 0)				//最新
			sql = "select * from article order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -1) 			//按标题搜索
				sql = "select * from article where title='"+type+"'";
		else 
			if(type_id == -2)			//我的资源
				sql = "select * from article where user_name='"+type+"' order by send_time DESC limit 0,"+number;
		else
			if(type==null||type.equals("")||!type.equals("all"))			//按类型查询，默认按发布时间排序，返回前number项
				sql = "select * from article join article_has_article_type on article.id=article_has_article_type.article_id where type_id = "+type_id+" order by send_time DESC limit 0,"+number;
			else			//按类型查询，默认按发布时间排序，返回所有项
				sql = "select * from article join article_has_article_type on article.id=article_has_article_type.article_id where type_id=" + type_id + " order by send_time DESC";
			ResultSet rs = db.executeQuery(sql);
			if(rs!=null){
				try{
					while(rs.next()){
					article = new ArticleBean();
					article.setId(rs.getInt("id"));
					article.setTitle(rs.getString("title"));
					article.setContent(rs.getString("content"));
					article.setSdtime(rs.getTimestamp("send_time").toString());
					article.setInfo(rs.getString("info"));
					article.setCount(rs.getInt("visit_count"));
					article.setImage(rs.getString("image"));
					article.setUsername(rs.getString("user_name"));
					article.setUid(rs.getInt("user_id"));

					articlelist.add(article);
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
			return articlelist;
	}
}