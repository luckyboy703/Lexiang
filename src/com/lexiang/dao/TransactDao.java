package com.lexiang.dao;

/**
* �����ݿ�transact�����ӵ��࣬�����׵���ɾ�ĵ������Լ������Ͳ�ѯ����
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.TransactBean;
import com.lexiang.sql.SQL;

public class TransactDao {
	private SQL db = new SQL("my_project");
	private TransactBean transact = null;
	
	public TransactDao() throws Exception {
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationTransact(String oper, TransactBean single) throws Exception {
		//����SQL���
		String sql = null;
		if(oper.equals("add"))             	//�������
			sql = "insert into transact values(0,'"+single.getTitle()+"','"+single.getContent(0)+"',null,'"+single.getState()+"',0,'"+single.getImage()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("modify"))			//�޸�����
			sql = "update transact set title='"+single.getTitle()+"',content='"+single.getContent(0)+"',state='"+single.getState()+"' where id="+single.getId();
		if(oper.equals("delete"))			//ɾ������
		{
			db.executeUpdate("delete from transact_has_transact_type where transact_id ="+single.getId());
			sql = "delete from transact where id="+single.getId();
		}
		if(oper.equals("visit"))			//���ӷ�������
			sql = "update transact set visit_count=visit_count+1 where id="+single.getId();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<TransactBean> queryTransact(int type_id, String type,int number) throws Exception{  	//typeΪ��ѯ���ͣ� all or ������ǰ���
		List transactlist = new ArrayList();
		String sql = "";
		if(type_id ==0)				//�������Ͳ�ѯ��Ĭ�ϰ�����ʱ�����򣬷���ǰnumber��
			sql = "select * from transact order by send_time DESC limit 0,"+number;
		else 
			if (type_id == -1) 		//���������
				sql = "select * from transact where title='"+type+"'";
		else
			if(type_id == -2)		//�ҵĽ���
				sql = "select * from transact where user_name='"+type+"' order by send_time DESC limit 0,"+number;
		else
			if(type==null||type.equals("")||!type.equals("all"))			//�����Ͳ�ѯ��Ĭ�ϰ�����ʱ�����򣬷���ǰnumber��
				sql = "select * from transact join transact_has_transact_type on transact.id=transact_has_transact_type.transact_id where type_id = "+type_id+"order by send_time DESC limit 0,"+number;
			else			//�����Ͳ�ѯ��Ĭ�ϰ�����ʱ�����򣬷���������
				sql = "select * from transact join transact_has_transact_type on transact.id=transact_has_transact_type.transact_id where type_id=" + type_id + "order by send_time DESC";
			ResultSet rs = db.executeQuery(sql);
			if(rs!=null){
				try{
					while(rs.next()){
					transact = new TransactBean();
					transact.setId(rs.getInt("id"));
					transact.setTitle(rs.getString("title"));
					transact.setContent(rs.getString("content"));
					transact.setSdtime(rs.getTimestamp("send_time").toString());
					transact.setState(rs.getString("state"));
					transact.setCount(rs.getInt("visit_count"));
					transact.setImage(rs.getString("image"));
					transact.setUsername(rs.getString("user_name"));
					transact.setUid(rs.getInt("user_id"));

					transactlist.add(transact);
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
			return transactlist;
	}
}
