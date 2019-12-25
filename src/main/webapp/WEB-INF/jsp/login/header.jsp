<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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
        <!--<link href="<%=path%>/Bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
        <script src="<%=path%>/Bootstrap/js/jquery.min.js"></script>   
        <link href="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.css" rel="stylesheet" type="text/css"/>
        <script src="<%=path%>/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
        <link href="<%=path%>/Bootstrap/css/style.css" rel="stylesheet">
		<link href="<%=path%>/Bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="<%=path%>/Bootstrap/js/menujs.js" type="text/javascript"></script>
		
		<!-- Tell the browser to be responsive to screen width -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/fontawesome-free/css/all.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<!-- Tempusdominus Bbootstrap 4 -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
		<!-- iCheck -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
		<!-- JQVMap -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/jqvmap/jqvmap.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="<%=path%>/Admin/dist/css/adminlte.min.css">
		<!-- overlayScrollbars -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
		<!-- Daterange picker -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/daterangepicker/daterangepicker.css">
		<!-- summernote -->
		<link rel="stylesheet" href="<%=path%>/Admin/plugins/summernote/summernote-bs4.css">
		<!-- Google Font: Source Sans Pro -->
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

		<!-- jQuery -->
		<script defer="" src="<%=path%>/Admin/plugins/jquery/jquery.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script defer="" src="<%=path%>/Admin/plugins/jquery-ui/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<!-- Bootstrap 4 -->
		<script defer="" src="<%=path%>/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- ChartJS -->
		<script defer="" src="<%=path%>/Admin/plugins/chart.js/Chart.min.js"></script>
		<!-- Sparkline -->
		<script defer="" src="<%=path%>/Admin/plugins/sparklines/sparkline.js"></script>
		<!-- JQVMap -->
		<script defer="" src="<%=path%>/Admin/plugins/jqvmap/jquery.vmap.min.js"></script>
		<script defer="" src="<%=path%>/Admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
		<!-- jQuery Knob Chart -->
		<script defer="" src="<%=path%>/Admin/plugins/jquery-knob/jquery.knob.min.js"></script>
		<!-- daterangepicker -->
		<script defer="" src="<%=path%>/Admin/plugins/moment/moment.min.js"></script>
		<script defer="" src="<%=path%>/Admin/plugins/daterangepicker/daterangepicker.js"></script>
		<!-- Tempusdominus Bootstrap 4 -->
		<script defer="" src="<%=path%>/Admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
		<!-- Summernote -->
		<script defer="" src="<%=path%>/Admin/plugins/summernote/summernote-bs4.min.js"></script>
		<!-- overlayScrollbars -->
		<script defer="" src="<%=path%>/Admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
		<!-- AdminLTE App -->
		<script defer="" src="<%=path%>/Admin/dist/js/adminlte.js"></script>
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<script defer="" src="<%=path%>/Admin/dist/js/pages/dashboard.js"></script>
		<!-- AdminLTE for demo purposes -->
		<script defer="" src="<%=path%>/Admin/dist/js/demo.js"></script>

		<script defer="" src="<%=path%>/Bootstrap/js/jquery.min.js" type="text/javascript"></script>
		<script defer="" src="<%=path%>/Bootstrap/js/jqueryToast/jquery.toast.min.js" type="text/javascript"></script>
		<script defer="" src="<%=path%>/Bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	</head>

	<body class="hold-transition sidebar-mini layout-fixed">
		<div class="wrapper">

			<!-- Navbar -->
			<nav class="main-header navbar navbar-expand navbar-white navbar-light">
				<!-- Left navbar links -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
					</li>
					<li class="nav-item d-none d-sm-inline-block">
						<a href="home" class="nav-link">Home</a>
					</li>
					<li class="nav-item d-none d-sm-inline-block">
						<a href="#" class="nav-link">Contact</a>
					</li>
				</ul>

				<!-- SEARCH FORM -->
				<form class="form-inline ml-3">
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>

				<!-- Right navbar links -->
				<ul class="navbar-nav ml-auto">
					<!-- Messages Dropdown Menu -->
					<li class="nav-item dropdown">
						<a class="nav-link" data-toggle="dropdown" href="#">
							<i class="far fa-comments"></i>
							<span class="badge badge-danger navbar-badge">3</span>
						</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
							<a href="#" class="dropdown-item">
								<!-- Message Start -->
								<div class="media">
									<img src="<%=path%>/Admin/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
									<div class="media-body">
										<h3 class="dropdown-item-title">
											Brad Diesel
											<span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
										</h3>
										<p class="text-sm">Call me whenever you can...</p>
										<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
									</div>
								</div>
								<!-- Message End -->
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item">
								<!-- Message Start -->
								<div class="media">
									<img src="<%=path%>/Admin/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
									<div class="media-body">
										<h3 class="dropdown-item-title">
											John Pierce
											<span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
										</h3>
										<p class="text-sm">I got your message bro</p>
										<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
									</div>
								</div>
								<!-- Message End -->
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item">
								<!-- Message Start -->
								<div class="media">
									<img src="<%=path%>/Admin/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
									<div class="media-body">
										<h3 class="dropdown-item-title">
											Nora Silvester
											<span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
										</h3>
										<p class="text-sm">The subject goes here</p>
										<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
									</div>
								</div>
								<!-- Message End -->
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
						</div>
					</li>
					<!-- Notifications Dropdown Menu -->
					<li class="nav-item dropdown">
						<a class="nav-link" data-toggle="dropdown" href="#">
							<i class="far fa-bell"></i>
							<span class="badge badge-warning navbar-badge">15</span>
						</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
							<span class="dropdown-item dropdown-header">15 Notifications</span>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item">
								<i class="fas fa-envelope mr-2"></i> 4 new messages
								<span class="float-right text-muted text-sm">3 mins</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item">
								<i class="fas fa-users mr-2"></i> 8 friend requests
								<span class="float-right text-muted text-sm">12 hours</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item">
								<i class="fas fa-file mr-2"></i> 3 new reports
								<span class="float-right text-muted text-sm">2 days</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#">
							<i class="fas fa-th-large"></i>
						</a>
					</li>
				</ul>
			</nav>
			<!-- /.navbar -->

			<!-- Main Sidebar Container -->
			<aside class="main-sidebar sidebar-dark-primary elevation-4">
				<!-- Brand Logo -->
				<a href="home" class="brand-link">
					<img src="<%=path%>/Admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
						 style="opacity: .8">
					<span class="brand-text font-weight-light">AdminLTE 3</span>
				</a>

				<!-- Sidebar -->
				<div class="sidebar">
					<!-- Sidebar user panel (optional) -->
					<div class="user-panel mt-3 pb-3 mb-3 d-flex">
						<div class="image">
							<img src="<%=path%>/Admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
						</div>
						<div class="info">
							<a href="#" class="d-block">Alexander Pierce</a>
						</div>
					</div>

					<!-- Sidebar Menu -->
					<nav class="mt-2">
						<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
							<!-- Add icons to the links using the .nav-icon class
								 with font-awesome or any other icon font library -->
							<li class="nav-header">HOME</li>
							<li class="nav-item has-treeview menu-open">
								<a href="#" class="nav-link">
									<i class="nav-icon fas fa-tachometer-alt"></i>
									<p>
										Dashboard
										<i class="right fas fa-angle-left"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="<%=path%>/Admin/./index.html" class="nav-link active">
											<i class="far fa-circle nav-icon"></i>
											<p>Dashboard v1</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/./index2.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Dashboard v2</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/./index3.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Dashboard v3</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item has-treeview">
								<a href="#" class="nav-link">
									<i class="nav-icon fas fa-chart-pie"></i>
									<p>
										Charts
										<i class="right fas fa-angle-left"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/charts/chartjs.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>ChartJS</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/charts/flot.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Flot</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/charts/inline.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Inline</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item has-treeview">
								<a href="#" class="nav-link">
									<i class="nav-icon fas fa-edit"></i>
									<p>
										Forms
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/forms/general.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>General Elements</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/forms/advanced.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Advanced Elements</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/forms/editors.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Editors</p>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item has-treeview">
								<a href="#" class="nav-link">
									<i class="nav-icon fas fa-table"></i>
									<p>
										Tables
										<i class="fas fa-angle-left right"></i>
									</p>
								</a>
								<ul class="nav nav-treeview">
									<li class="nav-item">
										<a href="<%=path%>/DummyInfo" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>DummyInfo</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/tables/simple.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>Simple Tables</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/tables/data.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>DataTables</p>
										</a>
									</li>
									<li class="nav-item">
										<a href="<%=path%>/Admin/pages/tables/jsgrid.html" class="nav-link">
											<i class="far fa-circle nav-icon"></i>
											<p>jsGrid</p>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
					<!-- /.sidebar-menu -->
				</div>
				<!-- /.sidebar -->
			</aside>

			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0 text-dark">PRATHA</h1>
							</div><!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="home">Home</a></li>
									<li class="breadcrumb-item active">Dashboard v1</li>
								</ol>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.container-fluid -->
				</div>
				<!-- /.content-header -->