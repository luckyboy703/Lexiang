package com.lexiang.dao;

/**
* �����ݿ�transact_has_transact_type�����ӵ��࣬������-��ǩ��ϵ����ɾ�������Լ���ѯ���׵����б�ǩ��ĳ����ǩ�µ����н���
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.T_RelationBean;
import com.lexiang.entity.TransactBean;
import com.lexiang.entity.TransactTypeBean;
import com.lexiang.sql.SQL;

public class T_RelationDao {
	private SQL db = new SQL("my_project");
	
	public T_RelationDao() throws Exception{
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationRelation(String oper,T_RelationBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//��ӽ��ױ�ǩ
			sql = "insert into transact_has_transact_type values("+single.getTransact_id()+","+single.getType_id()+")";
		if (oper.equals("delete"))		//ɾ�����ױ�ǩ
			sql = "delete from transact_has_transact_type where transact_id="+single.getTransact_id()+" and type_id="+single.getType_id();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllTransact(int i) throws SQLException {		//��ѯĳ����ǩ�µ���������
		List list = null;
		String sql = "select * from transact join transact_has_transact_type on transact_has_transact_type.transact_id=transact.id where type_id ="+i;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					TransactBean transact = new TransactBean();
					transact.setId(rs.getInt("id"));
					transact.setTitle(rs.getString("title"));
					transact.setContent(rs.getString("content"));
					transact.setSdtime(rs.getTimestamp("send_time").toString());
					transact.setState(rs.getString("state"));
					transact.setCount(rs.getInt("visit_count"));
					transact.setUsername(rs.getString("user_name"));
					transact.setUid(rs.getInt("user_id"));
					
					list.add(transact);
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List queryAllType(int i) throws SQLException {		//��ѯĳƪ���µ����б�ǩ
		List list = null;
		String sql = "select * from transact_type join transact_has_transact_type on transact_has_transact_type.type_id=transact_type.id where transact_id ="+i;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			list = new ArrayList();
			try{
				while (rs.next()){
					TransactTypeBean typeBean = new TransactTypeBean();
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
		String sql = "select name from (select distinct name,count(id) as number from transact_has_transact_type join transact_type"
				+ " on transact_has_transact_type.type_id = transact_type.id group by name) A order by number desc limit 0,20";
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
