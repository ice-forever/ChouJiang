<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>抽奖活动配置页面</title>

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
function Price(id,priceName,startTime,endTime,mode)
{
	this.id=id;
	this.priceName=priceName;
	this.startTime=startTime;
	this.endTime=endTime;
	this.mode=mode;
}
//奖品的构造函数
function reward(rid,name,price){
	this.rid=rid;
	this.name=name;
	this.price=price;
}
var rlist= new Array();
var mypirce = new Array();


function delete_item(){
	
		var name = document.getElementById("name").value;
		alert("你正在删除一个抽奖活动，你确定吗？");
		  $.ajax({
	          url:"PriceServlet",
	          data:{
	          	"aid":""+<%=aid%>,
	          	"name":""+name,
	          	"type":"delete_price"
	          },
	          type:"GET",
	          dataType:"JSON",
	          success:function(httpdata){
	          	alert("删除成功!");
	  
	          },
	         error:function(XMLHttpRequest, textStatus, errorThrown) {
	         	//这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
	         	alert(XMLHttpRequest.responseText); 
	         	alert(XMLHttpRequest.status);
	         	alert(XMLHttpRequest.readyState);
	         	alert(textStatus); // parser error;
	         	}
	      });
		
		
		 $("#y").append("<td><input name=\"delete\" type=\"hidden\" value=\""+name+"\"></td>");
	
}


$(document).ready(function(){
	$("#iinput").click(function(){
    	alert("进入ajax请求函数");
    	var name = document.getElementById("name").value;
        $.ajax({
            url:"PriceServlet",
            data:{
            	"aid":""+<%=aid%>,
            	"name":""+name,
            	"type":"search_price"
            },
            type:"GET",
            dataType:"JSON",
            success:function(httpdata){
            	alert("success");
                for(var i=0;i<httpdata.length;i++){
                	if(true){
                        var Price_item = new Price(httpdata[i].pid,httpdata[i].name,httpdata[i].Begin_date, httpdata[i].End_date, httpdata[i].mode);
                        rlist.push(Price_item);
                        
                        $("#x").append("<li>"+Price_item.priceName+"</li>");
                        $("#x").append("<li>"+Price_item.startTime+"</li>");
                        $("#x").append("<li>"+Price_item.endTime+"</li>");
                        $("#x").append("<li>"+Price_item.mode+"</li>");
                       // $("#y").append("<td><input name=\"set\" type=\"submit\" value=\"设置抽奖活动\"></td>");
                        $("#y").append("<td><button name=\"set\" type=\"submit\" id=\"setting\"> 设置抽奖活动</button></td>");
                        $("#y").append("<td><button name=\"set2\"  id=\"delete\" type=\"button\" onclick=\"delete_item()\"> 删除号抽奖活动</button></td>");
               
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
        $("#y").append("<td><input name=\"pwho\" type=\"hidden\" value=\""+name+"\"></td>");

	});
});
</script>

</head>
<body>
 <center>
<font face="楷体" size="8" color="#9900FF">抽奖活动配置页面</font>
	
  	<table width="800" height = "250" border="5" bordercolor="#A0A0A0" >
  	  <tr>
		<th><font face="楷体" size="4" color="black">请输入您所希望配置的抽奖活动名称：</font></th>
		<td><input class="step1" type="text" name="name"  maxlength = "16" id="name" placeholder="Search..">  <button class="button" type="button" value="查找" id="iinput">查找</button>   </td>
 	  </tr>
 	 <tr>
 	<th> <font face="楷体" size="4" color="black">找到抽奖活动列表</font></th>
 	 <th><font face="楷体" size="4" color="black">配置选项</font></th>
	</tr>
	  <tr>
			<td id="x"> </td>
			<td>
			<form action = "add_reward_into_price.jsp" method = "GET" id="y">
			
			</from>
			
			</td>
	</tr>
	</table>
</center>
</body>
</html>