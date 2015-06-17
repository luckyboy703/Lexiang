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
    
    <title>发表评论</title>
    
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
  		String text = request.getParameter("text");
  	  	String type = request.getParameter("type");
  	  	String title = request.getParameter("title");
  	  	
  	  	if(type.equals("article")){
  	  		ArticleReviewBean articleReviewBean = new ArticleReviewBean();
  	  		ArticleReviewDao articleReviewDao = new ArticleReviewDao();
  	  		articleReviewBean.setContent(text);
  	  		articleReviewBean.setArticle_title(title);
  	  		articleReviewBean.setUsername(user.getName());
  	  		articleReviewDao.operationArticleReview("add", articleReviewBean);
  	  	}
  	  	else if(type.equals("transact")){
  	  		TransactReviewBean transactReviewBean = new TransactReviewBean();
  	  		TransactReviewDao transactReviewDao = new TransactReviewDao();
  	  		transactReviewBean.setContent(text);
  	  		transactReviewBean.setTransact_title(title);
  	  		transactReviewBean.setUsername(user.getName());
  	  		transactReviewDao.operationTransactReview("add", transactReviewBean);
  	  	}
  	  	else {
  	  		VideoReviewBean videoReviewBean = new VideoReviewBean();
  	  		VideoReviewDao videoReviewDao = new VideoReviewDao();
  	  		videoReviewBean.setContent(text);
  	  		videoReviewBean.setVideo_title(title);
  	  		videoReviewBean.setUsername(user.getName());
  	  		videoReviewDao.operationVideoReview("add", videoReviewBean);
  	  	}
  	  	String url=request.getHeader("Referer");
		response.sendRedirect(url);
  	%>
  </body>
</html>
