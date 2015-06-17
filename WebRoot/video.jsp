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
<title>视频</title>
<!--// Stylesheets //-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="css/scrollbar.css" rel="stylesheet" type="text/css" />

<style>

.ddsmoothmenu  .shipin{
background: #3b3b3b; /*background of menu items during onmouseover (hover state)*/
color: white;
border:#4e4e4e solid 1px;
border-bottom:none;
}
.featured_playlist ul li .desc a:hover{
	color:blue;
	}
</style>
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
                    <li><a href="main.jsp" class="staticlinks">首页</a></li>
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
    	<!-- Bread Crumb -->
        <div id="crumb">
        	<h5>啦啦啦啦</h5>
            <ul>
                <li><a href="#"></a></li>
            </ul>
        </div>
    	<!-- Column 1 -->
        <div class="col1">
            <div class="allvideos_heading">
            	<h3>所有视频</h3>
            </div>
            <div class="clear"></div>
            <!-- White Section small -->
            <div class="whitesec_search">
            	<p>极限音乐玩客的精彩视频</p>
                <div class="smallsearch">
                	<input type="text" value="Enter keyword to search" id="searchBox3" name="s" onblur="if(this.value == '') { this.value = 'Enter keyword to search'; }" onfocus="if(this.value == 'Enter keyword to search') { this.value = ''; }" class="bar" />
            		<a href="#" class="buttonone"><span>查询</span></a>
                </div>
            </div>
            <div class="clear"></div>
            <!-- Recent Videos -->
            <div class="recent_videos">
            	<div class="recent_head">
                	<ul class="videocat">
                    	<li>筛选: </li>
                        <li><a href="video.jsp?sort=最新">最近添加</a></li>
                        <li><a href="video.jsp?sort=最热">最热门</a></li>
                        <li class="last"><a href="video.jsp?sort=最长">视频时长</a></li>
                    </ul>
                    <div class="recent_buttons">
                    	<ul>
                        	<li class="gridbutn"><a href="#" class="switch_thumb">&nbsp;</a></li>
                            <li>
                            	<a href="#" class="previousbtn">&nbsp;</a>
                                <a href="#" class="nextbtn">&nbsp;</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
                <!-- Video Listing -->
                <ul class="display">
	                <%
	                VideoDao Dao = new VideoDao();
	                List<VideoBean> videoList2 = new ArrayList<VideoBean>();
	                String sort="";
	                if(request.getParameter("sort")!=null)
	                	sort=request.getParameter("sort");
	                if(sort.equals("最热"))
	                	videoList2 = Dao.queryVideo(-1, null, 10);
	                else if(sort.equals("最长"))
	                	videoList2 = Dao.queryVideo(-2, null, 10);
	                else
	                	videoList2 = Dao.queryVideo(0, null, 10);
	                V_RelationDao TypeDao = new V_RelationDao();
	                for(int j = 0;j<videoList2.size();j++){
	                %>
                	<li>
                    	<a href="detailOfVideo.jsp?title=<%=videoList2.get(j).getTitle() %>" class="thumb"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="<%=videoList2.get(j).getImage() %>" alt="" width="155" height="114" /></a>
                  <div class="bigsec">
                        	<h4><a href="detailOfVideo.jsp?title=<%=videoList2.get(j).getTitle() %>" class="colr"><%=videoList2.get(j).getTitle() %></a></h4>
                            <div class="clear"></div>
                            <div class="yourhere">
                            	<p>属性:</p>
                            	<%
                            	List<VideoTypeBean> typeList = TypeDao.queryAllType(videoList2.get(j).getId(), 10);
                            	for(int i=0;i<typeList.size();i++){
                            		if(i<typeList.size()-1){
                            	 %>
                                <a href="#"><%=typeList.get(i).getName() %></a>
                                <%
                                	}
                                	else{
                                 %>
                                <a href="#" class="last"><%=typeList.get(i).getName() %></a>
                                <%
                                	}
                                } %>
                            </div>
                            <div class="clear"></div>
                            <p class="txt">
                            	<%=videoList2.get(j).getDescribe() %>
            				</p>
                            <div class="clear"></div>
                            <div class="postedby">
                            	<p class="postbytxt">昵称: <a href="#"><%=videoList2.get(j).getUsername() %></a></p>
                                <p class="views"><span class="left">赞: </span><a href="#"><%=videoList2.get(j).getCount() %></a></p>
                            </div>
                            <div class="right">
                            	<p class="time"><%=videoList2.get(j).getLength().substring(3) %></p>
                            	<p class="date"><span><%=videoList2.get(j).getSdtime().substring(5, 16) %></span></p>
                                <div class="rating">
                                    <a href="#" class="colrd">&nbsp;</a>
                                    <a href="#" class="colrd">&nbsp;</a>
                                    <a href="#" class="colrd">&nbsp;</a>
                                    <a href="#" class="colrd">&nbsp;</a>
                                    <a href="#" class="greyscal">&nbsp;</a>
                                </div>
                            </div>
                      </div>
                      	<div class="smallsec">
                        	<h6><a href="detailOfVideo.jsp?title=<%=videoList2.get(j).getTitle() %>" class="colr"><%=videoList2.get(j).getTitle() %></a></h6>
                            <div class="clear"></div>
                            <p class="time"><%=videoList2.get(j).getLength().substring(3) %></p>
                            <p class="date"><%=videoList2.get(j).getSdtime().substring(5, 16) %></p>
                            <div class="clear"></div>
                            <div class="rating">
                            	<a href="#" class="colrd">&nbsp;</a>
                                <a href="#" class="colrd">&nbsp;</a>
                                <a href="#" class="colrd">&nbsp;</a>
                                <a href="#" class="colrd">&nbsp;</a>
                                <a href="#" class="greyscal">&nbsp;</a>
                                <p class="views">赞：<%=videoList2.get(j).getCount() %></p>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </li>
                    <%
                    } %>
                </ul>
    <div class="clear"></div>
                <!-- Pagination -->
                <div class="paginations">
                	
                </div>
            </div>
        </div>
        <!-- Column 2 -->
        <div class="col2">
        	<!-- Categories -->
            <div class="categories">
            	<h5>热门分类</h5>
                <%
            	V_RelationDao typeRankDao = new V_RelationDao();
            	List<String> typeList = new ArrayList<String>();
            	typeList = typeRankDao.queryTypeRank();
            	for(int i=0;i<typeList.size();i++){
            	%>
                <ul>
                	<li><a href="#" class="colr"><%=typeList.get(i) %></a></li>
                    
                </ul>
                <%
                if(++i<typeList.size()){
                 %>
                <ul>
                	<li><a href="#" class="colr"><%=typeList.get(i) %></a></li>
                    
                </ul>
                <%}
                } %>
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
                        	<%
                        	VideoDao Dao1 = new VideoDao();
			                List<VideoBean> videoList3 = new ArrayList<VideoBean>();
			                videoList3 = Dao1.queryVideo(0, null, 10);
                        	for(int i=0;i<videoList3.size()&&i<4;i++){
                        	 %>
                            	<li>
                                	<div class="thumb">
                            		<a href="detailOfVideo.jsp?title=<%=videoList3.get(i).getTitle() %>"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="<%=videoList3.get(i).getImage() %>" alt="" width="102" height="66"/></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp?title=<%=videoList3.get(i).getTitle() %>"><%=videoList3.get(i).getTitle() %></a></h5>
                                        <p class="viewscount"><%=videoList3.get(i).getCount() %>赞</p>
                                        <p class="postedby">用户: <a href="#"><%=videoList3.get(i).getUsername() %></a></p>
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
                        	for(int i=0;i<videoList3.size()&&i<4;i++){
                        	 %>
                            	<li>
                                	<div class="thumb">
                                    	<a href="detailOfVideo.jsp?title=<%=videoList3.get(i).getTitle() %>"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="<%=videoList3.get(i).getImage() %>" alt="" width="102" height="66"/></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="detailOfVideo.jsp?title=<%=videoList3.get(i).getTitle() %>"><%=videoList3.get(i).getTitle() %></a></h5>
                                        <p class="viewscount"><%=videoList3.get(i).getCount() %>赞</p>
                                        <p class="postedby">用户: <a href="#"><%=videoList3.get(i).getUsername() %></a></p>
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
