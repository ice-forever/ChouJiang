<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>编辑奖品信息</title>
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

function upload_pic(id) {
	// bpic"+reward_item.rid
		var iid = id.substring(4,id.length);
		alert(iid);
		var newid="#up"+iid;
		alert(newid);
    	var formData = new FormData($(newid)[0]); 
    	
        $.ajax({
            type: 'post',
            url: "ModifyUpload_userList",
            data: formData,
            cache: false,
            processData: false,
            contentType: false,
	         error:function(XMLHttpRequest, textStatus, errorThrown) {
		         	//这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
		         	alert(XMLHttpRequest.responseText); 
		         	alert(XMLHttpRequest.status);
		         	alert(XMLHttpRequest.readyState);
		         	alert(textStatus); // parser error;
		         	}
        }).success(function () {
            alert("上传成功!");
        });
}

function delete_item(id){
	alert(id);
	
	var iid = id.substring(2,id.length);
	alert(iid);
		alert("你正在删除一个抽奖活动，你确定吗？");
		  $.ajax({
	          url:"RewardServlet",
	          data:{
	          	"aid":""+<%=aid%>,
	          	"id":iid,
	          	"type":"delete_reward"
	          },
	          type:"POST",
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


function modify_name_reward(id){
	alert(id);
	
	var iid = id.substring(1,id.length);
	var iid= "i"+iid;
	alert(iid);
	var new_name = document.getElementById(iid).value;
	var old_id= id[id.length-1];
	alert(old_id);
	alert(new_name);
	alert("你正在修改一个奖品的名字，你确定吗？");
	
	  $.ajax({
          url:"RewardServlet",
          data:{
          	"aid":""+<%=aid%>,
          	"old_id":old_id,
          	"new_name":new_name,
          	"type":"modify_reward_name"
          },
          type:"POST",
    
          dataType:"JSON",
          success:function(httpdata){
          	if(httpdata["status"]=="ok"){
          		alert("修改成功")
          	}else if (httpdata["status"]=="error"){
          		
          		alert("修改失败");
          	}
  
          },
         error:function(XMLHttpRequest, textStatus, errorThrown) {
         	//这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
         	alert(XMLHttpRequest.responseText); 
         	alert(XMLHttpRequest.status);
         	alert(XMLHttpRequest.readyState);
         	alert(textStatus); // parser error;
         	}
      });
}


function modify_name_reward(id){
	alert(id);
	
	var iid = id.substring(1,id.length);
	var iid= "i"+iid;
	alert(iid);
	var new_name = document.getElementById(iid).value;
	var old_id= id[id.length-1];
	alert(old_id);
	alert(new_name);
	alert("你正在修改一个奖品的名字，你确定吗？");
	
	  $.ajax({
          url:"RewardServlet",
          data:{
          	"aid":""+<%=aid%>,
          	"old_id":old_id,
          	"new_name":new_name,
          	"type":"modify_reward_name"
          },
          type:"POST",
          dataType:"JSON",
          success:function(httpdata){
          	if(httpdata["status"]=="ok"){
          		alert("修改成功")
          	}else if (httpdata["status"]=="error"){
          		
          		alert("修改失败");
          	}
  
          },
         error:function(XMLHttpRequest, textStatus, errorThrown) {
         	//这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
         	alert(XMLHttpRequest.responseText); 
         	alert(XMLHttpRequest.status);
         	alert(XMLHttpRequest.readyState);
         	alert(textStatus); // parser error;
         	}
      });
}
$(function () {
	    	//alert("进入ajax请求函数");
	    	var aid = "<%=aid%>";
	        $.ajax({
	            url:"RewardServlet",
	            data:{
	            	"aid": aid,
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
	                        $("#table").append("<tr id=r"+reward_item.rid +">");
	                        $("#r"+reward_item.rid).append("<td id=x"+reward_item.rid +">");
	                        $("#x"+reward_item.rid).append(reward_item.name);
	                        $("#x"+reward_item.rid).append("</td>");
	                        $("#r"+reward_item.rid).append("<td id=y"+reward_item.rid +">");
	                        $("#y"+reward_item.rid).append("<input id=iname"+reward_item.rid +" style=\"width:130px;\"  placeholder=\"请输入修改名称\">"); 
	                        $("#y"+reward_item.rid).append("<button id=bname"+reward_item.rid +" type=\"button\" onclick=\"modify_name_reward(this.id)\">确定</button>");

	                        $("#y"+reward_item.rid).append("<input id=inum"+reward_item.rid +" style=\"width:130px;\"  placeholder=\"请输入修改数量\">");      
	                       
	                        $("#y"+reward_item.rid).append("<button id=bnum"+reward_item.rid +" type=\"button\" onclick=\"XXX\">确定</button>");     
	                          
	                        

	                        
	                        $("#y"+reward_item.rid).append("<input id=iprice"+reward_item.rid +" style=\"width:130px;\"  placeholder=\"请输入修改价格\">"); 
	                        $("#y"+reward_item.rid).append("<button id=bprice"+reward_item.rid +" type=\"button\" onclick=\"XXX\">确定</button>");  
	                        
	                       // $("#y"+reward_item.rid).append("上传奖品图片"); 
	                        //$("#y"+reward_item.rid).append("<form id=\"up"+reward_item.rid +"\" enctype=\"multipart/form-data\" >");   
	                       // $("#y"+reward_item.rid).append("<input id=ipic"+reward_item.rid +" type=\"file\" style=\"width:130px;\" >"); 
	                       // $("#y"+reward_item.rid).append("<button id=bpic"+reward_item.rid +" type=\"button\" onclick=\"upload_pic(this.id)\">上传</button>"); 
	                        //$("#y"+reward_item.rid).append("</form>");
	                        $("#y"+reward_item.rid).append("<button id=bd"+reward_item.rid +" type=\"button\" onclick=\"delete_item(this.id)\">删除该奖品</button>"); 
	                        
	                        
	                        $("#r"+reward_item.rid).append("</td>");
	                        $("#y"+reward_item.rid).append("</tr>");
	                	}
	                }       
	            },
	           error:function(XMLHttpRequest, textStatus, errorThrown) {
	           	//这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
	           	alert(XMLHttpRequest.responseText); 
	           	alert(XMLHttpRequest.status);
	           	alert(XMLHttpRequest.readyState);
	           	alert(textStatus); // parser error;
	           	alert(errorThrown);
	           	}
	        })
	        $("#table1").append(" <input type=\"submit\" value=\"提交\" style=\" text-align: center;\" />");
});
</script>
</head>
<body>
	<center>
  	<table width="1200" height = "250" border="5" bordercolor="#A0A0A0"  id="table">
  	  <tr>
		<th><font face="楷体" size="4" color="black">您已经加入的奖品列表</font></th>
		<th><font face="楷体" size="4" color="black">配置选项</font></th>	
 	  </tr>
 	  
	</table>
</center>
    <center>
	  <a class="button" href="AddReward.jsp" > 返回抽奖活动页面</a>
	</center>

</body>
</html>