<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<jsp:useBean id="user" class="com.lexiang.entity.UserBean" scope="session"/>
<html>

<head>

<title>文件上传处理页面</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

<script type="text/javascript">setTimeout("history.go(-1)", 1);  </script>

<body>

<%

 // 新建一个SmartUpload对象

 SmartUpload su = new SmartUpload();

 // 上传初始化

 su.initialize(pageContext);

 // 设定上传限制

 // 1.限制每个上传文件的最大长度。

 // su.setMaxFileSize(10000);

 // 2.限制总上传数据的长度。

 // su.setTotalMaxFileSize(20000);

 // 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。

 // su.setAllowedFilesList("doc,txt");

 // 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,

 //jsp,htm,html扩展名的文件和没有扩展名的文件。

 // su.setDeniedFilesList("exe,bat,jsp,htm,html");

 // 上传文件

 su.upload();

 // 将上传文件全部保存到指定目录

 // su.save("D:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\Lexiang\\upload\\article\\");
 
 // session.setAttribute("filename", su.getFiles().getFile(0).getFileName());
 
  File file = su.getFiles().getFile(0);
 
  // 将文件另存

  file.saveAs("D:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\Lexiang\\upload\\article\\" + user.getId() + "-" + file.getFileName());
  
  session.setAttribute("filename", file.getFileName());

  // 另存到以WEB应用程序的根目录为文件根目录的目录下

  // file.saveAs("D:\\Lexiang\\upload\\article\\" + file.getFileName(), su.SAVE_VIRTUAL);

  // 另存到操作系统的根目录为文件根目录的目录下

  // file.saveAs("D:\\temp\\" + file.getFileName(),

  // su.SAVE_PHYSICAL);

%>

</body>

</html>