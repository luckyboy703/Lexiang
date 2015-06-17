package com.lexiang.dao;

/**
* �����ݿ�transact_type�����ӵ��࣬�����ױ�ǩ�����ĵ������Լ���ѯ��ǩ�б�
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.TransactTypeBean;
import com.lexiang.sql.SQL;

public class TransactTypeDao {
	private SQL db = new SQL("my_project");

	public TransactTypeDao() throws Exception{
		// TODO Auto-generated constructor stub
	}

	public boolean operationTransactType(String oper,TransactTypeBean single) throws SQLException{
		String sql = null;
		if (oper.equals("add"))			//��� ���±�ǩ
			sql = "insert into transact_type values(0,'"+single.getName()+"','"+single.getInfo()+"')";
		if (oper.equals("modify"))		//�޸����±�ǩ
			sql = "update transact_type set name = '"+single.getName()+"',info = '"+single.getInfo()+"' where id =" +single.getId();
		if (oper.equals("delete"))		//ɾ����ǩ
		{
			db.executeUpdate("delete from transact_has_transact_type where type_id ="+single.getId());
			sql = "delete from transact_type where id="+single.getId();
		}
		boolean flag = db.executeUpdate(sql);
		return flag;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<TransactTypeBean> queryType(int type, String typename) throws SQLException{
		List typelist = null;
		String sql = "";
		if (type==0) 
			sql = "select * from transact_type";
		else if(type==1) 
			sql = "select * from transact_type where name='"+typename+"'";
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			typelist = new ArrayList();
			try{
				while (rs.next()){
					TransactTypeBean typeBean = new TransactTypeBean();
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
