<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.lexiang.entity.UserBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发布资源</title>
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
<!--        <!-- Top Section right Links -->
        <div class="links_icons">

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
            <div class="contact">
                <div class="getintouch">
                	<h3 class="colr">发布资源</h3>
                	<%
                	session.setAttribute("filename", "");
                	%>
                	<form id="form0" name="form0" method="post" action="service/do_upload_article.jsp" enctype="multipart/form-data">
                	<font size="4">添加文件</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              	    <label for="fileField"></label>
              	    <input type="file" name="fileField" id="fileField" />
              	    <input class="buttonone" type="submit" name="upload" id="upload" value="上传"/>
              	    <p>&nbsp;</p>
              	    </form>
                	<form id="form1" name="form1" method="post" action="service/publish_article.jsp">
                	  <font size="4">添加标题</font> ：
           	          <label for="textfield2"></label>
           	          <input type="text" name="textfield2" id="textfield2" />
   	        		<p>&nbsp;</p>
                	  <font size="4">类 &nbsp;&nbsp;&nbsp;&nbsp; 别</font> ：
                	<label for="select"></label>
                	<select name="select" id="select">
                	  <option>吉他</option>
                	  <option>钢琴</option>
                	  <option>架子鼓</option>
                	  <option>二胡</option>
                	  <option>民族乐器</option>
                	  <option>场地</option>
                	  <option>排练室</option>
                	  <option>设备</option>
                	  <option>其他</option>
              	    </select>
                	
                	<p>&nbsp;</p>
                	<p><font size="4">详情描述</font> ：</p>
                    <textarea name="content" cols="" rows=""></textarea>
                    <input class="buttonone" type="submit" name="submit" id="submit" value="发布"/>
                    <br /><br />
                    <p><font size="2">注：如果上传文件，一定要先点上传，再点发布！！！</font></p>
                    </form>
              </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
</div>
        <!-- Column 2 -->
        <div class="col2">
        	<!-- Map -->
            <div class="map">
            	<a href="#"><img src="images/map.gif" alt="" /></a>
            </div>
            <div class="clear"></div>
            <!-- Address -->
            <div class="address">
            	<ul>
                	<li class="phone">
                    	<h5>客服热线</h5>
                        <p>                        
                            1300 924 299
                            座机: +00-123-4567
                            <a href="mailto:info@website.com">info@website.com</a>
                        </p>
                    </li>
                    <li class="adrs">
                    	<h5>地址</h5>
                        <p>                        
                            北京市海淀区
                            学院路39号
                            北京航空航天大学
                        </p>
                    </li>
                    <li class="hours">
                    	<h5>工作时间</h5>
                        <p>周一到周五 10:00am至5:30pm</p>
                    </li>
                </ul>
            </div>
        </div>
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

</body>
</html>
