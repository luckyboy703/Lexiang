<%@page import="com.lexiang.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lexiang.entity.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.lexiang.entity.UserBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>详情页</title>
<!--// Stylesheets //-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="css/scrollbar.css" rel="stylesheet" type="text/css" />
<!--// Javascript //-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/contentslider.js"></script>
<script type="text/javascript" src="js/jquery.1.4.2.js"></script>
<script type="text/javascript" src="js/jquery.lint.js"></script>
<script type="text/javascript" src="js/jquery.scroll.js"></script>
<script type="text/javascript" src="js/scroll.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/switch.js"></script>
<script type="text/javascript" src="js/tabs.js"></script>
<!--<script type="text/javascript" src="js/cufon-yui.js"></script>-->
<script type="text/javascript" src="js/cufon.js"></script>
<script type="text/javascript" src="js/font.js"></script>
<!--[if lte IE 7]><style>.comments .commentlinks{margin-left:250px;}
.comments .singlebtn{margin-left:380px;}
.comments ul li:hover .commentlinks{display:inline-block;}
.comments ul li.level2:hover .commentlinks{margin-left:210px;}
.comments ul li.level2:hover .singlebtn{margin-left:340px;}
</style><![endif]-->
</head>
<body class="bg2">
<span class="smalllines">&nbsp;</span>
<!-- Wrapper -->
<div id="wrapper_sec">
	<!-- Top Section -->
    <div class="top_sec">
    	<!-- Top Section Left Links -->
    	<!-- Top Section Left Links -->
        <div class="toplinks">
        	<ul>
            	<li class="first"><a>欢迎来到乐享世界</a></li>
            	<% String name = user.getName();
            	if(name==""||name.isEmpty()) { %>
            	<li><a>好评哦，亲</a></li>
                <li><a href="login/login.html">登录</a></li>
                <li><a href="login/register.html">注册</a></li>
            	<% }
            	else{ %>
                <li><a><%=name %></a></li>
                <li><a href="service/out.jsp">退出登录</a></li>
                <% } %>
            </ul>
        </div>
        <!-- Top Section right Links -->
        <div class="links_icons">

        </div>
    </div>
    <div class="clear"></div>
    <!-- Header -->
    <div id="masthead">
    	<!-- Logo -->
        <div class="logo">
        	<a href="main.jsp"><img src="images/logo.png" alt="" /></a>
        </div>
        <!-- Navigation -->
        <div class="navigation">
        	<div id="smoothmenu1" class="ddsmoothmenu">
                <ul>
                    <li><a href="main.jsp" class="staticlinks shouye">首页</a></li>
                    <li><a href="video.jsp" class="staticlinks shipin">视频</a>
                   		 <%
				    	if(user.getName()!=""&&!user.getName().isEmpty()) { 
				    	%>
                    	<ul>
                            <li><a href="publishVideo.jsp">发布视频</a></li>
                      	</ul>
                      	<%} %>
                    </li>
                    <li><a href="article.jsp" class="ziyuan">资源</a>
	                    <% 	
				    	if(user.getName()!=""&&!user.getName().isEmpty()) { 
				    	%>
                    	<ul>
                            <li><a href="publishArticle.jsp">发布资源</a></li>
                      	</ul>
                      	<%} %>
                    </li>
                    <li><a href="transact.jsp">交易</a>
                     	<% 	
				    	if(user.getName()!=""&&!user.getName().isEmpty()) { 
				    	%>
                    	<ul>
                            <li><a href="publishTransact.jsp">发布交易</a></li>
                      	</ul>
                      	<%} %>
                    </li>
                    <% 	
			    	String uname = user.getName();
			    	if(uname!=""&&!uname.isEmpty()) { 
			    	%>
                    <li><a href="personal.jsp">个人主页</a>
                    </li>
                    <%} %>
                </ul>
            	<div class="clear"></div>
            </div>
        </div>
        <!-- Search -->
        <div class="search">
        	<input type="text" value="Enter keyword to search" id="searchBox" name="s" onblur="if(this.value == '') { this.value = 'Enter keyword to search'; }" onfocus="if(this.value == 'Enter keyword to search') { this.value = ''; }" class="bar" />
            <a href="#" class="go">&nbsp;</a>
        </div>
    </div>
    <div class="clear"></div>
    <!-- Content Section -->
    <div id="content_sec">
    	<!-- Column 1 -->
	    	<div class="col1">
            <div class="blog">
            	<h2 class="heading">资源详情</h2>
                <ul class="bloglisting">
                <% 
		    	String type="";
		    	String title="";
			    if(request.getParameter("type")!=null&&request.getParameter("title")!=null)
			    	type=request.getParameter("type");
			    	title=request.getParameter("title");
			    if(type.equals("article")){
				    ArticleDao articleDao = new ArticleDao();
			    	List<ArticleBean> articlelist = new ArrayList<ArticleBean>();
			    	articlelist = articleDao.queryArticle(-1, title, 0);
	    		%>
                	<li>
                    	<div class="thumb">
                        	<a href="<%=articlelist.get(0).getImage() %>" target="_Blank"><img width="155" height="113" src="<%=articlelist.get(0).getImage() %>" alt="" /></a>
                        </div>
                        <div class="desc">
                        	<a class="comments_bubble" href="#">赞：<%=articlelist.get(0).getCount() %></a>
                        	<h3 class="colr"><%=articlelist.get(0).getTitle() %></h3>
                            <p class="time"><%=articlelist.get(0).getSdtime().substring(0,16) %></p>
                            <p class="postedby">用户: <%=articlelist.get(0).getUsername() %></p>
                            <div class="clear"></div>
                            <p class="txt">
                            	<%=articlelist.get(0).getContent(0) %>
                            </p>
                        </div>
                    </li>
                <%}
			    else if(type.equals("transact")){
				    TransactDao transactDao = new TransactDao();
			    	List<TransactBean> transactlist = new ArrayList<TransactBean>();
			    	transactlist = transactDao.queryTransact(-1,title, 0);
		    	%>
                	<li>
                    	<div class="thumb">
                        	<a href="<%=transactlist.get(0).getImage() %>" target="_Blank"><img width="155" height="113" src="<%=transactlist.get(0).getImage() %>" alt="" /></a>
                        </div>
                        <div class="desc">
                        	<a class="comments_bubble" href="#"><%=transactlist.get(0).getState() %></a>
                        	<h3 class="colr"><%=transactlist.get(0).getTitle() %></h3>
                            <p class="time"><%=transactlist.get(0).getSdtime().substring(0,16) %></p>
                            <p class="postedby">用户: <%=transactlist.get(0).getUsername() %></p>
                            <div class="clear"></div>
                            <p class="txt">
                            	<%=transactlist.get(0).getContent(0) %>
                            </p>
                        </div>
                    </li>
                    <%} %>
                </ul>
                <div class="clear"></div>
                <!-- Comments -->
                <div class="comments">
                <h2 class="heading">评论</h2>
                <% 
			    	if(user.getName()!=""&&!user.getName().isEmpty()) {
			    	%>
                	<form id="review" name="review" method="post" action="service/do_post_review.jsp?type=<%=type %>&title=<%=title %>">
	                    <textarea name="text" cols="" rows=""></textarea>
	                    <input class="post" type="submit" name="post" id="post" value="发表"/>
                    </form>
                <%} %>
                    <ul class="commentslist">
                    <%
                    if(type.equals("article")){
                    	ArticleReviewDao articleReviewDao1 = new ArticleReviewDao();
                    	List<ArticleReviewBean> reviewList1 = new ArrayList<ArticleReviewBean>();
                    	reviewList1 = articleReviewDao1.queryArticleReview(-1, title, 10);
                    	for(int i=0;i<reviewList1.size();i++){
                    %>
                    	<li class="level1">
                        	<div class="thumb">
                            	<a href="#"><img src="images/comments1.gif" alt="" /></a>
                            </div>
                            <div class="desc">
                            	<div class="commentlinks">
                                    <a href="#" class="reply">Reply</a>
                                    <a href="#" class="like">Like</a>
                                	<a href="#" class="dislike">Dislike</a>
                                </div>
                            	<h5><a href="#" class="colr"><%=reviewList1.get(i).getUsername() %>:</a></h5>
                                <p class="time"><%=reviewList1.get(i).getSdtime().substring(0,16) %></p>
                                <div class="clear"></div>
                                <p class="txt">
                                	<%=reviewList1.get(i).getContent() %>
                                </p>
                            </div>
                        </li>
                        <%
                        	}
                        }
                        else if(type.equals("transact")){
                        	TransactReviewDao transactReviewDao1 = new TransactReviewDao();
	                    	List<TransactReviewBean> reviewList1 = new ArrayList<TransactReviewBean>();
	                    	reviewList1 = transactReviewDao1.queryTransactReview(-1, title, 10);
	                    	for(int i=0;i<reviewList1.size();i++){
                        %>
                        <li class="level1">
                        	<div class="thumb">
                            	<a href="#"><img src="images/comments1.gif" alt="" /></a>
                            </div>
                            <div class="desc">
                            	<div class="commentlinks">
                                    <a href="#" class="reply">Reply</a>
                                    <a href="#" class="like">Like</a>
                                	<a href="#" class="dislike">Dislike</a>
                                </div>
                            	<h5><a href="#" class="colr"><%=reviewList1.get(i).getUsername() %>:</a></h5>
                                <p class="time"><%=reviewList1.get(i).getSdtime().substring(0,16) %></p>
                                <div class="clear"></div>
                                <p class="txt">
                                	<%=reviewList1.get(i).getContent() %>
                                </p>
                            </div>
                        </li>
                        <%
                        	}
                        } %>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!-- Column 2 -->
        <div class="col2">
        	<!-- Categories -->
            <div class="categories">
            	<h5>热门分类</h5>
                <ul>
                	<li><a href="#" class="colr">吉他</a></li>
                    <li><a href="#" class="colr">钢琴</a></li>
                    <li><a href="#" class="colr">租赁</a></li>
                    <li><a href="#" class="colr">二手乐器</a></li>
                    <li><a href="#" class="colr">吉他谱</a></li>
                    <li><a href="#" class="colr">教学</a></li>
                    <li><a href="#" class="colr">搞笑</a></li>
                    <li><a href="#" class="colr">贝斯</a></li>
                    <li><a href="#" class="colr">架子鼓</a></li>
                    <li><a href="#" class="colr">乐队</a></li>
                </ul>
                <ul>
                	<li><a href="#" class="colr">音乐节</a></li>
                    <li><a href="#" class="colr">原创</a></li>
                    <li><a href="#" class="colr">弹唱</a></li>
                    <li><a href="#" class="colr">民乐</a></li>
                    <li><a href="#" class="colr">西洋乐器</a></li>
                    <li><a href="#" class="colr">美女</a></li>
                    <li><a href="#" class="colr">火锅</a></li>
                    <li><a href="#" class="colr">词曲</a></li>
                    <li><a href="#" class="colr">自拍</a></li>
                    <li><a href="#" class="colr">排练室</a></li>
                </ul>
            </div>
  <div class="clear"></div>
        	<!-- Tabs -->
            <div class="tabs">
            	<div class="tab_menu_container">
                    <ul id="tab_menu">  
                        <li><a class="current" rel="tab_sidebar_recent">最新</a></li>
                        <li><a class="" rel="tab_sidebar_comments">评论</a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
                
                <div class="tab_container">
                    <div class="tab_container_in">
                        <!-- Recent --> 
                        <div style="display: none;" id="tab_sidebar_recent" class="tab_sidebar_list">					
                        	<ul class="videolist">
                            	<li>
                                	<div class="thumb">
                            		<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video5.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">张建洋</a></p>
                                    </div>
                                </li>
                                <li>
                                	<div class="thumb">
                            		<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video5.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">温思嘉</a></p>
                                    </div>
                                </li>
                                <li>
                                	<div class="thumb">
                                    	<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video7.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">马新宇</a></p>
                                    </div>
                                </li>
                                <li>
                                	<div class="thumb">
                                    	<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video8.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">张云浩</a></p>
                                    </div>
                                </li>
                            </ul>			
                        </div> 
                        <!-- END -->
                        <!-- Top Rated -->
                        <div style="display: none;" id="tab_sidebar_comments" class="tab_sidebar_list">  
                            <ul class="videolist">
                            	<li>
                                	<div class="thumb">
                                    	<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video8.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">张鑫鑫</a></p>
                                    </div>
                                </li>
                                <li>
                                	<div class="thumb">
                                    	<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video7.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">陈国庆</a></p>
                                    </div>
                                </li>
                                <li>
                                	<div class="thumb">
                            		<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video5.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">路人甲</a></p>
                                    </div>
                                </li>
                                <li>
                                	<div class="thumb">
                            		<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video5.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp">找自己</a></h5>
                                        <p class="viewscount">点击 2,061,785</p>
                                        <p class="postedby">用户: <a href="#">汪汪</a></p>
                                    </div>
                                </li>
                            </ul>
                        </div> 
                        <!-- END -->
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        	<!-- Top Searches -->
            <div class="topsearches">
            	<h5>最热搜索资源</h5>
                <ul>
                	<li><a href="#" class="colr">吉他谱</a></li>
                    <li><a href="#" class="colr">钢琴谱</a></li>
                    <li><a href="#" class="colr">GTP</a></li>
                    <li><a href="#" class="colr">简谱</a></li>
                    <li><a href="#" class="colr">展示</a></li>
                    <li><a href="#" class="colr">吉他谱</a></li>
                    <li><a href="#" class="colr">钢琴谱</a></li>
                    <li><a href="#" class="colr">GTP</a></li>
                    <li><a href="#" class="colr">简谱</a></li>
                    <li><a href="#" class="colr">展示</a></li>
                    <li><a href="#" class="colr">吉他谱</a></li>
                    <li><a href="#" class="colr">钢琴谱</a></li>
                    <li><a href="#" class="colr">GTP</a></li>
                    <li><a href="#" class="colr">简谱</a></li>
                    <li><a href="#" class="colr">展示</a></li>
                    <li><a href="#" class="colr">吉他谱</a></li>
                    <li><a href="#" class="colr">钢琴谱</a></li>
                    <li><a href="#" class="colr">GTP</a></li>
                    <li><a href="#" class="colr">简谱</a></li>
                    <li><a href="#" class="colr">展示</a></li>
                </ul>
                <a href="#" class="buttonone"><span>最热资源</span></a>
                <a href="#" class="buttonone"><span>最近上传</span></a>
            </div>
            <div class="clear"></div>
            <!-- Advertisment -->
        	<div class="clear"></div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div id="footer">
	<div class="inner">
<!-- Footer -->
<div id="footer">
	<div class="inner">
    	<!-- Top button Section -->
        <div class="topbutonsec"><a href="#">Top</a></div>
        <div class="clear"></div>
        <!-- Footer - Search - Share -->
        <div class="foot_search_share">
        	<!-- Footer - search -->
        	<div class="foot_search">
            	<input type="text" value="Enter keyword to search" id="searchBox2" name="s" onblur="if(this.value == '') { this.value = 'Enter keyword to search'; }" onfocus="if(this.value == 'Enter keyword to search') { this.value = ''; }" class="bar" />
            	<a href="#" class="searchbtn buttonone right"><span>Search</span></a>
            </div>
            <!-- Footer -share -->
            <div class="share">
            	<a href="#"><img src="images/facebook.png" alt="" /></a>
                <a href="#"><img src="images/twitter.png" alt="" /></a>
                <a href="#"><img src="images/youtube.png" alt="" /></a>
                
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <!-- Footer content -->
        <div class="footer_cont">
        	<!-- Footer sec1 -->
          <div class="footer_sec1">
            	<!-- Footer logo -->
            <div class="foot_logo">
                	<a href="#"><img src="images/logo.png" alt="" /></a>
                    <a>乐享无限—竭诚为您服务</a>
                </div>
                <!-- Footer - our network -->
                <!-- Footer - rules policies -->
                <div class="rulespolices">
                	<h3>Rules &amp; Policies</h3>
                    <ul>
                    	<li><a href="#">Usage Rules</a></li>
                        <li><a href="#">Copyright</a></li>
                        <li><a href="#">Privacy</a></li>
                    </ul>
            </div>
          </div>
            <!-- Footer sec2 -->
          <div class="footer_sec2">
            	<!-- Footer - about us -->
            <div class="aboutus">
                	<h3>About Us</h3>
                    <ul>
                    	<li><a href="#">See what's new on our blog</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">Terms of Use Podcast</a></li>
                        <li><a href="#">Partners</a></li>
                        <li><a href="#">Contact Advertise</a></li>
                    </ul>
                </div>
                <!-- Footer - information -->
          </div>
            <!-- Footer sec3 -->
            <div class="footer_sec3">
           	<!-- Footer - recomended -->
           	<div class="ournetwork">
           	  <h3>Our Network</h3>
           	  <ul>
           	    <li><a href="#" class="youtube">www.renren.com</a></li>
           	    <li><a href="#" class="flickr">www.tudou.com</a></li>
           	    <li><a href="#" class="facebook">www.youku.com</a>
           	      <div class="inforamtion">
           	        <h3>Inforamtion</h3>
           	        <ul>
           	          <li><a href="#">Help</a></li>
           	          <li><a href="#">Imprint</a></li>
           	          <li><a href="#">Copyright Agent</a></li>
       	            </ul>
       	          </div>
           	    </li>
       	      </ul>
         	  </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="clear"></div>
<div id="copyrights">
	<div class="inner">
    	<p></p>
        
    </div>
</div>

</body>
</html>
