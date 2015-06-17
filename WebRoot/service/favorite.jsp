<%@page import="com.lexiang.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lexiang.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.lexiang.entity.UserBean" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收藏</title>
    
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
  String title = "";
  if(request.getParameter("title")!=null)
  	title = request.getParameter("title");
  F_VideoBean video = new F_VideoBean();
  F_VideoDao dao = new F_VideoDao();
  video.setUsername(user.getName());
  video.setUid(user.getId());
  video.setTitle(title);
  video.setDescribe("none");
  video.setVideo_id(2);
  dao.operationFavoriteVideo("add", video);
  
  String url=request.getHeader("Referer");
  response.sendRedirect(url);
  %>
  </body>
</html>
