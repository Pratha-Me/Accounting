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

		<!--<link href="<%=path%>/Bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
        <script src="<%=path%>/Bootstrap/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
        <script src="<%=path%>/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
        <link href="<%=path%>/Bootstrap/css/style.css" rel="stylesheet" type="text/css"/>	

        <link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/fonts/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/css/util.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/css/main_log.css">

        <!--<script defer src="<%=path%>/Bootstrap/js/main.js"></script>-->
    </head>	

    <body>

        <div class="container-login100" style="background-image: url('<%=path%>/Bootstrap/image/bg-01.jpg');">
            <div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
                <div class="login100-form validate-form">
                    <span class="login100-form-title p-b-37">
                        Sign In
                    </span>

                    <div class="wrap-input100 validate-input m-b-20" data-validate="Enter email">
                        <input class="input100" id="user" type="text" name="username" placeholder="username or email" required="">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
                        <input class="input100" id="password" type="password" name="name" placeholder="password" required="">
                        <span class="focus-input100"></span>
                    </div>

                    <div class="container-login100-form-btn">
                        <button onclick="doLogin()" class="login100-form-btn">
                            Log In
                        </button>
                    </div>

                    <div style="text-align: center; margin-top: 50px;">
                        <a href="#" class="txt2 hov1">
                            Add Admin 
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="dropDownSelect1"></div>

        <script>
			var count = 0;
			function doLogin()
			{
				$('.btn').button('loading');
				var email = document.getElementById('user').value;
				var password = document.getElementById('password').value;
				$.ajax({type: "GET", url: "<%=path%>/Login", contentType: "application/json; charset=utf-8", dataType: "json",
					data: {'password': password, 'loginId': email},
					success: function (data)
					{
						$('.btn').button('reset');
						if (data.msg) {
//							console.log(data.token);
							window.location.assign("<%=path%>/Login/" + data.token);
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
