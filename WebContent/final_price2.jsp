<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="entity.*" %>
<%@ page import= "algorithm.* " %>
<%@ page import= "reward_belong_toPack.* " %>
<%@ page import="rewardPack.* " %>

<%@ page import="java.util.Vector" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Vector" %>
<%@ page import="admainPack.ReadU " %>

<!DOCTYPE html>


<%
	// 从session中获得 aid,pid即可
	// 如果数据量很大的话不要使用session，一个是有空间限制，而且session容易丢失还容易泄露
	// 中奖用户名单从服务器文件中读
	// 全体用户名单从数据库中读
	// 所有奖品也从数据库中获得
	
	//int aid = (int)session.getAttribute("id");
	//int pid = (int)session.getAttribute(" ");
	int pid=1;
	int aid=1;
	
	
	
	//检索数据库reward_belong_topac
	//获得奖品列表
	// ArrayList<Integer> rids = new ArrayList<Integer>();
	
	Reward_belong_toDAO rtool = new Reward_belong_toDAO(); //新建工具类
	Vector<Reward_belong_to> rlist = new Vector<Reward_belong_to>();  //该抽奖活动的奖品列表
	rlist = rtool.select(pid); //查找Reward_belong_to

	
	RewardDao rtool2 = new RewardDao();
	Vector<Reward> rlist2 = new Vector<Reward>();  //该抽奖活动的奖品列表
	
	
	for(int i=0;i<rlist.size();i++){
		int rid = rlist.get(i).getRid();
		Reward ritem =rtool2.select_the_reward_ID(rid); //查找Reward
		System.out.println(rid);
		rlist2.add(ritem);
	}
	
	
	
	//读取管理员上传上来的文件
	//获得参与抽奖的用户名单
	
	String now_path=application.getRealPath("/");
	System.out.println(now_path);
	Vector<Admain> ulist = new Vector<Admain>();  //所有的参与抽奖的用户名单
	ReadU tool3 = new ReadU();
	now_path=now_path.replace("\\", "/");
	ulist=tool3.readusers(now_path,pid);
	
	//读取服务器中已经存在的中奖名单
	Vector<Admain> ulist_win = new Vector<Admain>();  //中奖的用户名单

%>

<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>抽奖活动</title>
        <link rel="stylesheet" href="./css/prizedraw.css">
        
        
        <script src="./js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="./js/jquery.qrcode.min.js"></script>
        <script>
        
    	//console.log("normal");           // 用于输出普通信息
    	//console.info("information");     // 用于输出提示性信息
    	//console.error("error");          // 用于输出错误信息
    	//console.warn("warn");            // 用于输出警示信息
        //奖品的构造函数
        function reward(rid,pid,nums,llevel,aid,name,price,file){
        	
        	this.rid=rid;
        	this.pid=pid;
        	this.nums=nums;
        	this.llevel=llevel;
        	
        	this.aid=aid;
        	this.name=name;
        	this.price=price;
        	
        	this.file=file;
        	
        }
    	
		function reward_type2(prizename,prizenum,prizeurl,prizerank){
        	this.prizename=prizename;
        	this.prizenum=prizenum;
        	this.prizeurl=prizeurl;
        	this.prizerank=prizerank;
        }
	    var rlist= new Array();
	    var prizearr =new Array();
	    var now_path="<%=now_path%>"
	    var temp_path="./FileUpload/"
	    var final_path=now_path+temp_path;
	    //获得所有奖品
        <%for(int i=0;i<rlist.size();i++ ){%>
        	var rid=<%=rlist.get(i).getNums() %>;
        	var pid=<%=rlist.get(i).getPid() %>;
        	var nums=<%=rlist.get(i).getNums() %>;
        	var llevel=<%=rlist.get(i).getLlevel() %>;
        	var aid =<%=rlist2.get(i).getAid()%>;
        	var name="<%=rlist2.get(i).getName()%>";
        	var price=<%=rlist2.get(i).getPrice()%>;
        	var file="<%=rlist2.get(i).getFile()%>";
        	var path =temp_path+file;
        	console.log(path);
        	var ritem= new reward(rid,pid,nums,llevel,aid,name,price,file);
        	var class_name= ""+llevel+"等奖";
        	console.log("%o",class_name);   
        	var ritem_type2 = new reward_type2(name,nums,path,class_name);
        	console.log("%o",ritem_type2);           // 用于输出普通信息
         	console.log("%o",ritem);           // 用于输出普通信息
         	prizearr.push(ritem_type2);
        	rlist.push(ritem);
        <%}%>
        alert("2");
        //用户的构造函数
         function user(name,id,llevel,email,status,geo_point){
        	this.name=name;
        	this.id=id;
        	this.llevel=llevel;
        	this.email=email;
        	this.status=status;
        	this.geo_point=geo_point;
        }
        
        function user2(name){
        	this.imgname = name;
        	this.imgurl='./image/prizedraw/prizelist/6.jpg';
        }
     
         var ulist= new Array();
         var imgarr1 = new Array();
         var imgarr2 = new Array();
         var imgarr3 = new Array();
         var imgarr = new Array();
         //获得所有抽奖参与者
         <%for(int i=0;i<ulist.size();i++){ %>
         	var name ="<%=ulist.get(i).getName() %>";
         	var id =<%=ulist.get(i).getId() %>;
         	var llevel =<%=ulist.get(i).getLevel() %>;
         	var email ="<%=ulist.get(i).getEmail() %>";
         	var status =<%=ulist.get(i).getStatus() %>;
         	var reg_date ="<%=ulist.get(i).getReg_date()%> ";
         	var pass ="<%=ulist.get(i).getPass() %>";
         	var uitem= new user(name,id,llevel,email,status,reg_date,pass);
         	var uitem2 = new user2(name);
         	console.log("%o",uitem);           // 用于输出普通信息
         	ulist.push(uitem);
         	imgarr1.push(uitem2);
         	imgarr2.push(uitem2);
         	imgarr3.push(uitem2);
         <%}%>
         imgarr.push(imgarr1);
         imgarr.push(imgarr2);
         imgarr.push(imgarr3);
         
         
         
         
        alert("3");
        </script>
	</head>
	
	
	
	
	
	
	<body class="bodybg">
        <div class="imgbg re" id="vuesb">
            <img src="" alt="" srcset="">
            <h1 class="title">幸运抽抽抽</h1>
            <div class="titleline"></div>
            <div class="imgboxshow clear"></div>
            <!-- 实时更新报名人数 -->
            <div class="playnum">
                <span class="numti">已报名人数：</span>
                <span class="num">0</span>
            </div>
            <!-- 二维码生成div -->
            <div class="weixin">
                <div class="code overboximg"></div>
            </div>
            <div class="shows"></div>
            <div class="prizeboxout hide">
                <div class="prizebox">
                    <div class="prizetop">
                        <p class="wp100 cfff fs25 tac prizeboxtitle">奖</p>
                        <div class="prizeboxclose fg">×</div>
                        <div class="prizeboxline"></div>
                        <!-- 奖品放置div -->
                        <div class="prizetopimg">
                            <div id="prizeboxshow1" class="prizeboxshow clear prizeboxshow1 re">
                            </div>
                        </div>
                        
                        
                        <div class="prizetopimg clear hide">
                            <div id="prizeboxshow2" class="prizeboxshow clear re">
                                
                            </div>
                        </div>
                        
                        <p class="wp100 cfff fs20 tac hide mt10 prizeboxtitle2box">恭喜以上用户抽中
                            <span class="prizeboxtitle2">奖</span>
                        </p>
                    </div>
                    <div class="prizebottom">
                        <div class="fg prizeboxstartbtn" id="startfn" onclick="startfn(this)">抽奖</div>
                        <div class="fg prizeboxstartbtn hide" id="stopbtn" onclick="stopfn()">停止</div>
                    </div>
                </div>
                <div class="overbox">
                    
                </div>
            </div>
        </div>
        <!-- <script src="/js/vue.min.js"></script> -->
	 <script src="./js/prizedraw.js"></script>
    </body>
</html>



