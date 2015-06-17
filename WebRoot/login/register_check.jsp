<%@page import="java.sql.*,com.lexiang.sql.SQL"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <%
    	SQL test = new SQL("my_project");
        ResultSet rs;
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("Name");
        String password = request.getParameter("password");
        String email = request.getParameter("Email");
        String repassword = request.getParameter("confirm_password");
        boolean flag = false;
        if(!name.isEmpty() && !password.isEmpty() && !email.isEmpty() && repassword.equals(password) && name.length()>=2 && password.length()>=6){
	        try{
	        	test.executeUpdate("insert into user(id,name,password,email) values(0,'"+name+"','"+password+"','"+email+"')");
	        	rs = test.executeQuery("select * from user where name = '"+name+"'");
	        	if(rs.next())
	        		flag = true;
	        }
	        catch(SQLException e){
	        	out.println(e.toString());
        	}
        }
        if(flag){   // 登陆成功
    %>
        <jsp:forward page="register_success.jsp">
        <jsp:param name="userName" value="<%=name%>"/>
        </jsp:forward>
	<% 	test.close();
    } 
    	else {      // 登陆失败
	%>
        <jsp:forward page="register.html"/>
	<%
    }
	%>
  </body>
</html>
