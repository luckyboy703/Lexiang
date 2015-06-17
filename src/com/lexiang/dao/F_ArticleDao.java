package com.lexiang.dao;

/**
* 与数据库favorite_article表连接的类，处理文章收藏的增改等请求，以及查询收藏的文章
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.F_ArticleBean;
import com.lexiang.sql.SQL;

public class F_ArticleDao {
	private SQL db = new SQL("my_project");
	F_ArticleBean article = null;

	public F_ArticleDao() throws Exception{
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationFavoriteArticle(String oper,F_ArticleBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//添加 文章标签
			sql = "insert into favorite_article values(0,"+single.getArticle_id()+",'"+single.getTitle()+"','"+single.getInfo()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if (oper.equals("delete"))		//删除标签
			sql = "delete from favorite_article where id="+single.getId();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAll(int uid) throws Exception {
		List articlelist =new ArrayList();
		String sql = "";
		sql = "select * from favorite_article where user_id ="+uid;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			try{
				while(rs.next()){
					article = new F_ArticleBean();
					article.setId(rs.getInt("id"));
					article.setArticle_id(rs.getInt("article_id"));
					article.setTitle(rs.getString("article_title"));
					article.setInfo(rs.getString("article_info"));
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
