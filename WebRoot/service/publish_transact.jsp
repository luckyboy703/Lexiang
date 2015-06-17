<%@page import="javax.swing.plaf.basic.BasicInternalFrameTitlePane.TitlePaneLayout"%>
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
    
    <title>publish_transact</title>
    
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
  
  //将文章添加到数据库transact中
  TransactBean newTransact = new TransactBean();
  TransactDao dao = new TransactDao();
  newTransact.setTitle(title);
  newTransact.setContent(content);
  newTransact.setUsername(user.getName());
  newTransact.setUid(user.getId());
  
  //判断是否上传文件，如果上传，则把文件路径存入数据库
  if(session.getAttribute("filename")!=""){
  	newTransact.setImage("/Lexiang/upload/transact/"+user.getId()+"-"+session.getAttribute("filename").toString());
  	session.removeAttribute("filename");
  }
  
  dao.operationTransact("add", newTransact);
  
  //将标签添加到数据库transact_has_transact_type中
  T_RelationBean relationBean = new T_RelationBean();
  T_RelationDao relationDao = new T_RelationDao();
  TransactTypeDao typeDao = new TransactTypeDao();
  relationBean.setTransact_id(dao.queryTransact(-1, title, 0).get(0).getId());
  relationBean.setType_id(typeDao.queryType(1, type).get(0).getId());
  relationDao.operationRelation("add", relationBean);
  
  //发布成功
  response.sendRedirect("/Lexiang/transact.jsp");
   %>
  </body>
</html>
