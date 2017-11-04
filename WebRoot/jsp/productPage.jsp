<%@ page language="java" import="java.util.*" import="com.bean.Products" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/jsp/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ProductPage</title>
    
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
  <center>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    Products p = (Products)request.getSession().getAttribute(""+id);
    //@SuppressWarnings("unchecked")
    //LinkedList<Products> list = (LinkedList<Products>) request.getSession().getAttribute("list");
    //Products p = list.get(id);
    %>
    
    <img src="<%=p.getImg() %>" style="width: 500px;height: 400px"/><br><hr>
    产品ID：<%=p.getPid() %><br><hr>
    产品名：<%=p.getPname() %><br><hr>
    价格：<%=p.getPrice() %>$<br><hr>
    库存：<%=p.getSum() %><br><hr>
    购买数量：<input type="text"/><br><hr>
    <input type="button" value="购买"/><br><hr>
    <input type="button" value="添加到购物车"/><br><hr>
    </center>
  </body>
</html>
