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
<style>video{height:450px;width:680px;}
</style>
</head>
<body class="bg2">
<span class="smalllines">&nbsp;</span>
<!-- Wrapper -->
<div id="wrapper_sec">
	<!-- Top Section -->
    <div class="top_sec">
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
<!--        <!-- Top Section right Links -->
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
	<%
	String title = "";
	if(request.getParameter("title")!=null)
		title = request.getParameter("title");
	VideoDao dao = new VideoDao();
	List<VideoBean> video = new ArrayList<VideoBean>();
	video = dao.queryVideo(-4, title, 0);
	%>
    	<!-- Column 1 -->
        <div class="col1">
            <!-- Video Heading -->
            <div class="allvideos_heading">
            	<h1><%=video.get(0).getTitle() %></h1>
            </div>
            <div class="clear"></div>
            <!-- Video Detail -->
            <div class="videodetail">
            	<!-- Short Detail -->
                <div class="shortdetail">
                	<div class="videoby">
                    	<a href="#" class="videoavatar"><img src="images/videoby.gif" alt="" /></a>
                        <p>用户</p>
                        <a href="#" class="bold name"><%=video.get(0).getUsername() %></a>
                    </div>
                    <div class="videodate"><%=video.get(0).getSdtime().substring(0, 16) %></div>
                    <!--<div class="subscribe"><a href="#">Subscribe</a></div>-->
                    <div class="videoviews"><p>赞： <%=video.get(0).getCount() %></p></div>
                </div>
                <div class="clear"></div>
                <!-- Big Video -->
                <div class="videobig">
                	<video controls="controls" src="<%=video.get(0).getUrl() %>" preload="auto" ></video>
                </div>
                <div class="clear"></div>
                <!-- Video tabs -->
                <div class="videotabs">
                	<div class="tabbuttons">
                	<%
				    	if(user.getName()!=""&&!user.getName().isEmpty()) {
                        	F_VideoDao dao2 = new F_VideoDao();
						  	List<F_VideoBean> list = new ArrayList<F_VideoBean>();
						  	list = dao2.queryFavoriteVideo(0, title, user.getId());
						  	if(list.isEmpty()){
                        %>
                        <ul class="tablinks">
                            <li><a href="service/favorite.jsp?title=<%=title %>"><span class="addto">收藏</span><span class="downarrow">&nbsp;</span></a></li>
                        </ul>
                            <%}
                            else{ %>
                        <ul class="tablinks">
                            <li ><span style="line-height:20px; solid #000;height:50px">已收藏</span></li>
                            <%} %>
                        </ul>
                        <ul class="likedilike">
                            <li><a href="service/like_video.jsp?title=<%=title %>" class="like">赞</a></li>
                        </ul>
                        <%} %>
                    </div>
                    <div class="clear"></div>
                </div>
                <!-- Comments -->
                <div class="comments">
                	<h2 class="heading">评论</h2>
                    <% 
			    	if(user.getName()!=""&&!user.getName().isEmpty()) {
			    	%>
                	<form id="review" name="review" method="post" action="service/do_post_review.jsp?type=video&title=<%=title %>">
	                    <textarea name="text" cols="" rows=""></textarea>
	                    <input class="post" type="submit" name="post" id="post" value="发表"/>
                    </form>
                	<%} %>
                    <ul class="commentslist">
                    <%
                   	VideoReviewDao videoReviewDao1 = new VideoReviewDao();
                   	List<VideoReviewBean> reviewList1 = new ArrayList<VideoReviewBean>();
                   	reviewList1 = videoReviewDao1.queryVideoReview(-1, title, 10);
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
                                <p class="time"><%=reviewList1.get(i).getSdtime().substring(0, 16) %></p>
                                <div class="clear"></div>
                                <p class="txt">
                                	<%=reviewList1.get(i).getContent() %>
                                </p>
                            </div>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <div class="clear"></div>
                <!-- Pagination -->
                <div class="paginations">
                	<h5 class="pagehead">PAGE</h5>
                    <ul>
                    	<li class="leftpage"><a href="#">&nbsp;</a></li>
                        <li class="pages"><a href="#">1</a></li>
                        <li class="pages"><a href="#">2</a></li>
                        <li class="pages"><a href="#">3</a></li>
                        <li class="pages"><a href="#">4</a></li>
                        <li class="pages"><a href="#" class="selected">5</a></li>
                        <li class="pages"><a href="#">6</a></li>
                        <li class="pages"><a href="#">7</a></li>
                        <li class="pages"><a href="#">8</a></li>
                        <li class="pages"><a href="#">9</a></li>
                        <li class="pages"><a href="#">10</a></li>
                        <li class="dots">...</li>
                        <li class="pages"><a href="#">103</a></li>
                        <li class="pages"><a href="#">104</a></li>
                        <li class="nextpage"><a href="#">&nbsp;</a></li>
                    </ul>
                </div>
            </div>
        </div>
         <!-- Column 2 -->
		<div class="col2">
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
                        	<%
                        	VideoDao tab3Dao = new VideoDao();
			                List<VideoBean> videoList2 = new ArrayList<VideoBean>();
			                videoList2 = tab3Dao.queryVideo(0, null, 10);
                        	for(int i=0;i<videoList2.size()&&i<5;i++){
                        	 %>
                            	<li>
                                	<div class="thumb">
                            		<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video5.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp?title=<%=videoList2.get(i).getTitle() %>"><%=videoList2.get(i).getTitle() %></a></h5>
                                        <p class="viewscount"><%=videoList2.get(i).getCount() %>赞</p>
                                        <p class="postedby">用户: <a href="#"><%=videoList2.get(i).getUsername() %></a></p>
                                    </div>
                                </li>
                                <%} %>
                            </ul>			
                        </div> 
                        <!-- END -->
                        <!-- Top Rated -->
                        <div style="display: none;" id="tab_sidebar_comments" class="tab_sidebar_list">  
                            <ul class="videolist">
                            <%
                        	for(int i=0;i<videoList2.size()&&i<5;i++){
                        	 %>
                            	<li>
                                	<div class="thumb">
                                    	<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video8.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp?title=<%=videoList2.get(i).getTitle() %>"><%=videoList2.get(i).getTitle() %></a></h5>
                                        <p class="viewscount"><%=videoList2.get(i).getCount() %>赞</p>
                                        <p class="postedby">用户: <a href="#"><%=videoList2.get(i).getUsername() %></a></p>
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </div> 
                        <!-- END -->
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        	<!-- Advertisment -->
        	
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
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