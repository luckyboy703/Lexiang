package com.lexiang.sql;

import java.sql.*;
import java.io.*;

/**
* �������ݿ�����Ӻͷ���
* @author zhangyunhao
* @version 1.0
*/
public class SQL{

private Connection conn = null;
private Statement stmt = null;
private PreparedStatement prepstmt = null;
private String user = "root";
private String password = "1084271781";
private String dburl = "jdbc:mysql://localhost:3306/";
private String dbdriver = "com.mysql.jdbc.Driver";
private String dbname = null;
private String other = "?autoReconnect=true&characterEncoding=utf8";

/**
* �������ݿ�����Ӻͷ�����
*/
public SQL(String value) throws Exception {
	dbname = value;
	Class.forName(dbdriver);
	conn = DriverManager.getConnection(dburl+dbname+other,user,password);
	stmt = conn.createStatement();
}
public SQL(String value,String sql) throws Exception {
	dbname = value;
	Class.forName(dbdriver);
	conn = DriverManager.getConnection(dburl+dbname,user,password); 
	this.prepareStatement(sql);
}

/**
* ��������
* @return Connection ����
*/
public Connection getConnection() {
	return conn;
}
/**
* PreparedStatement
* @return sql Ԥ��SQL���
*/ 
public void prepareStatement(String sql) throws SQLException {
	prepstmt = conn.prepareStatement(sql);
}
/**
* ���ö�Ӧֵ
* @param index ��������
* @param value ��Ӧֵ
*/
public void setString(int index,String value) throws SQLException {
	prepstmt.setString(index,value);
}
public void setInt(int index,int value) throws SQLException {
	prepstmt.setInt(index,value);
}
public void setBoolean(int index,boolean value) throws SQLException {
	prepstmt.setBoolean(index,value);
}
public void setDate(int index,Date value) throws SQLException {
	prepstmt.setDate(index,value);
}
public void setLong(int index,long value) throws SQLException {
	prepstmt.setLong(index,value);
}
public void setFloat(int index,float value) throws SQLException {
	prepstmt.setFloat(index,value);
}
//File file = new File("test/data.txt");
//int fileLength = file.length();
//InputStream fin = new java.io.FileInputStream(file);
//mysql.setBinaryStream(5,fin,fileLength);
public void setBinaryStream(int index,InputStream in,int length) throws SQLException {
	prepstmt.setBinaryStream(index,in,length);
} 

public void clearParameters()throws SQLException
{
	prepstmt.clearParameters();
}
/**
* ����Ԥ��״̬
*/
public PreparedStatement getPreparedStatement() {
	return prepstmt;
}
/**
* ����״̬
* @return Statement ״̬
*/
public Statement getStatement() {
	return stmt;
}
/**
* ִ��SQL��䷵���ֶμ�
* @param sql SQL���
* @return ResultSet �ֶμ�
*/
public ResultSet executeQuery(String sql) throws SQLException {
	if (stmt != null) {
	return stmt.executeQuery(sql);
	}
	else return null;
}
public ResultSet executeQuery() throws SQLException {
	if (prepstmt != null) {
	return prepstmt.executeQuery();
	}
	else return null;
}
/**
* ִ��SQL���
* @param sql SQL���
 * @return 
*/
public boolean executeUpdate(String sql) throws SQLException {
	if (stmt != null) 
	{
		stmt.executeUpdate(sql);
		return true;
	}
	else return false;
}
public boolean executeUpdate() throws SQLException {
	if (prepstmt != null) 
	{
		prepstmt.executeUpdate();
		return true;
	}
	else return false;
}

/**
* �ر�����
*/
public void close() throws Exception {
	if (stmt != null) {
	stmt.close();
	stmt = null;
	}
	if (prepstmt != null) {
		prepstmt.close();
		prepstmt = null;
	}
	conn.close();
	conn = null;
	}
}