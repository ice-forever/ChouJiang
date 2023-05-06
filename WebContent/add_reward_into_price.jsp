<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>抽奖活动配置页面</title>

<%@ page import="java.util.regex.Matcher"  %>
<%@ page import="java.util.regex.Pattern"  %>
<%@ page import="entity.*" %>
<%@ page import="pricePack.* " %>
<%@ page import="java.util.ArrayList" %>

<%!
public static String getNumbers(String content) {  
    Pattern pattern = Pattern.compile("\\d+");  
    Matcher matcher = pattern.matcher(content);  
    while (matcher.find()) {  
       return matcher.group(0);  
    }  
    return "";  
}  

%>
<%
	String aid="1";
/*
	String pname=(String)session.getAttribute("who_is_now_price");
	if(pname==null){
		pname= request.getParameter("pwho");	//活动抽奖活动名称
		session.setAttribute("who_is_now_price", pname);
		
	}
	
	PriceDao tool = new PriceDao();
	Price pitem= new Price();
	ArrayList<Price> thisprice=new ArrayList<Price>();
	thisprice=tool.selectPrice_name(aid, pname);
	System.out.println(pname);
	pitem=thisprice.get(0);
	*/
	int pid=1;
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
$(function () {
    $("#upload").click(function () {
        var formData = new FormData($('#uploadForm')[0]);
        $.ajax({
            type: 'post',
            url: "ModifyUpload_userList",
            pid: "<%=pid%>"
            ,
            data: formData,
            cache: false,
            processData: false,
            contentType: false,
        }).success(function () {
            alert("上传成功!");
        }).error(function () {
            alert("上传失败!");
        });
    });
});

$(function () {
$("#step11").click(function(){
	var nums = document.getElementById("stepnums").value;
	for(var i=1;i<=nums;i++){
		var temp="添加奖品<select style=\"width:100px\" id=\"rlist"+i+"\" name=\"rlist"+i+"\" ></select>";
		var temp2="设置数量<input style=\"width:100px\"  type=\"text\" name=\"num"+i+"\"  maxlength = \"16\" id=\"num"+i+"\">";
		var hide="<input type=\"hidden\"  value="+i+ " name=\"what_price"+i+"\" >";
		$("#table1").append(" <tr><th>第"+i+"等奖</th><td>"+temp+temp2+hide+"</td></tr>");
	}
    	//alert("进入ajax请求函数");
    	var name = document.getElementById("name");
    	var aid = "<%=aid%>";
    	alert(aid);
        $.ajax({
            url:"RewardServlet",
            data:{
            	"aid": aid,
            	"type":"new_price_setting_list"
            },
            type:"POST",
            dataType:"JSON",
            success:function(httpdata){
            	//alert("success");
                for(var i=0;i<httpdata.length;i++){
                	if(true){
                        var reward_item = new reward(httpdata[i].rid, httpdata[i].name, httpdata[i].price);
                        rlist.push(reward_item);
                        for(var j=1;j<=nums;j++){
                        	var number=""+j;
                        	var who_temp="#rlist"+number;
                        	//alert(who_temp);
                        	$(who_temp).append($("<option>").val(reward_item.rid).html(reward_item.name));
                        }
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
});


</script>
</head>
<body>
<center>
	<font face="楷体" size="8" color="#9900FF">奖项设置页面页面</font>
	<form action = "Add_Reward_to_price" method = "POST">  <!--onsubmit 事件会在表单中的确认按钮被点击时发生。这行代码的意思是在validate返回为true时向checkRegister.jsp提交表单-->
  	<table width="700" height = "100" border="5" bordercolor="#A0A0A0" id="table1">
  	  <tr >
		<th><font face="楷体" size="4" color="black">请输入奖等数量：</font></th>
		<td>
		<input id="stepnums" type="text" name="stepnums"  maxlength = "16" placeholder="number..">
		<button class="button" id="step11" type="button" value="确定" >确定</button>
		</td>
 	  </tr>
	</table>
    </form>
    <!--${requestScope.right} ${requestScope.worry1} ${requestScope.worry2}-->
    <form id="uploadForm" enctype="multipart/form-data" name="abc">
    	<font face="楷体" size="4" color="black">导入抽奖用户文件:</font><input id="file" type="file" name="file"/>
    	<input type="hidden"  value="user_txt" name="uptype">
   		<button class="button" id="upload">上传文件</button>
	</form>
	<a class="button" href="final_price2.jsp" > 执行抽奖活动</a>
</center>
	
</body>
</html>