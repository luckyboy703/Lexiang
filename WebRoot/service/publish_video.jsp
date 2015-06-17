<%@ page language="java" import="java.util.*,com.lexiang.dao.*,com.lexiang.entity.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.lexiang.entity.UserBean" scope="session"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>publish_video</title>
    
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
  request.setCharacterEncoding("UTF-8");
  String title = request.getParameter("textfield2");
  String type = request.getParameter("select");
  String content = request.getParameter("content");
  
  //将文章添加到数据库video中
  VideoBean newVideo = new VideoBean();
  VideoDao dao = new VideoDao();
  newVideo.setTitle(title);
  newVideo.setDescribe(content);
  newVideo.setUsername(user.getName());
  newVideo.setUid(user.getId());
  
  //判断是否上传文件，如果上传，则把文件路径存入数据库
  if(session.getAttribute("filename")!=""){
  	newVideo.setUrl("/Lexiang/upload/video/"+user.getId()+"-"+session.getAttribute("filename").toString());
  	newVideo.setImage("/Lexiang/upload/video/"+user.getId()+"-"+session.getAttribute("filename").toString()+".jpg");
 	session.removeAttribute("filename");
 }
  
  dao.operationVideo("add", newVideo);
  
  //将标签添加到数据库video_has_video_type中
  V_RelationBean relationBean = new V_RelationBean();
  V_RelationDao relationDao = new V_RelationDao();
  VideoTypeDao typeDao = new VideoTypeDao();
  relationBean.setVideo_id(dao.queryVideo(-4, title, 0).get(0).getId());
  relationBean.setType_id(typeDao.queryTypeList(-1, type).get(0).getId());
  relationDao.operationRelation("add", relationBean);
  
  //发布成功
  response.sendRedirect("/Lexiang/video.jsp");
   %>
  </body>
</html>
