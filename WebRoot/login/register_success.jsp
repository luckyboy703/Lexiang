<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.lexiang.sql.SQL" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <meta http-equiv="refresh" content="3; url=login.html"> 
 <title>注册成功</title>
</head>
<body>
<center>
<%
	request.setCharacterEncoding("UTF-8");
   	String name = request.getParameter("userName");
  	out.println("欢迎你！" + name);
    SQL test = new SQL("my_project");
    ResultSet rs;
    try{
    	rs = test.executeQuery("select * from user where name = '"+name+"'");
    	if(rs.next())
    	{
%>
    	<h3>欢迎你！</h3>
    	<div class="loading">
			<div class="mask">
				<div class="loading-img">
					<img src="images/loading.gif" width="31" height="31">
				</div>
			</div>
		</div>
   		<table border = "1" cellpadding = "3" cellspacing = "5" bordercolor = "#999999" style = "border-collapse:collapse">
   		<tr>
   			<td width = "50" align = "right">昵&nbsp;&nbsp;称</td>
   			<td width = "100" align = "left"><%= rs.getString("name") %></td>
   		</tr>
   		<tr>
   			<td align = "right">邮&nbsp;&nbsp;箱</td>
   			<td align = "left"><%= rs.getString("email") %></td>
   		</tr>
   		<tr>
   			<td align = "right">密&nbsp;&nbsp;码</td>
   			<td align = "left"><%= rs.getString("password") %></td>
   		</tr>
   		</table>
    	<% 	test.close();
    	}
    }
    catch(SQLException e){
    	out.println(e.toString());
    }
  %>
</center>
</body>
</html>