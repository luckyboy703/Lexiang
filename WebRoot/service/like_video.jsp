<%@page import="com.lexiang.entity.VideoBean"%>
<%@page import="com.lexiang.dao.VideoDao"%>
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
    
    <title>点赞</title>
    
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
  VideoBean video = new VideoBean();
  video.setTitle(title);
  VideoDao dao = new VideoDao();
  dao.operationVideo("like", video);
  
  String url=request.getHeader("Referer");
  response.sendRedirect(url);
   %>
  </body>
</html>
