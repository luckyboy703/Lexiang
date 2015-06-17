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
<title>个人主页</title>
<!--// Stylesheets //-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/ddsmoothmenu.css" rel="stylesheet" type="text/css" />
<link href="css/scrollbar.css" rel="stylesheet" type="text/css" />
<style>

.ddsmoothmenu  .gerenzhuye{
background: #3b3b3b; /*background of menu items during onmouseover (hover state)*/
color: white;
border:#4e4e4e solid 1px;
border-bottom:none;
}
.featured_playlist ul li .desc a:hover{
	color:blue;
	}
	
.col1 {
    float: left;
    width: 997px;
	position:relative;
}
.ax_shape{
	cursor:pointer;
}
.xie{
	position:absolute;
	top:55px;
	left: 2px;
	width: 559px;
	height: 297px;
}
.news ul.newslisting lie{
	background-color: #fbfbfb;
    background-image: url("../images/news_bg.gif");
    background-repeat: repeat-x;
    border: 1px solid #cccccc;
    float: left;
    padding: 10px;
    width: 550px;
}
.yema{
	float: left;
	height: 50px;
	width: 570px;
	top: 400px;
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
<!--<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon.js"></script>

<script type="text/javascript" src="js/font.js"></script>-->


<script type="text/javascript" src="js/axutils.js"></script>
<script type="text/javascript" src="js/axQuery.js"></script>
<script type="text/javascript" src="js/repeater.js"></script>
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
        	<ul>
            	
          </ul>
        </div>
</div>
    <div class="clear"></div>
    <!-- Header -->
    <div id="masthead">
    	<!-- Logo -->
        <div class="logo">
        	<a href="index.html"><img src="images/logo.png" alt="" /></a>
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
                    <li><a href="article.jsp">资源</a>
                    	<ul>
                            <li><a href="publishArticle.jsp">发布资源</a></li>
                      	</ul>
          </li>
                    <li><a href="transact.jsp">交易</a>
                    	<ul>
                            <li><a href="publishTransact.jsp">发布交易</a></li>
                      	</ul>
                    </li>
                    <li><a href="personal.jsp" class="staticlinks gerenzhuye">个人主页</a>
                    </li>
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
    <!-- Banner -->
<div class="clear"></div>
    <p><!-- Content Section -->
      <div id="content_sec">
      <!-- Column 1 -->
      <div class="col1">
      <!-- Featured Playlist -->
  <!-- Rectangle (Shape) -->
            <div id="u354" class="ax_shape" data-label="Rectangle">
              <img id="u354_img" class="img " src="images/吉他/rectangle_u354.png"/>
              <!-- Unnamed () -->
              <div id="u355" class="text">
                <p><span></span></p>
              </div>
</div>
            <!-- Line Horizontal (Horizontal Line) -->
            <div id="u356" class="ax_horizontal_line" data-label="Line Horizontal"> 
              <img id="u356_start" class="img " src="resources/images/transparent.gif" alt="u356_start"/>
              <img id="u356_end" class="img " src="resources/images/transparent.gif" alt="u356_end"/>
              <img id="u356_line" class="img " src="images/吉他/line_horizontal_u356_line.png" alt="u356_line"/>
            </div>

            <!-- Image (Image) -->
            <div id="u357" class="ax_image" data-label="Image">
              <img id="u357_img" class="img " src="images/touxiang.jpg"/>
              <!-- Unnamed () -->
              <div id="u358" class="text">
                <p><span></span></p>
              </div>
            </div>

            <!-- Rectangle (Shape) -->
            <div id="u359" class="ax_shape" data-label="Rectangle">
              <img id="u359_img" class="img " src="images/吉他/rectangle_u359.png"/>
              <!-- Unnamed () -->
              <div id="u360" class="text">
                <p><span><center>我的收藏</center></span></p>
              </div>
            </div>

            <!-- Rectangle (Shape) -->
            <div id="u361" class="ax_shape" data-label="Rectangle">
              <img id="u361_img" class="img " src="images/吉他/rectangle_u359.png"/>
              <!-- Unnamed () -->
              <div id="u362" class="text">
                <p><span><center>我的视频</center></span></p>
              </div>
            </div>

            <!-- Rectangle (Shape) -->
            <div id="u363" class="ax_shape" data-label="Rectangle">
              <img id="u363_img" class="img " src="images/吉他/rectangle_u359.png"/>
              <!-- Unnamed () -->
              <div id="u364" class="text">
                <p><span><center>我的资源</center></span></p>
              </div>
            </div>

            <!-- Rectangle (Shape) -->
            <div id="u365" class="ax_shape" data-label="Rectangle">
              <img id="u365_img" class="img " src="images/吉他/rectangle_u359.png"/>
              <!-- Unnamed () -->
              <div id="u366" class="text">
                <p><span><center>我的交易</center></span></p>
              </div>
            </div>

            <!-- Text (Shape) -->
            <div id="u367" class="ax_paragraph" data-label="Text">
              <img id="u367_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u368" class="text">
                <p><span>用户名</span><span>：<%=user.getName() %></span></p>
              </div>
            </div>

            <!-- Text (Shape) -->
            <div id="u369" class="ax_paragraph" data-label="Text">
              <img id="u369_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u370" class="text">
                <p><span>所在地：</span><%=user.getAddress() %></p>
              </div>
            </div>

            <!-- Text (Shape) -->
            <div id="u371" class="ax_paragraph" data-label="Text">
              <img id="u371_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u372" class="text">
                <p><span>乐器喜好：</span><%=user.getInstrument() %></p>
              </div>
            </div>

            <!-- Text (Shape) -->
            <div id="u373" class="ax_paragraph" data-label="Text">
              <img id="u373_img" class="img " src="resources/images/transparent.gif"/>
              <!-- Unnamed () -->
              <div id="u374" class="text">
                <p><span>我的简介</span><span><%=user.getIntroduction() %></span></p>
              </div>
            </div>
            
<div data-label="我的**" class="ax_dynamic_panel" id="u377">
            <div data-label="收藏" class="panel_state" id="u377_state0" style="width: 580px; height: 440px; visibility: hidden; display: none;">
                <div class="panel_state_content" id="u377_state0_content">

                  <!-- Rectangle (Shape) -->
                  <div data-label="Rectangle" class="ax_shape" id="u378" style="">
                    <img src="images/吉他/rectangle_u378.png" class="img " id="u378_img">
                    <div class="xie"><div class="news">
                	<ul class="newslisting">
                	<%
                	F_VideoDao f_VideoDao = new F_VideoDao();
	                List<F_VideoBean> MyFavorite = new ArrayList<F_VideoBean>();
	                MyFavorite = f_VideoDao.queryFavoriteVideo(-1, user.getName(), 0);
                	for(int i=0;i<MyFavorite.size()&&i<3;i++){
                	 %>
                	<lie>
                    	<div class="date">
                        	<p><%=MyFavorite.get(i).getSdtime().substring(0,4) %> <%=MyFavorite.get(i).getSdtime().substring(5,7) %></p>
                            <h1><%=MyFavorite.get(i).getSdtime().substring(8,10) %></h1>
                        </div>
                        <div class="lie">
                          <h4><a href="detailOfVideo.jsp?title=<%=MyFavorite.get(i).getTitle() %>" class="colr"><%=MyFavorite.get(i).getTitle() %></a></h4>
                      </div>
                     </lie>
                     <%} %>
                    </ul>
                    </div>
<div class="paginations">
                	
                </div>

                      </div>
                    <!-- Unnamed () -->
                    <div class="text" id="u379" style="top: 220px; transform-origin: 288px 0px 0px;">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Line Horizontal (Horizontal Line) -->
                  <div data-label="Line Horizontal" class="ax_horizontal_line" id="u380" style="">
                    <img alt="u380_start" src="resources/images/transparent.gif" class="img " id="u380_start">
                    <img alt="u380_end" src="resources/images/transparent.gif" class="img " id="u380_end">
                    <img alt="u380_line" src="images/吉他/line_horizontal_u356_line.png" class="img " id="u380_line">
                  </div>

                  <!-- Header 2 (Shape) -->
                  <div data-label="Header 2" class="ax_paragraph" id="u381" style="">
                    <img src="resources/images/transparent.gif" class="img " id="u381_img">
                    <!-- Unnamed () -->
                    <div class="text" id="u382">
                      <p><span>我的收藏</span></p>
                    </div>
                  </div>
                </div>
              </div><div data-label="视频" class="panel_state" id="u377_state1" style="visibility: hidden; width: 580px; height: 440px; display: none;">
                <div class="panel_state_content" id="u377_state1_content">

                  <!-- Rectangle (Shape) -->
                  <div data-label="Rectangle" class="ax_shape" id="u383" style="">
                    <img src="images/吉他/rectangle_u378.png" class="img " id="u383_img">
                    <div class="xie"><div class="news">
                <ul class="newslisting">
                <%
                VideoDao videoDao = new VideoDao();
                List<VideoBean> videoList = new ArrayList<VideoBean>();
                videoList = videoDao.queryVideo(-3, user.getName(), 10);
                V_RelationDao videoTypeDao = new V_RelationDao();
                for(int i=0;i<videoList.size()&&i<1;i++){
                %>
                	<lie>
                    	<a href="detailOfVideo.jsp?title=<%=videoList.get(i).getTitle() %>" class="thumb"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="<%=videoList.get(i).getImage() %>" alt="" width="102" height="66"/></a>
                        <div class="bigsec">
                        	<h4><a href="detailOfVideo.jsp?title=<%=videoList.get(i).getTitle() %>" class="colr"><%=videoList.get(i).getTitle() %></a></h4>
                            <div class="clear"></div>
                            <div class="yourhere">
                            	<p>属性:
                                <%
                            	List<VideoTypeBean> typeList1 = videoTypeDao.queryAllType(videoList.get(i).getId(), 10);
                            	for(int j=0;j<typeList1.size();j++){
                            		if(j<typeList1.size()-1){
                            	 %>
                                <a href="#"><%=typeList1.get(j).getName() %></a>
                                <%
                                	}
                                	else{
                                 %>
                                <a href="#" class="last"><%=typeList1.get(j).getName() %></a>
                                <%
                                	}
                                } %>
                                </p>
                            </div>
                            <div class="clear"></div>
                            <p class="txt">
                            	简介：<%=videoList.get(i).getDescribe() %>
                            </p>
                            <div class="clear"></div>
                            <div class="postedby">
                            	<p class="postbytxt">昵称: <a href="#"><%=videoList.get(i).getUsername() %></a></p>
                                <p class="views"><span class="left">赞: </span><a href="#"><%=videoList.get(i).getCount() %></a></p>
                            </div>
                            <div class="right">
                            </div>
                        </div>
                    </lie>
                    <%} %>
                    </ul>
                    </div>
<div class="paginations">
                	
                </div>

                      </div>
                    <!-- Unnamed () -->
                    <div class="text" id="u384" style="top: 220px; transform-origin: 288px 0px 0px;">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Line Horizontal (Horizontal Line) -->
                  <div data-label="Line Horizontal" class="ax_horizontal_line" id="u385" style="">
                    <img alt="u385_start" src="resources/images/transparent.gif" class="img " id="u385_start">
                    <img alt="u385_end" src="resources/images/transparent.gif" class="img " id="u385_end">
                    <img alt="u385_line" src="images/吉他/line_horizontal_u356_line.png" class="img " id="u385_line">
                  </div>

                  <!-- Header 2 (Shape) -->
                  <div data-label="Header 2" class="ax_paragraph" id="u386" style="">
                    <img src="resources/images/transparent.gif" class="img " id="u386_img">
                    <!-- Unnamed () -->
                    <div class="text" id="u387">
                      <p><span>我的</span><span>视频</span></p>
                    </div>
                  </div>
                </div>
              </div><div data-label="资源" class="panel_state" id="u377_state2" style="visibility: hidden; width: 580px; height: 440px; display: none;">
                <div class="panel_state_content" id="u377_state2_content">

                  <!-- Rectangle (Shape) -->
                  <div data-label="Rectangle" class="ax_shape" id="u388" style="">
                    <img src="images/吉他/rectangle_u378.png" class="img " id="u388_img">
                    <div class="xie"><div class="news">
                <ul class="newslisting">
                	<%
	                ArticleDao articleDao = new ArticleDao();
	                List<ArticleBean> articleList = new ArrayList<ArticleBean>();
	                articleList = articleDao.queryArticle(-2, user.getName(),10);
	                A_RelationDao articleTypeDao = new A_RelationDao();
	                for(int i=0;i<articleList.size()&&i<3;i++){
	                %>
                	<lie>
                    	<div class="date">
                        	<p><%=articleList.get(i).getSdtime().substring(0,4) %> <%=articleList.get(i).getSdtime().substring(5,7) %></p>
                            <h1><%=articleList.get(i).getSdtime().substring(8,10) %></h1>
                        </div>
                        <div class="lie">
                          <h4><a href="detailOfArticle&Transact.jsp?type=article&title=<%=articleList.get(i).getTitle() %>" class="colr"><%=articleList.get(i).getTitle() %></a></h4>
                            <p class="txt">
                            <%=articleList.get(i).getInfo() %>
                            	<a href="#">点击查看</a><a href="#" class="catbtn">吉他谱</a>
                            </p>
                      </div>
                    </lie>
                    <%} %>
                    </ul>
                    </div>
<div class="paginations">
                	
                </div>

                      </div>
                    <!-- Unnamed () -->
                    <div class="text" id="u389" style="top: 220px; transform-origin: 288px 0px 0px;">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Line Horizontal (Horizontal Line) -->
                  <div data-label="Line Horizontal" class="ax_horizontal_line" id="u390" style="">
                    <img alt="u390_start" src="resources/images/transparent.gif" class="img " id="u390_start">
                    <img alt="u390_end" src="resources/images/transparent.gif" class="img " id="u390_end">
                    <img alt="u390_line" src="images/吉他/line_horizontal_u356_line.png" class="img " id="u390_line">
                  </div>

                  <!-- Header 2 (Shape) -->
                  <div data-label="Header 2" class="ax_paragraph" id="u391" style="">
                    <img src="resources/images/transparent.gif" class="img " id="u391_img">
                     
                    <!-- Unnamed () -->
                    <div class="text" id="u392">
                      <p><span>我的</span><span>资源</span></p>
                    </div>
                  </div>
                </div>
              </div><div data-label="交易" class="panel_state" id="u377_state3" style="visibility: visible; width: 580px; height: 440px;">
                <div class="panel_state_content" id="u377_state3_content">

                  <!-- Rectangle (Shape) -->
                  <div data-label="Rectangle" class="ax_shape" id="u393" style="">
                    <img src="images/吉他/rectangle_u378.png" height="418" class="img " id="u393_img">

                    <div class="xie"><div class="news">
                <ul class="newslisting">
                	<%
	                TransactDao transactDao = new TransactDao();
	                List<TransactBean> transactList = new ArrayList<TransactBean>();
	                transactList = transactDao.queryTransact(-2, user.getName(), 10);
	                T_RelationDao transactTypeDao = new T_RelationDao();
	                for(int i=0;i<transactList.size()&&i<1;i++){
	                %>
                	<lie>
                    	<div class="thumb">
                        	<a href="detailOfArticle&Transact.jsp?type=transact&title=<%=transactList.get(i).getTitle() %>"><img width="155" height="113" src="<%=transactList.get(i).getImage() %>" alt="" /></a>
                        </div>
                        <div class="desc">
                        	<a class="comments_bubble" href="#"><%=transactList.get(i).getState() %></a>
                        	<h3><a href="detailOfArticle&Transact.jsp?type=transact&title=<%=transactList.get(i).getTitle() %>" class="colr"><%=transactList.get(i).getTitle() %></a></h3>
                            <p class="time"><%=transactList.get(i).getSdtime().substring(0,16) %></p>
                            <p class="postedby">用户: <%=transactList.get(i).getUsername() %></p>
                            <div class="clear"></div>
                            <p class="txt">
                            	<%=transactList.get(i).getContent(50) %>  <a href="detailOfArticle&Transact.jsp?type=transact&title=<%=transactList.get(i).getTitle() %>" class="colr readmore">了解更多</a>
                            </p>
                        </div>
                    </lie>
                    <%} %>
                    </ul>
                    </div>
<div class="paginations">
                	
                </div>

                      </div>
                    <!-- Unnamed () -->
                    <div class="text" id="u394" style="top: 220px; transform-origin: 288px 0px 0px;">
                      <p><span></span></p>
                    </div>
                  </div>

                  <!-- Line Horizontal (Horizontal Line) -->
                  <div data-label="Line Horizontal" class="ax_horizontal_line" id="u395" style="">
                    <img alt="u395_start" src="resources/images/transparent.gif" class="img " id="u395_start">
                    <img alt="u395_end" src="resources/images/transparent.gif" class="img " id="u395_end">
                    <img alt="u395_line" src="images/吉他/line_horizontal_u356_line.png" class="img " id="u395_line">
                  </div>

                  <!-- Header 2 (Shape) -->
                  <div data-label="Header 2" class="ax_paragraph" id="u396" style="">
                    <img src="resources/images/transparent.gif" class="img " id="u396_img">
                    <!-- Unnamed () -->
                    <div class="text" id="u397">
                      <p><span>我的</span><span>交易</span></p>
                    </div>
                  </div>
                </div>
              </div></div>
              
              
        <!-- Column 2 -->
<div class="col2">
            <!-- Tabs -->
            <div class="tabs">
            	<div class="tab_menu_container">
                    <ul id="tab_menu">  
                        <li><a class="current" rel="tab_sidebar_recent">&nbsp;&nbsp;&nbsp;&nbsp;我关注的达人&nbsp;&nbsp;</a></li>
                        <li><a class="" rel="tab_sidebar_comments">&nbsp;&nbsp;关注我的朋友&nbsp;&nbsp;&nbsp;</a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
                <%
                FriendBean friend = new FriendBean();
                FriendDao friendDao = new FriendDao();
                List<FriendBean> friendlist = new ArrayList<FriendBean>();
                friendlist = friendDao.queryFriend(user.getId());
                 %>
                <div class="tab_container">
                    <div class="tab_container_in">
                        <!-- Recent --> 
                        <div style="display: none;" id="tab_sidebar_recent" class="tab_sidebar_list">					
                        	<ul class="videolist">
                        	<%
                        	for(int i=0;i<friendlist.size()&&i<5;i++){
                        	 %>
                            	<li>
                                	<div class="thumb">
                            		<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video5.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="#"><%=friendlist.get(i).getName() %></a></h5>
                                        <p class="viewscount">乐器： <%=friendlist.get(i).getInstrument() %></p>
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
                            FriendDao friendedDao = new FriendDao();
                            List<UserBean> friendedlist = new ArrayList<UserBean>();
                            friendedlist = friendedDao.queryFriended(user.getName());
                            for(int i=0;i<friendedlist.size()&&i<5;i++){
                             %>
                            	<li>
                                	<div class="thumb">
                                    	<a href="#"><span class="add">&nbsp;</span><span class="rated">&nbsp;</span><img src="images/video8.gif" alt="" /></a>
                                    </div>
                                    <div class="desc">
                                    	<h5><a class="colr title" href="#"><%=friendedlist.get(i).getName() %></a></h5>
                                        <p class="viewscount">乐器： <%=friendedlist.get(i).getInstrument() %></p>
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
            <!-- Categories -->
            <div class="categories">
            	<h5><wbr>热门分类</wbr></h5>
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
    <!-- Top Searches --></div>
    </div>
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
<script>

$(function(){

document.querySelector("#u359").onclick=function(){
		 none()
		document.querySelector("#u377_state0").style.display="block";
		document.querySelector("#u377_state0").style.visibility="visible"
}
document.querySelector("#u361").onclick=function(){
		 none()
		document.querySelector("#u377_state1").style.display="block";
		document.querySelector("#u377_state1").style.visibility="visible"
}	
document.querySelector("#u363").onclick=function(){
		 none()
		document.querySelector("#u377_state2").style.display="block";
		document.querySelector("#u377_state2").style.visibility="visible"
}	
	
document.querySelector("#u365").onclick=function(){
		 none()
		document.querySelector("#u377_state3").style.display="block";
		document.querySelector("#u377_state3").style.visibility="visible"
}	
		
	function none(){
		var u377=document.querySelector("#u377");
		for(var i=0;i<u377.children.length;i++){
			u377.children[i].style.display="none";
			}
	}
		
var u377=document.querySelector("#u377 img");
		for(var i=0;i<u377.length;i++){
			u377[i].style.height="400px";
			}
	
})
</script>
</body>
</html>
