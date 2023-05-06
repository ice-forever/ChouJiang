<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CloudLottery Retrieve-password</title>
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
  <body>
    <div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
          <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>CloudLottery Retrieve-password</h1>
                  </div>
                  <p>云端，手机端，PC端一站式抽奖解决方案</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
                <!-- form action -->
                  <form method="post" class="form-validate" action="${pageContext.request.contextPath}/Servlets/CheckServlet">
                    <div class="form-group">
                      <input id="forgetpass-email" type="text" name="passwordemail" required data-msg="Please enter your email" class="input-material">
                      <label for="login-Email" class="label-material">Email</label>
                    </div>
                    <div class="form-group">
                      <input id="register-username" type="text" name="registerUsername" required="" data-msg="Please enter your username" class="input-material">
                      <label for="register-username" class="label-material">User Name</label>
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="text" name="loginValidateCode" required data-msg="Please enter the validate code" class="input-material">
                      <label for="login-password" class="label-material">Validate Code</label>
                      <img alt="验证码加载中" src="${pageContext.request.contextPath}/Servlets/DrawImage" id="validateCodeImg" onclick="changeImg()">
		              <a href="javascript:void(0)" onclick="changeImg()">看不清，换一张</a>
                    </div>
                    
                    <a id="login" href="" class="btn btn-primary" style="color:white">Send email</a>
                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                  </form>
                  
                  <form method="post" class="form-validate" action="${pageContext.request.contextPath}/Servlets/CheckServlet">
                    <div class="form-group">
                      <input id="forgetpass-validatecode" type="text" name="loginUsername" required data-msg="Please enter your username" class="input-material">
                      <label for="forgetpass-validatecode" class="label-material">Validate code received</label>
                    </div>
                    <div class="form-group">
                      <input id="change-password" type="password" name="changePassword" required data-msg="Please enter your password" class="input-material">
                      <label for="change-password" class="label-material">New password</label>
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                      <label for="login-password" class="label-material">Verify password</label>
                    </div>
                    
                    <a id="login" href="login.jsp" class="btn btn-primary" style="color:white">Change password</a>
                    <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                  </form>
                	
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>Design by <a href="#" class="external">CloudLottery</a>
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
1.现在所有控件都是居左,应该是居中；
2.验证码
3.背景图片
 -->