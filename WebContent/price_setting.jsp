<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>

<% 
//String item = request.getParameter("nums");
//int nums= Integer.parseInt(item);
int nums=2;
out.println(nums);
%>
<script>
$(document).ready(function(){
	$("button").click(function(){
		$.post("choujiang.jsp",{
			state:"ok",
		},
		function(data,status){
			alert("数据: \n" + data + "\n状态: " + status);
			var jsonArray = JSON.parse(data);
			console.log(jsonArray);
			for(var i=0;i<jsonArray.length;i++)
			{
				console.log(jsonArray[0].name);
				console.log(jsonArray[0].url);
			}
		});
	});
});
</script>
<script>
	var arrayname = new Array();
	var arraykind = new Array();
	var pro = new Array();
	var reward = new Array();
	
	function validate(i) {
		//alert("in_validate")
		var name = document.getElementById("name"+i);
		var proo = document.getElementById("pro"+i); 
		var kind = document.getElementById("kind"+i); 
		 if(name.value==""){  //document.getElementByIdx_x.value的返回值类型是string
			 alert("名称不能为空，请重新输入！")
			 return;
		 }
		 else if(pro.value==""){
			 alert("概率不能为空，请重新输入!")
			 return;
		 }
		 else if(kind.value==""){
			 alert("奖品种类不能为空，请重新输入!")
			 return;
		 }
		 
		 if(search(arrayname,name.value)==1){
			 arrayname.push(name);
		 }
		 else{
			 alert("奖项名称重复!，请重新输入")
		 }
		 
		 if(search(arraykind,kind.value)==1){
			 arraykind.push(name);
		 }
		 else{
			 alert("奖品名称重复!，请重新输入")
		 }
		 pro.push(proo.value)
		 //document.write(setting.price_name);
		 
	}
	function search(list,name){
		//alert("-1")
		for(var i=0;i<list.length;i++){
			if(list[i].value==name){
				alert("search 找到了重名的条目");
				return -1;
			}
		}
		//alert("search 没有找到重名的条目");
		alert("OK");
		return 1;
		
	}
	
	function togeter(){
	   	for(var i=0;i <arrayname.length;i++){
	   		var temp={name:arrayname[i], kind:arraykind[i], pro: pro[i]};  //对象
	   		reward.push(temp);
	   	}
	   	alert("OK");
	}
	
	function cal_pro(){
		var summ = 0;
		for(var i=0;i<pro.length;i++){
			summ = summ + parseFloat(pro[i]);
		}
		
		for(var i=0;i<pro.length;i++){
			pro[i]=parseFloat(pro[i])/summ;
		}
	}
	
	function fight(){
		var p=new Array();
		for(var i=0;i<pro.length;i++){
			p.push(pro[i]);
		}
		var appearnum=0;
		var re=roulette(p);
		document.write(re);
	}
	
	function roulette(p){
		var rand = Math.random();
		var pointer=0;
		for(var i=0;i<p.length;i++){
			pointer=pointer+parseFloat(p[i]);
			if (rand<=pointer)
				return i;
		}
		return -1;
	}	
</script>

</head>
<body>
<%for(int i=1;i<=nums;i++) {%>
	奖项 <%out.println(i); %><br />
	奖项名称&nbsp;&nbsp;<input type="text" id=<%="name"+Integer.toString(i) %>  />
	奖项概率&nbsp;&nbsp; <input type="text" id=<%="pro"+Integer.toString(i) %>   />
	奖品种类&nbsp;&nbsp;<input type="text"  id=<%="kind"+Integer.toString(i) %>  />
	&nbsp;&nbsp; 确定 <input type="button" class="login-code" onclick="validate(<%=Integer.toString(i) %>)" id="code" />  <br /><br />
	<br /><br />
<% }%>
确认提交信息 <input type="button" class="login-code" id="code"  onclick=""/>  <br /><br /> 
<button>发送一个 HTTP POST 请求页面并获取返回内容</button>
</body>
</html>