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
	<script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
td{
font-size:20px;
border:2px solid;
}
</style>
	<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript">
function delePro(pro){
	var ajax_option={  
			   //target: '#output',          //把服务器返回的内容放入id为output的元素中        
			   //beforeSubmit://提交前的回调函数    
			   url: '../Manager',                 //默认是form的action， 如果申明，则会覆盖    
			   type: 'post',               //默认是form的method（get or post），如果申明，则会覆盖    
				data:{"flag":"dele",
					"id":pro.attr("id")},
			   dataType: 'text',           //html(默认), xml, script, json...接受服务端返回的类型    
			   clearForm: true,          //成功提交后，清除所有表单元素的值    
			   resetForm: true,          //成功提交后，重置所有表单元素的值    
			   timeout: 3000,               //限制请求的时间，当请求大于3秒后，跳出请求   
			   async: false,//同步
			   success: function(data){
				alert(data);   
			   },      //提交后的回调函数		
	};
	pro.ajaxSubmit(ajax_option); 
}
</script>
</head>

<body>
	<center>

		<div style="width:900px;height:auto;border: double 5px #f00">
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
					<td>删除产品</td>
					<td>修改产品</td>
				</tr>
				
				<%
    @SuppressWarnings("unchecked")
    LinkedList<Products> list = (LinkedList<Products>) request.getSession().getAttribute("list");
				Products p=null;
	for(int i =0;i<list.size();i++){
			p = list.get(i);
        %>
				<tr>
					<td style="border-color:#6A5ACD"><%=p.getPid() %></td>
					<td style="border-color: 	#000080"><%=p.getPname() %></td>
					<td style="border-color: 	 	#FFFF00"><%=p.getPrice() %></td>
					<td style="border-color: 	#1E90FF"><%=p.getSum() %></td>
					<td style="border-color:#00FF7F"><%=p.getImg() %></td>
					<td style="border-color: 	#F4A460"><img src="<%=p.getImg() %>"
						style="width: 100px;height: 50px" /></td>
					<td><input id="<%=p.getPid() %>" type="button" style="font-size: 18px;color:#FF0000" value="删除" onClick="javascript:delePro($(this));$(this.parentNode.parentNode).remove()"/></td>
					<td><a style="font-size: 18px;color:#0000CC" href="proEdit.jsp?index=<%=i %>">修改</a></td>
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
