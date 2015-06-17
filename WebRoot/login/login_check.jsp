<%@page import="org.eclipse.jdt.internal.compiler.batch.Main"%>
<%@page import="com.lexiang.sql.SQL,java.sql.*,com.lexiang.entity.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.lexiang.entity.UserBean" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录验证</title>
    
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
    	String email = request.getParameter("email");
        String password = request.getParameter("password");
        user.setEmail(email);
        user.setPassword(password);
        SQL test = new SQL("my_project");
        ResultSet rs;
        rs = test.executeQuery("select * from user where email='"+email+"' and password ='"+password+"'");
        if(rs.next()){
        user.setName(rs.getString("name"));
        user.setId(rs.getInt("id"));
        user.setInstrument(rs.getString("instrument"));
        user.setIntroduction(rs.getString("introduction"));
        user.setAddress(rs.getString("address"));
        user.setSex(rs.getString("sex"));
        test.close();
        response.sendRedirect("/Lexiang/main.jsp");
     }
     else{
     %>
     	<jsp:forward page="login.html"/>
     <%}
     %>
  </body>
</html>
