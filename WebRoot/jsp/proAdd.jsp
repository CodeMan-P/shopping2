<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/jsp/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proAdd.jsp' starting page</title>
    
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

		$("#bt1").on("click",function(){
	        $.ajaxFileUpload({ 
	            method:"POST",
	            url:"../Manager",            //需要链接到服务器地址  
	            secureuri:false,  
	            fileElementId:'file',                        //文件选择框的id属性
	            dataType: 'text',//服务器返回的格式  
	            async : false, 
	            success: function(data,status){ 
	            //上传成功之后的操作
	            if(data.indexOf("../")>=0){
	            $("#img").attr("src",data);
	            $("input[name='img']").val(data);
	            alert("上传成功");	            	
	            }else{
	            	alert("上传失败");
	            }
	            },error: function (data, status, e){ 
	            //上传失败之后的操作
	            	alert("error");
	            }  
	        });
		});
		
			$("#bt2").on('click', function() {
				//自动对表单取值
				/* 	var pid = $('input[name=pid]').val();
					var pname = $('input[name=pname]').val();
					var price = $('input[name=price]').val();
					var sum = $('input[name=sum]').val();
					 var img = $('input[name=imgPath]').val();
					 */
					 
					 $('input[name=img]').attr('disabled',false);
					var ajax_option={  
							   //target: '#output',          //把服务器返回的内容放入id为output的元素中        
							   //beforeSubmit://提交前的回调函数    
							   url: '../Manager',                 //默认是form的action， 如果申明，则会覆盖    
							   type: 'post',               //默认是form的method（get or post），如果申明，则会覆盖    
							   dataType: 'text',           //html(默认), xml, script, json...接受服务端返回的类型    
							   clearForm: true,          //成功提交后，清除所有表单元素的值    
							   resetForm: true,          //成功提交后，重置所有表单元素的值    
							   timeout: 3000,               //限制请求的时间，当请求大于3秒后，跳出请求   
							   success: function(data){
								alert(data);   
								$("#img").attr("src","#");
								$("input[name=file]").after($("input[name=file]").clone().val("")); 
								$("input[name=file]").first().remove();
								$('input[name=img]').attr('disabled',true);
							   },      //提交后的回调函数		
					};
					
					$("#proForm").ajaxSubmit(ajax_option);  
			});
	});
	</script>
  </head>
  
  <body>
  <center>
  <div style="width: 500px;border: 5px double #f00">
    <iframe id="iframe_display" name="iframe_display" style="display: none;"></iframe>  
      <img id="img" src="#" alt="请上传商品图片" style="width: 300px;height: 280px"/><br><hr>
  <form id="picForm" method="post" enctype="multipart/form-data">
      <input id="file" type="file" name="file"/>
  </form>
      <input type="button" onclick="uploadFile()"	value="上传商品图片" id="bt1"/><br><hr>
      
      
  <form id="proForm" action="../Manager"	method="post"> 
  <input type="hidden" name="flag" value="add"/>
    产品名：<input type="text" name="pname"/><br><hr>
    价格：<input type="text" name="price"/><br><hr>
    库存：<input type="text" name="sum" onkeyup="this.value=this.value.replace(/\D/g,'')"/><br><hr>
    imgPath:<input type="text" name="img" style="width: 400px;" disabled/><br><hr>
    <input type="button" id="bt2" value="提交"/>
  </form>
  <hr><a href="manager.jsp" style="text-align:center;font-size: 20px;font-weight: 20px;">返回</a>
  </div>
  </center>
  
 </body>
</html>
