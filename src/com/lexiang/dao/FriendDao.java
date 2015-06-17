package com.lexiang.dao;

/**
* 与数据库friend表连接的类，处理好友的增删改等请求
* @author zhangyunhao
*/

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lexiang.entity.FriendBean;
import com.lexiang.entity.UserBean;
import com.lexiang.sql.SQL;

public class FriendDao {
	private SQL db = new SQL("my_project");
	private FriendBean friend = null;
	
	public FriendDao() throws Exception {
		// TODO Auto-generated constructor stub
	}
	
	public boolean operationFriend(String oper, FriendBean single) throws Exception {
		//生成SQL语句
		String sql = null;
		if(oper.equals("add"))             	//添加好友
			sql = "insert into friend values(0,'"+single.getName()+"','"+single.getSex()+"','"+single.getAddress()+"','"+single.getInstrument()+"','"+single.getUsername()+"',"+single.getUid()+")";
		if(oper.equals("delete"))			//删除好友
			sql = "delete from friend where id="+single.getId();
		boolean flag = db.executeUpdate(sql);
		return flag;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<FriendBean> queryFriend(int uid) throws Exception {
		List friendlist =new ArrayList();
		String sql = "";
		sql = "select * from friend where user_id = "+uid;
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			try{
				while(rs.next()){
					friend = new FriendBean();
					friend.setId(rs.getInt("id"));
					friend.setName(rs.getString("name"));
					friend.setSex(rs.getString("sex"));
					friend.setAddress(rs.getString("address"));
					friend.setInstrument(rs.getString("instrument"));
					friend.setUsername(rs.getString("user_name"));
					friend.setUid(rs.getInt("user_id"));
					
					friendlist.add(friend);
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
		return friendlist;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<UserBean> queryFriended(String uname) throws Exception{
		List friendedList = new ArrayList();
		String sql = "";
		sql = "select * from friend join user on friend.user_name = user.name where friend.name = '"+uname+"'";
		ResultSet rs = db.executeQuery(sql);
		if(rs!=null){
			try{
				while(rs.next()){
					UserBean user = new UserBean();
					user.setName(rs.getString("user.name"));
					user.setAddress(rs.getString("user.address"));
					user.setEmail(rs.getString("user.email"));
					user.setSex(rs.getString("user.sex"));
					user.setIntroduction(rs.getString("user.introduction"));
					user.setInstrument(rs.getString("user.instrument"));
					
					friendedList.add(user);
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
		return friendedList;
	}
}
