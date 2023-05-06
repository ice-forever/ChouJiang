$(function(){
    $(".prizeboxclose").on("click",function(){
        $(".prizeboxout").hide();
    });
    getprizearr();
    $(".code").qrcode("https://www.baidu.com");
});



// 渲染奖品列表
function getprizearr(){
    var list = prizearr;
        // var list = data2.awards;
    if(isArray(list)){
        $('.imgboxshow').css({
            'width':290*list.length+'px'
        })
        var str = "";
        for(var i = 0; i < list.length; i++){
            str += '<div class="imgbox fl re">'
                +'<div class="imgjiang">'
                    +'<img src='+list[i].prizeurl+' alt="">'
                +'</div>'
                +'<div class="prizeci">'
                    +'<p class="lineshow max150 tac mgauto">'+list[i].prizerank+'</p>'
                +'</div>'
                +'<div class="prizeshow">'
                    +'<p class="wp100 tac prizenum">'+list[i].prizenum+'名</p>'
                    +'<p class="wp100 tac prizename">'+list[i].prizename+'</p>'
                    +'<p class="wp100 tac prizenums">剩余 <span class="prizenumnow">'+list[i].prizenum+'</span> 个</p>'
                +'</div>'
                +'<div class="fg prizestartbtn prizestartbtn" onclick="showprize(this)">抽奖</div>'
            +'</div>';
        } 
        $(".imgboxshow").html(str);
    }
}
// 显示抽奖页面
function showprize(_this){
    var title = $(_this).parent().find(".prizeci").find("p").html();
    $(".prizeboxtitle").html(title);
    $(".prizeboxtitle2").html(title);
    $("#startfn").show();
    $("#stopbtn").hide(); 
    $("#startfn").html("抽奖");                   
    $("#stopbtn").html("停止");
    getimgarr(); 
}
// 获取开始的抽奖人员
function getimgarr(callback){
    $(".prizeboxout").show();
    $(".prizeboxtitle2box").hide();
    $("#prizeboxshow1").html("");
    $("#prizeboxshow2").html("");
    for(var i = 0; i < imgarr.length; i++){ 
        var str1 = "";
        $("#prizeboxshow1").append('<div class="prizeboximgout re"><div class="prizeboximg"></div></div>');
        var imgarrj = imgarr[i];
        for(var j = 0; j < imgarrj.length; j++){
            str1 += '<div class="prizeboxmove">'
                +'<div class="img">'
                    +'<img src='+imgarrj[j].imgurl+' alt="">'
                    +'<p class="wp100 tac ">'+imgarrj[j].imgname+'</p>'
                +'</div>'
            +'</div>';
        } 
        $("#prizeboxshow1").find(".prizeboximg").eq(i).html(str1);
    }
    if(imgarr.length <= 5){
        $("#prizeboxshow1").css({
            "width":imgarr.length*159+"px"
        });
        $(".prizetop").css({
            "height":'417px'
        })
    }
    if(typeof callback == 'function'){
        callback();
    }  
};
var startbool = true; //true可以抽奖，防止多次触发停止，影响滚动
// 开始抽奖
function startfn(_this){
    startsettimeout = 0;
    $(".prizeboxtitle2box").hide();    
    if(startbool){
        startbool = false;
        stopbool = false;
        endbool = false;
        $("#startfn").html("正在抽奖");
        setTimeout(function(){
            $("#startfn").hide();
            startbool = true;  
            $("#stopbtn").show();
        },2000);
        getimgarr(function(){
            setTimeout(function(){
                var prizeboximg = $(".prizeboximg");
                for(var i = 0; i < prizeboximg.length; i++){
                    startrun($(".prizeboximg").eq(i));
                }
            },100);
        });
    }   
}
// 抽奖滚动
var endbool = false; //滚动true结束抽奖
var firststartbool = false; //是不是第一次抽奖
function startrun(dom){
	
    var i = 0;
    var j = 0;
    var endtime = 10;//定时器的速度
    var speed = 50;//每次移动多少像素
    dom.append(dom.find(".prizeboxmove").eq(0).clone());
    var size = dom.find(".prizeboxmove").size();
    var domheight = dom.height() - 180;
    var timer = setInterval(function () {
        var top = speed * i;
        //alert(top);
        if(j == 3){
            domheight = 1850;
            if(top >= 1850){
                $("#startfn").show();
                $("#stopbtn").hide(); 
                $("#startfn").html("抽奖");                   
                $("#stopbtn").html("停止");
                $(".prizeboxtitle2box").show();
                clearInterval(timer);
            }
        }
        if(top >= domheight){
            if(endbool){
                j += 1;
                speed -= 50;
            }else{
                if(speed <= 8){
                    speed += 1;
                }
            }
            i = 0;
        }
        dom.css({
            'top':-top+"px"  //dom标签的动画为向上移动；
        });
        i += 1;
    },endtime);
    
}



alert(13);
var prizenumarr = new Array();
var flag1=0;
while(flag1==0){
    var win1 = Math.ceil(Math.random()*imgarr3.length);      // 获取从1到10的随机整数 ，取0的概率极小。
    var win2 = Math.ceil(Math.random()*imgarr3.length);      // 获取从1到10的随机整数 ，取0的概率极小。
    var win3 = Math.ceil(Math.random()*imgarr3.length);      // 获取从1到10的随机整数 ，取0的概率极小。
	if(win1!=win2 && win2!=win3 && win1!=win3){
		flag1=1;
		prizenumarr.push(imgarr3[win1]);
		prizenumarr.push(imgarr3[win2]);
		prizenumarr.push(imgarr3[win3]);
		break;
	}
}
// 结束抽奖
var stopbool = true; //true可以停止，防止多次触发停止，影响滚动
function stopfn(){

    if(stopbool){
        return false;
    }
    $("#stopbtn").html("正在停止");
    stopbool = true;
    $(".prizeboxtitle2box").hide();
    

    console.log("%o",prizenumarr);  
    if(isArray(prizenumarr)){
        for(var i = 0; i < prizenumarr.length; i++){ 
            var str = '<div class="prizeboxmove">'
                +'<div class="img">'
                    +'<img src='+prizenumarr[i].imgurl+' alt="">'
                    +'<p class="wp100 tac ">'+prizenumarr[i].imgname+'</p>'
                +'</div>'
            +'</div>';
            $(".prizeboximg").eq(i).append(str);
            console.log(str);  
        }
        endbool = true;
    }
    
}
//用户发送的ajax请求(这种请求是需要等待并禁止用户的其他操作)
function inAjax(url,reqData,callback){
	$.ajax({
        method: "post",
        dataType:"json",	        
        url:url,
        data:reqData,
        beforeSend:function(XMLHttpRequest){

        },
        complete:function(XMLHttpRequest, textStatus){

        },
        success:function(data){
        	callback(data);
        },
	    error:function(XMLHttpRequest, textStatus, errorThrown) {
    		console.log(textStatus);
        }
	});
};
// 弹窗提醒
function cog(msg){
    alert(msg);
}
// 判断是否为数组
//判断是否为数组且至少有一个元素;
function isArray(ar){
	if(!$.isArray(ar)){
		return false;
	}else if(ar.length<1){
		return false;
	}else{
		return true;
	}
}
//把url参数形式的字符串转成json
function getJson(parames){
	var fields = parames.split('&');
	var res = {};
	for(var i = 0;i<fields.length;i++){
	    var field = fields[i].split('=');
	    res[field[0]]=field[1];
	}
	return res;		
};