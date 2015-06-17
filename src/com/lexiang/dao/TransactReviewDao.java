package com.lexiang.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.TransactReviewBean;
import com.lexiang.sql.SQL;

public class TransactReviewDao {
	private SQL db = new SQL("my_project");
	private TransactReviewBean review = null;
	
	public TransactReviewDao() throws Exception {
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationTransactReview(String oper, TransactReviewBean single) throws Exception {
		//����SQL���
		String sql = null;
		if(oper.equals("add"))             	//�������
			sql = "insert into review_transact values(0,'"+single.getParent_id()+"','"+single.getTitle()+"','"+single.getContent()+"',null,'"+single.getTransact_title()+"','"+single.getTransact_id()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("modify"))			//�޸�����
			sql = "update review_transact set title='"+single.getTitle()+"',content='"+single.getContent()+"' where id="+single.getId();
		if(oper.equals("delete"))			//ɾ�����ۣ���ʱֻ֧�ֶ�������
		{
			db.executeUpdate("delete from review_transact where parent_id = "+single.getId());
			sql = "delete from review_transact where id="+single.getId();
		}
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<TransactReviewBean> queryTransactReview(int type_id, String type, int number) throws Exception{  	//typeΪ��ѯ���ͣ� all or ������ǰ���
		List reviewlist = new ArrayList();
		String sql = "";
		if(type_id == 0)				//����
			sql = "select * from review_transact order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -1) 			//������title����
				sql = "select * from review_transact where transact_title = '"+type+"' order by send_time limit 0,"+number;
		else 
			if(type_id == -2)			//��������id����
				sql = "select * from review_transact where parent_id = "+number;
		else 
			if(type_id == -3)			//�ҵ�����
				sql = "select * from review_transact where user_name='"+type+"' orser by send_time DESC limit 0,"+number;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			try{
				while(rs.next()){
				review = new TransactReviewBean();
				review.setId(rs.getInt("id"));
				review.setParent_id(rs.getInt("parent_id"));
				review.setTitle(rs.getString("title"));
				review.setContent(rs.getString("content"));
				review.setSdtime(rs.getTimestamp("send_time").toString());
				review.setTransact_title(rs.getString("transact_title"));
				review.setTransact_id(rs.getInt("transact_id"));
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
