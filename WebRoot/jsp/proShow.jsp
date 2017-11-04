<%@ page language="java" import="java.util.*" import="com.bean.Products"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/jsp/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'proShow.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
td{
font-size:28px;
border:2px solid;
}
</style>
</head>

<body>
	<center>

		<div style="width: 900px;height:auto;border: double 5px #f00">
			<h1 style="height:10px;text-align:center;font-size: 36px;font-weight: 20px;">物资详情 </h1><br>
			<hr>
			<table border="1"
				style="text-align:center;border:5px #06C solid;width:auto;	font-family: monospace;"
				cellspacing="20px">
				<tr>
					<td style="border-color:#6A5ACD">产品ID</td>
					<td style="border-color: 	#000080">产品名</td>
					<td style="border-color: 	 	#FFFF00">价格(￥)</td>
					<td style="border-color: 	#1E90FF">库存</td>
					<td style="border-color:#00FF7F">imgPath</td>
					<td style="border-color: 	#F4A460">产品图片</td>
				</tr>
				
				<%
    @SuppressWarnings("unchecked")
    LinkedList<Products> list = (LinkedList<Products>) request.getSession().getAttribute("list");
	for(Products p:list){
		
        %>
				<tr>
					<td style="border-color:#6A5ACD"><%=p.getPid() %></td>
					<td style="border-color: 	#000080"><%=p.getPname() %></td>
					<td style="border-color: 	 	#FFFF00"><%=p.getPrice() %></td>
					<td style="border-color: 	#1E90FF"><%=p.getSum() %></td>
					<td style="border-color:#00FF7F"><%=p.getImg() %></td>
					<td style="border-color: 	#F4A460"><img src="<%=p.getImg() %>"
						style="width: 100px;height: 50px" /></td>
				</tr>
				<% 
	}
    %>



			</table>
			<a href="manager.jsp" style="text-align:center;font-size: 36px;font-weight: 20px;">返回</a>
			<hr>
		</div>
	</center>
</body>
</html>
