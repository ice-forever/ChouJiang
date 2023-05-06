<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CloudLottery Login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="./vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="./vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="./css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="./css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="./css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="./assets/images/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        
    <script type="text/javascript">
     //刷新验证码
     function changeImg(){
         document.getElementById("validateCodeImg").src="${pageContext.request.contextPath}/servlets/DrawImage?"+Math.random();
     }
    </script>
    
  </head>
  <body background="./assets/images/bg.jpg">
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>登录界面</h1>
                  </div>
                  <p>请登录</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                <!-- form action -->
                  <form method="get" class="form-validate" action="CheckLogin">
                    <div class="form-group">
                      <input id="login-username" type="text" name="id" required data-msg="Please enter your username" class="input-material">
                      <label for="login-username" class="label-material">用户名</label>${requestScope.error3}
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="password" name="pass" required data-msg="Please enter your password" class="input-material">
                      <label for="login-password" class="label-material">密码</label>${requestScope.error2}
                    </div>
                    
                    <!-- 
                    <div class="form-group">
                      <input id="login-password" type="text" name="loginValidateCode" required data-msg="Please enter the validate code" class="input-material">
                      <label for="login-password" class="label-material">Validate Code</label>
                      
                      
                      <img alt="验证码加载中" src="${pageContext.request.contextPath}/Servlets/DrawImage" id="validateCodeImg" onclick="changeImg()">
		              <a href="javascript:void(0)" onclick="changeImg()">看不清，换一张</a>
		              
		              
                    </div>
                -->
                    <button type="submit"  id="login"  class="btn btn-primary">登录</button>
                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                  </form><a href="forget-pass.jsp" class="forgot-pass">忘记密码？?</a><br><small>没有账号？</small><a href="signup.jsp" class="signup">Signup</a>
                	
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>Design by <a href="#" class="external">CloudLottery</a>
          <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
        </p>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="./vendor/jquery/jquery.min.js"></script>
    <script src="./vendor/popper.js/umd/popper.min.js"> </script>
    <script src="./vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="./vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="./vendor/chart.js/Chart.min.js"></script>
    <script src="./vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="./js/front.js"></script>
  </body>
</html>


<!-- 
Q:solved
1.横向纵向自适应中,俩框横排的显示不出来--已解决,vendor文件夹写成了vender;

unsolved:
2.背景显示不出来
3.验证码部分验证码生成有问题
-->