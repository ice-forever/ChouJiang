<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">
  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  
  <link rel="apple-touch-icon" sizes="180x180" href="./assets/apple-icon-180x180.png">
  <link href="./assets/favicon.ico" rel="icon">


  <link href="" rel="stylesheet">
  <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
  </script>

  <title>Title page</title>
 
  <link href="./main.550dcf66.css" rel="stylesheet">
  <link href="./css/myevent.css" rel="stylesheet" type="text/css">
  <script>
 	function generateID(index){
 		return "test" + index ; 
 	}
 </script>
</head>

<body> <!-- Add your content of header -->
<header>
  <nav class="navbar navbar-default active">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./index.html" title="">
          <img src="./assets/images/cloud.png" class="cloud" alt="">
          <!-- 插入云抽logo -->
        </a>
      </div>

      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href ="./index_.jsp" title="回到首页">首页</a></li>
          <li><a href ="./myevent.jsp" title="查看您的活动">我的活动</a></li>
		  <li><a href ="./myevent.jsp" title="点击查看您的活动">欢迎您！<u>username</u></a></li>
          <!-- 这里的Username之后是要从数据库来读取的，或者是来自登录后的记录 -->
        </ul>
      </div> 
    </div>
  </nav>
</header>
  
<!-- show acitivities of this users-->
<div>
<div  class = "myevent">
	<h3>我的活动</h3>
</div>
<!-- 添加活动按钮 -->
<div>
    <p>
    <!-- 鼠标移上出现提示用title，如下一个 -->
      <a href="./edit-event.jsp" class="addActivites btn btn-primary" title="添加活动">添加活动</a> 
    </p>
 </div>
<div class = "line">
	<hr style = "height:1px;border:none;border-top:1px solid #555555;width:1200px;align:center"/>
</div>
</div>

<!--展示活动的那个外边框  -->
<%for(int i = 0 ; i < 3 ; i++){ %>
<script>	 
$(document).ready(function(){
	$("button").click(function(e){
		var id=$(e.target).attr("number");
		$("#test"+id).toggle();
		console.log("#test"+id);
	});
});
 </script>
<div class = "all">
<div class = "activites" id = "Act">
	<div  class = "left">
		<img src = "./images/nine_vlock/1.jpg" alter = "图片错误"  class = "fish"> 
	</div>
	<div class = "center" >       
		<h3>活动名称：云抽锦鲤</h3><br/>
	   </div>	
		<div>
			<font size = "4"  face="宋体" color="#000000">状态：stage &nbsp &nbsp 参加人数：233/666</font>
		</div>
		<div margin-top = "2px">
			<font size = "4"  face="宋体" color="#000000">添加时间：2023-4-4  11:11:11 &nbsp &nbsp    开奖时间：2023-4-8 20:00:00</font>
		</div>
		<div margin-top = "2px">
			<font size = "4"  face="宋体" color="#000000">活动方式：在线-公开报名 &nbsp &nbsp 抽奖类型：体验类  &nbsp </font>
			<a href = "#">
			<font size="3" color="blue">升级</font></a>
		</div>				
	<!-- 按钮放在最右边 -->
	<div class = "right">
    	<p>
    	<div>
     	 <a href="./participant.jsp" class="showCandidates btn btn-primary" title="查看活动参与者">查看参与者</a> 
     	</div>
     	<div> 
     	 <a href="./project.html" class="beginstop btn btn-primary" title="点击开始抽奖">开始/结束</a> 
    	</div>
    	<div class = "editword">
    	  <a href = "./edit-event.jsp" title="编辑活动信息">
    		<font size = "4" face="宋体" color = "blue" >编辑</font>	
    	  </a>
    	    <font size = "4" face="宋体" color = "red">&nbsp&nbsp&nbsp删除</font>
    	<!-- 这里要添加删除功能 -->
    	</div>
    	</p>    	
    </div>
    
    <div class = "HideOrShow">
    	<button style="display : block ; margin:0 auto"  class="showhide" >
    	 <font color = "blue" number="<% out.print(i); %>">展开/收起</font>
    	</button>
    	<%                                      
    	out.println("<table class = \"table\" id = \"test"+ i + "\" style = \"display:none ; padding:10px\" >") ; 
    	%>
			 <tbody>
    			<tr>
        			<td>奖等数</td>
        			<td>3</td>
    			</tr>
    			<tr>
        			<td>最高等级奖项名称</td>
        			<td>Dell</td>
    			</tr>
    			<tr>
        			<td>最高等级奖项价值（人民币）</td>
        			<td>5000</td>
    			</tr>
    			<tr>
        			<td>奖品总价值</td>
        			<td>10000</td>
    			</tr>
    			</tbody>
			</table> 		
    	</div>
    </div>
   </div>
</div>
<%}%>