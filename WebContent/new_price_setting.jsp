<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta charset="UTF-8">

<%@ page import="entity.*" %>
<%@ page import="rewardPack.* " %>

<%@ page import="java.util.Vector" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Vector" %>
<%@ page import="admainPack.ReadU " %>
<%
	//int aid = (int)session.getAttribute("id");
	int aid=1;
%>
<link rel="stylesheet" type="text/css" href="css/common.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
//js对象构造器
function Price(priceName,startTime,endTime,mode,rewardLevels)
{
	this.priceName=priceName;
	this.startTime=startTime;
	this.endTime=endTime;
	this.mode=mode;
	this.rewardLevels=rewardLevels;
}
//奖品的构造函数
function reward(rid,name,price){
	this.rid=rid;
	this.name=name;
	this.price=price;
}
var rlist= new Array();
var mypirce = new Array();
$(document).ready(function(){
    	alert("进入ajax请求函数");
        $.ajax({
            url:"RewardServlet",
            data:{
            	"aid":""+<%=aid%>,
            	"type":"new_price_setting_list"
            },
            type:"POST",
            dataType:"JSON",
            success:function(httpdata){
            	alert("success");
                for(var i=0;i<httpdata.length;i++){
                	if(true){
                        var reward_item = new reward(httpdata[i].rid, httpdata[i].name, httpdata[i].price);
                        rlist.push(reward_item);
                        $("#rlist").append($("<option>").val(reward_item.rid).html(reward_item.name));
                	}
                }    
            },
           error:function(XMLHttpRequest, textStatus, errorThrown) {
           	//这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
           	alert(XMLHttpRequest.responseText); 
           	alert(XMLHttpRequest.status);
           	alert(XMLHttpRequest.readyState);
           	alert(textStatus); // parser error;
           	}
        })
});
</script>
<script language="javascript" type="text/javascript" src="./js/My97DatePicker/WdatePicker.js"></script>
<title>创建抽奖活动页面</title>
</head>
<body>
 <center>
	<font face="楷体" size="8" color="#9900FF">创建抽奖活动页面</font>
	
	
	
<form action = "PriceServlet" method = "GET" > 
  	<table width="800" height = "250" border="5" bordercolor="#A0A0A0">
  	  <tr>
		<th><font face="楷体" size="4" color="black">请输入您所希望创办的抽奖活动名称：</font></th>
		<td><input class="step1" type="text" name="name"  maxlength = "16" placeholder="name.." onfocus = "if(this.value == '输入16个字符以内') this.value =''"></td>
 	  </tr>
 	  <tr>
 		<th><font face="楷体" size="4" color="black">请输入您所希望创办的抽奖活动开始时间：</font></th>
 		<td><input size="30" class="step1" type="text" name="begin_date" placeholder="satrt time.." onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
 	  </tr>
 	  
 	   <tr>
 		<th><font face="楷体" size="4" color="black">请输入您所希望创办的抽奖活动结束时间：</font></th>
 		<td><input size="30" class="step1" type="text" name="end_date" placeholder="end time.." onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
 	  </tr>
 	  
 	   	<tr>
 		<th><font face="楷体" size="4" color="black">请输入您所希望创办的抽奖活动的活动模式：</font></th>
		<td><input class="step1" type="text" name="mode"  maxlength = "16" placeholder="modle.."></td>
 	  </tr>
 		<input type="hidden"  value="add_price"   name="type"/>
	  <tr>
 		<td colspan = "2" align = "center">
 		  <button class="button"  type="submit" value="确认提交">确认提交</button>   
 		  <button class="button" type="reset" value="重  置">重 置</button>  <!-- 定义重置按钮。重置按钮会清除表单中的所有数据。 -->
 		</td>
	  </tr>
	</table>
</form>
	
	
    
	 <a class="button" href="new_price_reward_setting.jsp" > 添加奖品和抽奖活动的关联关系</a>
    </center>
</body>
</html>