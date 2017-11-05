<%@ page language="java" import="java.util.*" import="com.bean.Products" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/jsp/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopping.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
/*		$("img").on("click",function(){
			var url = $(this).attr("src");
			$(location).attr('target',"_blank");
			$(location).attr('href',url);
		});
	*/	
	});
	</script>
  </head>
  
  <body>
  <h1 id = "h">当前用户：<%=request.getSession().getAttribute("name")%> | 当前在线人数：<%=application.getAttribute("count")%></h1>
  <center>
  <table border="1"  style="text-align:center;border:5px #06C solid;width:500px;	font-family: monospace;font-size: 26px"
   cellspacing="20px">
   
    <%
    @SuppressWarnings("unchecked")
    LinkedList<Products> list = (LinkedList<Products>) request.getSession().getAttribute("list");
    //for(Products i:list){
    	Products x,y,z;
    	Random rand = new Random();
    	int r,g,b;
    	for(int i=0;i<list.size();i+=3){
    	r=rand.nextInt(180);
    	g=rand.nextInt(180);
    	b=rand.nextInt(180);
    		try{
    		x = list.get(i);
    		y = list.get(i+1);
    		z = list.get(i+2);    			
    		}catch(Exception e){
    			break;
    		}
    	%>
    	<tr>
    	<td style="border:5px solid rgb(<%=r+i%>,<%=g+i%>,<%=b+i%>)" colspan="4"><a href="productPage.jsp?id=<%=i %><%request.getSession().setAttribute(""+i, list.get(i));%>" target="_blank"><img src="<%=x.getImg() %>" style="width: 100%;height: 200px"/></a></td>
    	<td style="border:5px double rgb(<%=r+i+1%>,<%=g+i+1%>,<%=b+i+1%>)" colspan="4"><a href="productPage.jsp?id=<%=i+1 %><%request.getSession().setAttribute(""+(i+1), list.get(i+1));%>" target="_blank"><img src="<%=y.getImg() %>" style="width: 100%;height: 200px"/></a></td>
    	<td style="border:5px solid rgb(<%=r+i+2%>,<%=g+i+2%>,<%=b+i+2%>)" colspan="4"><a href="productPage.jsp?id=<%=i+2 %><%request.getSession().setAttribute(""+(i+2), list.get(i+2));%>" target="_blank"><img src="<%=z.getImg() %>" style="width: 100%;height: 200px"/></a></td>
    	</tr>
    	
    	<tr>
    	<td style="border:2px solid rgb(<%=r+i%>,<%=g+i%>,<%=b+i%>)"><%=x.getPid() %></td>
    	<td style="border:2px solid rgb(<%=r+i%>,<%=g+i%>,<%=b+i%>)"><%=x.getPname() %></td>
    	<td style="border:2px solid rgb(<%=r+i%>,<%=g+i%>,<%=b+i%>)"><%=x.getPrice() %>$</td>
    	<td style="border:2px solid rgb(<%=r+i%>,<%=g+i%>,<%=b+i%>)"><%=x.getSum() %></td>
    	
    	<td style="border:5px double rgb(<%=r+i+1%>,<%=g+i+1%>,<%=b+i+1%>)"><%=y.getPid() %></td>
    	<td style="border:5px double rgb(<%=r+i+1%>,<%=g+i+1%>,<%=b+i+1%>)"><%=y.getPname() %></td>
    	<td style="border:5px double rgb(<%=r+i+1%>,<%=g+i+1%>,<%=b+i+1%>)"><%=y.getPrice() %>$</td>
    	<td style="border:5px double rgb(<%=r+i+1%>,<%=g+i+1%>,<%=b+i+1%>)"><%=y.getSum() %></td>
    	
    	<td style="border:2px solid rgb(<%=r+i+2%>,<%=g+i+2%>,<%=b+i+2%>)"><%=z.getPid() %></td>
    	<td style="border:2px solid rgb(<%=r+i+2%>,<%=g+i+2%>,<%=b+i+2%>)"><%=z.getPname() %></td>
    	<td style="border:2px solid rgb(<%=r+i+2%>,<%=g+i+2%>,<%=b+i+2%>)"><%=z.getPrice() %>$</td>
    	<td style="border:2px solid rgb(<%=r+i+2%>,<%=g+i+2%>,<%=b+i+2%>)"><%=z.getSum() %></td>
    	
    	<tr>
    <%
    }
    %>
    </table></center>
    
    <form action="ProInfo">
    <input type="hidden" name="id"/>
    </form>
  </body>
</html>
