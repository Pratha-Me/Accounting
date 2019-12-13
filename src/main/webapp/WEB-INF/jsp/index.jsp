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
        <style>
            /*            .btn{height: 28px; padding: 0px 16px;}*/
            .form-control{height: 28px;}
        </style>
    </head>
    
    <body id="body">
	<%--${msg}
	${msg1}
	${msg1}--%>
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
	
        <script>
		var count=0;
		function doLogin()
		{
			$('.btn').button('loading');
			var email = document.getElementById('email').value;
			var password = document.getElementById('password').value;
			$.ajax({type: "GET", url: "<%=path%>/Login?password=" + password + "&loginId=" +email, contentType: "application/json; charset=utf-8", dataType: "json",
				success: function (data)
				{
					$('.btn').button('reset'); 
					if(data.msg){ 
                                    window.location.assign("<%=path%>/Login/Verify?token="+data.token);						
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
