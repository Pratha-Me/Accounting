<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>

        <%
			String path = request.getContextPath();
			String token = "";
			try {
				token = session.getAttribute("token").toString();
				if (token.length() < 10) {
					out.print("<script>window.location.assign('" + path + "');</script>");
				}
			} catch (Exception e) {
				out.print("<script>window.location.assign('" + path + "');</script>");
			}
        %>

        <title>Welcome  </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="NOU">
        <meta name="keywords" content="NOUn">
        <meta name="author" content="NOU">
        <meta name="robots" content="index, follow" />
        <link rel="shortcut icon" type="image/x-icon" href="<%=path%>/Bootstrap/favicon.ico">
        <script>
			var path = "<%=path%>";
			var token = "<%=token%>";
			function checkAllBox(id, status) {
				$(id).attr("checked", status);
			}
        </script>
        <script src="<%=path%>/Bootstrap/js/jquery.min.js"></script>   
        <link href="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
        <script src="<%=path%>/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
        <link href="<%=path%>/Bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=path%>/Bootstrap/css/style.css" rel="stylesheet">
		<link href="<%=path%>/Bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="<%=path%>/Bootstrap/css/jquery-rvnm.css" rel="stylesheet" type="text/css"/>	
        <script src="<%=path%>/Bootstrap/js/menujs.js" type="text/javascript"></script>
		<script defer src="<%=path%>/Bootstrap/js/jquery-rvnm.js" type="text/javascript"></script>
	</head>

    <header id="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-6">


                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

                </div>
                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                    <div class="user-detail text-right" style="text-align: right;">
                        <p style="margin-top: -10px;">User Name  <span><%= ""%> </span> | <span><a href="<%= path%>/Utility/Backup">Backup</a> </span> </p>
                        <p style="margin-top: -10px;"><span><a href="<%= path%>/ChangePassword">Change Password</a></span> 
                            |  <span><a href="<%= path%>/Logout">Log Out</a></span></p>
                    </div>
                </div>

            </div>
        </div>
    </header>

	<!--
		<nav style="margin-top: 5px;" class="navbar"> 
			<div class="container">
				<ul id="myTab-1" role="tablist" class="nav nav-tabs portfolioFilter">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Setup  
							<span class="caret"></span></a>            
						<ul class="dropdown-menu" > 
							<li><a href="DummyInfo">DummyInfo</a></li>
						</ul>
					</li>
	
				</ul>
			</div>
		</nav>
	-->

<body>
	<nav id="navbar" class="">
		<ul>
			<li> <span class="spliter"> <i class="fa fa-cart-plus"></i> Aliquam dictum </span> </li>
			<li> <a href="#"> <i class="fa fa-bell-o"></i> eleifend risus </a>
				<ul>
					<li><a href="DummyInfo">DummyInfo</a></li>
					<li> <a href="#"> suscipit mauris </a> </li>
					<li> <a href="#"> sed placerat ipsum </a> </li>
					<li> <a href="#"> Proin turpis </a> </li>
				</ul>
			</li>
			<li> <a href="#"> <i class="fa fa-plus-square"></i> Nunc eleifend molestie velit. Morbi lobortis quam eu velit </a>
				<ul>
					<li> <a href="#"> semper leo </a> </li>
					<li> <a> habitasse platea </a>
						<ul>
							<li> <a href="#"> dictumst </a> </li>
							<li> <a href="#"> Vivamus facilisis </a> </li>
							<li> <a href="#"> In hac habitasse </a>
								<ul>
									<li><a href="#"> platea dictumst </a></li>
									<li><a href="#">Nunc sed lacus</a></li>
									<li><a href="#">euismod gravida </a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li> <a href="#"> sed placerat ipsum </a> </li>
				</ul>
			</li>
			<li class=""> <a href="#"> <i class="fa fa-bullhorn"></i> bibendum dapibus </a> </li>
			<li> <a href="#"> <i class="fa fa-building"></i> Proin nonummy </a> </li>
			<li> <span class="spliter"> <i class="fa fa-bars"></i> Nullam non diam </span> </li>
			<li> <a href="#"> <i class="fa fa-align-center"></i> platea dictumst </a>
				<ul>
					<li> <a href="#"> lacus at augue </a> </li>
					<li> <a href="#"> pede felis </a> </li>
					<li> <a href="#"> dignissim leo </a> </li>
				</ul>
			</li>
			<!--
   			<li> <a href="#"> <i class="fa fa-amazon"></i> second </a> </li>
			<li> <a href="#"> <i class="fa fa-apple"></i> third </a> </li>
			<li> <span class="spliter"> <i class="fa fa-desktop"></i> splliter teest </span> </li>
			<li> <a href="#"> <i class="fa fa-expand"></i> quis lectus </a>
				<ul>
					<li> <a href="#"> Nunc sed lacus </a> </li>
					<li> <a href="#"> Pellentesque </a> </li>
					<li> <a href="#"> malesuada nulla </a> </li>
				</ul>
			</li>
			<li> <a href="#"> <i class="fa fa-address-book"></i> ipsum urna sed risus </a> </li>
			<li> <span class="spliter"> <i class="fa fa-cut"></i> Maecenas fermentum </span> </li>
			<li> <a href="#"> <i class="fa fa-yoast"></i> sunt in culpa </a>
				<ul>
					<li> <a href="#"> officia deserunt </a> </li>
					<li> <a href="#"> mollit anim id </a> </li>
					<li> <a href="#"> id est laborum </a> </li>
				</ul>
			</li>
			<li> <a href="#"> <i class="fa fa-bank"></i> Aenean magna nisl </a> </li>
			-->
		</ul>
	</nav>

	<div id="wrapper">
	<!--js run code-->
	<script type="text/javascript">
			$(function () {
				var rvnMenu = $("#navbar").rvnm({
					//                    mode: 'mobile',
					//                    responsive: false,
//					searchable: true,
					theme: 'dark-lesb'
				});
				console.log(rvnMenu);
				//                rvnMenu.setMode('minimal');
				rvnMenu.setTheme('dark-ruby');
			});
			/*
			 var rvn<a href="https://www.jqueryscript.net/menu/">Menu</a> = $("#navbar").rvnm();
			 var rvnMenu = $("#navbar").rvnm({
			 mode: 'minimal'
			 });
			 var rvnMenu = $("#navbar").rvnm({
			 theme: 'dark-lesb'
			 });
			 var rvnMenu = $("#navbar").rvnm({
			 searchable: true
			 });
			 */
	</script>