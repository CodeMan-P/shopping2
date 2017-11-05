<%@ page language="java" import="java.util.*" import="com.bean.Products"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/jsp/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'proEdit.jsp' starting page</title>

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
	$(document).ready(function() {
		$("#bt1").on("click", function() {
			$.ajaxFileUpload({
				method : "POST",
				url : "../Manager", //需要链接到服务器地址  
				secureuri : false,
				fileElementId : 'file', //文件选择框的id属性
				dataType : 'text', //服务器返回的格式  
				async : false,
				success : function(data, status) {
					//上传成功之后的操作
					if (data.indexOf("../") >= 0) {
						$("#img").attr("src", data);
						$("input[name='img']").val(data);
						alert("上传成功");
					} else {
						alert("上传失败");
					}
				},
				error : function(data, status, e) {
					//上传失败之后的操作
					alert("error");
				}
			});
		});
		$("#bt2").on('click', function() {
			$('input[name=img]').attr('disabled', false);
			var ajax_option = {
				url : '../Manager', //默认是form的action， 如果申明，则会覆盖    
				type : 'post', //默认是form的method（get or post），如果申明，则会覆盖    
				dataType : 'text', //html(默认), xml, script, json...接受服务端返回的类型    
				clearForm : true, //成功提交后，清除所有表单元素的值    
				resetForm : true, //成功提交后，重置所有表单元素的值    
				async : false,
				timeout : 3000, //限制请求的时间，当请求大于3秒后，跳出请求   
				success : function(data) {
					alert(data);
					location.href = "proShow.jsp";
				}, //提交后的回调函数		
			};

			$("#proForm").ajaxSubmit(ajax_option);
		});
	});
</script>
</head>

<body>
	<center>
		<div style="width: 500px;border: 5px double #f00">
			<%
				int index = Integer.parseInt(request.getParameter("index"));
				@SuppressWarnings("unchecked")
				LinkedList<Products> list = (LinkedList<Products>) request.getSession().getAttribute("list");
				Products p = list.get(index);
			%>
			<img src="<%=p.getImg()%>" id="img"
				style="width: 300px;height: 280px" /><br>
			<hr>
			<form id="picForm" method="post" enctype="multipart/form-data">
				<input id="file" type="file" name="file" />
			</form>
			<input type="button" onclick="uploadFile()" value="上传商品图片" id="bt1" /><br>
			<hr>
			<form id="proForm" action="../Manager" method="post">
			  <input type="hidden" name="flag" value="edit"/>
			  <input type="hidden" name="pid" value="<%=p.getPid()%>"/>
				产品ID：<%=p.getPid()%><br>
				<hr>
				产品名：<input type="text" name="pname" value="<%=p.getPname()%>"><br>
				<hr>
				价格：<input type="text" name="price" value="<%=p.getPrice()%>"><br>
				<hr>
				库存：<input type="text" name="sum" value="<%=p.getSum()%>"><br>
				<hr>
				imgPath:<input type="text" name="img" style="width: 400px;" value="<%=p.getImg()%>" disabled /><br>
				<hr>
				<input type="button" id="bt2" value="提交修改" />
			</form>
			<hr><a href="proShow.jsp" style="text-align:center;font-size: 20px;font-weight: 20px;">返回</a>
		</div>
	</center>
</body>
</html>
