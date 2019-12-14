<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="NOU">
        <meta name="keywords" content="NOUn">
        <meta name="author" content="NOU">
        <meta name="copyright" content="">
        <meta name="robots" content="index, follow" />
        <title>Welcome</title>
        <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/Bootstrap/favicon.ico">
        <link href="<%=path%>/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="<%=path%>/Bootstrap/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.js" 
		type="text/javascript"></script>
        <script src="<%=path%>/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.css" rel="stylesheet" 
			  type="text/css"/>
        <link href="<%=path%>/Bootstrap/css/style.css" rel="stylesheet" type="text/css"/>
		<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
		<!--link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/vendor/bootstrap/css/bootstrap.min.css"-->
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/fonts/iconic/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/vendor/animate/animate.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/vendor/css-hamburgers/hamburgers.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/vendor/animsition/css/animsition.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/vendor/select2/select2.min.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/vendor/daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/css/util.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/css/main_log.css">

        <style>
            /*            .btn{height: 28px; padding: 0px 16px;}*/
            .form-control{height: 28px;}
        </style>
    </head>

    <!--body id="body"-->
    <body>

		<div class="container-login100" style="background-image: url('<%=path%>/Bootstrap/image/bg-01.jpg');">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
			<form class="login100-form validate-form">
				<span class="login100-form-title p-b-37">
					Sign In
				</span>

				<div class="wrap-input100 validate-input m-b-20" data-validate="Enter username or email">
					<input class="input100" type="text" name="username" placeholder="username or email">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
					<input class="input100" type="password" name="pass" placeholder="password">
					<span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<button class="login100-form-btn">
						Sign In
					</button>
				</div>

				<div class="text-center p-t-57 p-b-20">
					<span class="txt1">
						Or login with
					</span>
				</div>

				<div class="flex-c p-b-112">
					<a href="#" class="login100-social-item">
						<i class="fa fa-facebook-f"></i>
					</a>

					<a href="#" class="login100-social-item">
						<img src="<%=path%>/Bootstrap/images/icons/icon-google.png" alt="GOOGLE">
					</a>
				</div>

				<div class="text-center">
					<a href="#" class="txt2 hov1">
						Sign Up
					</a>
				</div>
			</form>

			
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>
	
		<%--${msg}
		${msg1}
		${msg1}--%>
		<!--
        <section class="container login-form" style="margin-top: -100px">

            <form class="form-group" role="login">
                <section>
                    <img src="<%=path%>/Bootstrap/image/user.jpg" alt="" class="img-responsive" />
                    <div>
                        <input type='email' name="email" placeholder="email" id='email' class='form-control' value="ADMIN" required=""/>
                    </div>
                    <div >
                        <input type='password' name="name" placeholder="password" id='password' class='form-control' required=""/>

                    </div>

                    <label>&nbsp;</label>
                    <input onclick="doLogin()" type="button" value="Login" 
                           class="btn btn-lg btn-block btn-success" style="height: 35px;">

                </section>
            </form>

        </section>
  		-->

		<script src="<%=path%>/Bootstrap/vendor/jquery/jquery-3.2.1.min.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/animsition/js/animsition.min.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/bootstrap/js/popper.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/select2/select2.min.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/daterangepicker/moment.min.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/daterangepicker/daterangepicker.js"></script>
		<script src="<%=path%>/Bootstrap/vendor/countdowntime/countdowntime.js"></script>
		<script src="<%=path%>/Bootstrap/js/main.js"></script>


        <script>
			var count = 0;
			function doLogin()
			{
				$('.btn').button('loading');
				var email = document.getElementById('email').value;
				var password = document.getElementById('password').value;
				$.ajax({type: "GET", url: "<%=path%>/Login?password=" + password + "&loginId=" + email, contentType: "application/json; charset=utf-8", dataType: "json",
					success: function (data)
					{
						$('.btn').button('reset');
						if (data.msg) {
							window.location.assign("<%=path%>/Login/Verify?token=" + data.token);
						} else {
							messages(data.error);
						}
					},
					error: function (xhr, ajaxOptions, thrownError) {
						$('.btn').button('reset');
						messages('internet connection error');
					}
				});
			}
			function messages(msg) {
				$.toast({
					heading: "Messages",
					text: msg,
					icon: 'info',
					loader: true, // Change it to false to disable loader
					loaderBg: '#FFFFFF', // To change the background,
					position: 'mid-center'
				});
			}
        </script>
    </body>
</html>
