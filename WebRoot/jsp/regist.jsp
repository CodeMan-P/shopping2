<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/jsp/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<script type="text/javascript" src="../js/jquery-2.1.0.js"></script>
		<script type="text/javascript" src="../js/jquery.form.js"></script>
		<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
			$("#bt1").on('click', function() {
					var ajax_option={  
							   //target: '#output',          //把服务器返回的内容放入id为output的元素中        
							   //beforeSubmit://提交前的回调函数    
							   url: '../Regist',                 //默认是form的action， 如果申明，则会覆盖    
							   type: 'post',               //默认是form的method（get or post），如果申明，则会覆盖    
							   dataType: 'text',           //html(默认), xml, script, json...接受服务端返回的类型    
							   clearForm: true,          //成功提交后，清除所有表单元素的值    
							   resetForm: true,          //成功提交后，重置所有表单元素的值    
							   timeout: 3000,               //限制请求的时间，当请求大于3秒后，跳出请求   
							   success: function(data){
								alert(data);   
								location.href="../Shop";
							   },      //提交后的回调函数		
					};
					
					$("#userForm").ajaxSubmit(ajax_option);  
			});
	});
	</script>
  </head>
  
  <body>
    <center>
    <div style="width:900px;height:auto;border: double 5px #f00">
     <form id="userForm" action="../Regist" method="post">
     <input type="hidden" name="flag" value="regist"/>
     	姓名：<input type="text" name="name"><br><hr>
     	密码：<input type="password" name="pwd"><br><hr>
     	确认密码：<input type="password" name="pwd2"><br><hr>
     	年龄：<input type="text" name="age" onkeyup="this.value=this.value.replace(/\D/g,'')"><br><hr>
     	性别：
     	<select name="sex"><option value="男">男</option>
<option value="女">女</option>
</select><br><hr>
    <input type="button" id="bt1" value="提交"/>
     </form>
     
    </div>
    </center>
  </body>
</html>
