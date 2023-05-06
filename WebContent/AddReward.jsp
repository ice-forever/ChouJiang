<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>奖品添加页面</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script>
    $(function () {
        $("#upload").click(function () {
            var formData = new FormData($('#uploadForm')[0]);
            $.ajax({
                type: 'post',
                url: "ModifyUpload",
                data: formData,
                cache: false,
                processData: false,
                contentType: false,
            }).success(function (data) {
                alert("上传成功!");
            }).error(function () {
                alert("上传失败!");
            });
        });
    });
		function addCheck(){
			var name=document.getElementById("name").value;
			var price=document.getElementById("price").value;
			var nums=document.getElementById("nums").value;
			var llevel=document.getElementById("llevel").value;
			if(name==""){
				alert("name不能为空!");
				document.getElementById("name").focus();  
				return false;
                }
			if(price==""){
				alert("price不能为空!");
				 document.getElementById("price").focus();
				 return false;
				 }
			if(nums==""){
				alert("nums不能为空!");
				 document.getElementById("nums").focus();
				 return false;
				 }
			
			if(llevel==""){
				alert("llevel不能为空!");
				 document.getElementById("llevel").focus();
				 return false;
				 }

		}
		function validate(){  //检验用户注册的正确性
		    var flag = addCheck();
		    if(flag == false)
		        return false;
		    return true;
	    }
		
	function tixing(){
		alert("添加成功！");
	}
	</script>
	</head>
  <body>
    <center>
	<font face="楷体" size="8" color="#9900FF">奖品添加页面</font>
	<form action = "RewardServlet" method = "GET"  name="1">  <!--onsubmit 事件会在表单中的确认按钮被点击时发生。这行代码的意思是在validate返回为true时向checkRegister.jsp提交表单-->
  	<table width="500" height = "180" border="5" bordercolor="#A0A0A0">
  	  <tr>
		<th><font face="楷体" size="4" color="black">奖品名：</font></th>
		<td><input type="text" name="name"  maxlength = "16" placeholder="Award name.." onfocus = "if(this.value == '输入16个字符以内') this.value =''"></td>
 	  </tr>
 	  <tr>
 		<th><font face="楷体" size="4" color="black">奖品价格：</font></th>
 		<td><input type="text" name="price" " maxlength = "20"  placeholder="Award price.." onfocus = "if(this.value == '输入20个字符以内') this.value =''"></td>
 	  </tr>
 	  <tr>
 		<input type="hidden"  value="add_reward" name ="type"/>
 	</tr>
	  <tr>
 		<td colspan = "2" align = "center">
 		  <button class="button" type="submit" value="添加" onclick="tixing()">添加   </button>
 		  <button class="button" type="reset" value="重  置">重置  </button>><!-- 定义重置按钮。重置按钮会清除表单中的所有数据。 -->
 		</td>
	  </tr>
	</table>
    </form>
    </center>
    <center>
	  <a class="button" href="new_price_setting.jsp" > 新建抽奖活动</a>
	   <a class="button" href="add_pic_reward.jsp" > 配置奖品信息</a>
	</center>
  </body>
</html>