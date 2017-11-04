<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-2.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	$("#bt").on("click",function(){
		$("#fm").submit();
	});
	});
</script>
  </head>
  
  <body>
<center>
<h1><font color="red">用户登录界面</font></h1>
<form action="login" method="post" id="fm">
用户名：<input type="text" id="name" name = "name"/><br>
密码： <input type="password" id="pwd" name = "pwd"/><br>
</form>
<input type="button" id="bt" value="登录"/>
</center>

 </body>
</html>
