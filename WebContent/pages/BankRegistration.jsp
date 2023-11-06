<%@page import="com.sidbi.model.BankRegistrationModel"%>
<%@page import="com.sidbi.model.SidbiUserRegistration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Of Bank Registration</title>
<!-- plugins:css -->
<link rel="stylesheet" href="vendors/feather/feather.css">
<link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="images/favicon.png" />
</head>

<body>
	<%
	String roleType = (String) request.getSession().getAttribute("roleType");
	String imgPath = "";
	String shortImg = "";
	if (roleType.equals("Manager")) {
		imgPath = "images/logo.png";
		shortImg = "images/shortLogo.jpg";
	} else {
		imgPath = "images/bank.png";
		shortImg = "images/bank.png";
	}
	%>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
				<a class="navbar-brand brand-logo mr-5" href="dashboardview.obj"><img
					src="<%=imgPath%>" class="mr-2" alt="logo" /></a> <a
					class="navbar-brand brand-logo-mini" href="dashboardview.obj"><img
					src="<%=shortImg%>" alt="logo" /></a>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<button class="navbar-toggler navbar-toggler align-self-center"
					type="button" data-toggle="minimize">
					<span class="icon-menu"></span>
				</button>
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item nav-search d-none d-lg-block">
						<div class="input-group">
							<div class="input-group-prepend hover-cursor"
								id="navbar-search-icon">
								<span class="input-group-text" id="search"> <i
									class="icon-search"></i>
								</span>
							</div>
							<input type="text" class="form-control" id="navbar-search-input"
								placeholder="Search now" aria-label="search"
								aria-describedby="search">
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item dropdown"><a
						class="nav-link count-indicator dropdown-toggle"
						id="notificationDropdown" href="#" data-toggle="dropdown"> <i
							class="icon-bell mx-0"></i> <span class="count"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
							aria-labelledby="notificationDropdown">
							<p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
							<a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-success">
										<i class="ti-info-alt mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">Application
										Error</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Just now</p>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-warning">
										<i class="ti-settings mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">Settings</h6>
									<p class="font-weight-light small-text mb-0 text-muted">
										Private message</p>
								</div>
							</a> <a class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-info">
										<i class="ti-user mx-0"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<h6 class="preview-subject font-weight-normal">New user
										registration</h6>
									<p class="font-weight-light small-text mb-0 text-muted">2
										days ago</p>
								</div>
							</a>
						</div></li>
					<li class="nav-item nav-profile dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
						id="profileDropdown"> <img src="images/faces/face28.jpg"
							alt="profile" />
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="profileDropdown">
							<a class="dropdown-item"> <i class="ti-settings text-primary"></i>
								Settings
							</a> <a class="dropdown-item"> <i
								class="ti-power-off text-primary"></i> Logout
							</a>
						</div></li>
					<li class="nav-item nav-settings d-none d-lg-flex"><a
						class="nav-link" href="#"> <i class="icon-ellipsis"></i>
					</a></li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-toggle="offcanvas">
					<span class="icon-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
					</div>
					<p class="settings-heading mt-2">HEADER SKINS</p>
					<div class="color-tiles mx-0 px-4">
						<div class="tiles success"></div>
						<div class="tiles warning"></div>
						<div class="tiles danger"></div>
						<div class="tiles info"></div>
						<div class="tiles dark"></div>
						<div class="tiles default"></div>
					</div>
				</div>
			</div>

			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link"
						href="dashboardview.obj"> <i class="icon-grid menu-icon"></i>
							<span class="menu-title">Dashboard</span>
					</a></li>

					<%
					if (roleType != null && (roleType.equals("Bank") || roleType.equals("Manager"))) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="bankRegistration.obj"> <i class="icon-layout menu-icon"></i>
							<span class="menu-title">PFI Registration</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="LoadAllBankRegistration.obj"> <i
							class="icon-columns menu-icon"></i> <span class="menu-title">Pending
								Request</span></i>
					</a></li>
					<% if(roleType.equals("Manager")) {%>
					
					<li class="nav-item"><a class="nav-link"
						href="LoadAllApprovedBank.obj"> <i
							class="icon-columns menu-icon"></i> <span class="menu-title">Approved
								PFI </span>
					</a></li>
					
					<%} %>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#charts" aria-expanded="false"
						aria-controls="charts"> <i class="icon-bar-graph menu-icon"></i>
							<span class="menu-title">OEM</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="charts">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link" href="#">Vehicle</a></li>
							</ul>
						</div></li>

					<%
					}
					if (roleType != null && (roleType.equals("Bank") || roleType.equals("User"))) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="registation.obj"> <i class="icon-grid-2 menu-icon"></i>
							<span class="menu-title">Apply For Loan</span></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="LoadAllLoanApplicantsList.obj"><i
							class="icon-contract menu-icon"></i> <span class="menu-title">Loan
								Applicants</span> </a> <!-- <div class="collapse" id="icons">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/icons/mdi.html">Mdi icons</a></li>
							</ul>
						</div> --></li>
					<%
					}
					%>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#auth" aria-expanded="false"
						aria-controls="auth"> <i class="icon-head menu-icon"></i> <span
							class="menu-title">User Pages</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="auth">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/login.html"> Login </a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/register.html"> Register </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="collapse" href="#error" aria-expanded="false"
						aria-controls="error"> <i class="icon-ban menu-icon"></i> <span
							class="menu-title">Error pages</span> <i class="menu-arrow"></i>
					</a>
						<div class="collapse" id="error">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/error-404.html"> 404 </a></li>
								<li class="nav-item"><a class="nav-link"
									href="pages/samples/error-500.html"> 500 </a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="pages/documentation/documentation.html"> <i
							class="icon-paper menu-icon"></i> <span class="menu-title">Documentation</span>
					</a></li>
				</ul>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Bank Registration As PFI</h4>
									<form class="form-sample" action="saveBankRegistration.obj"
										method="POST" enctype="multipart/form-data">
										<!-- <p class="card-description">Personal info</p> -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Name Of PFI</label>
													<div class="col-sm-9">
														<input type="text" id="pfi" name="pfi"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">RBI Licence</label>
													<div class="col-sm-9">
														<input type="text" id="rbiLicence" name="rbiLicence"
															class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-6 col-form-label">Minimum Two
														Years of Business</label>
													<div class="col-sm-2 col-form-label">
														<input type="radio" class="form-check-input col-sm-2"
															name="business" value="yes">Yes
													</div>
													<div class="col-sm-2 col-form-label">
														<input type="radio" class="form-check-input"
															name="business" value="no">no
													</div>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">Apply for</label>
													<div class="col-sm-9">
														<select class="form-control" name="applyFor" id="applyFor">
															<option selected disabled value="">-Select-</option>
															<option value="PCG">PCG</option>
															<option value="Onlanding">On Lending</option>
															<option value="Both">Both</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-6 col-form-label">NPA < 8% </label>
													<div class="col-sm-2 col-form-label">
														<input type="radio" class="form-check-input col-sm-2"
															name="npa" value="yes">Yes
													</div>
													<div class="col-sm-2 col-form-label">
														<input type="radio" class="form-check-input" name="npa"
															value="no">no
													</div>

												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-6 col-form-label">Upload
														Supporting Documents </label>
													<div class="col-sm-6">
														<input type="file" class="form-check-input" name="docs"
															required>
													</div>

												</div>
											</div>

										</div>



										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-6 col-form-label">Willing to
														share data for EV and loan performance</label>
													<div class="col-sm-2 col-form-label">
														<input type="radio" class="form-check-input col-sm-2"
															name="WillingShare" value="yes">Yes
													</div>
													<div class="col-sm-2 col-form-label">
														<input type="radio" class="form-check-input"
															name="WillingShare" value="no">no
													</div>

												</div>
											</div>
											<div class="col-md-6"></div>
										</div>
										<div class="text-center col-md-12">

											<button class="btn btn-success col-sm-3" type="submit">SUBMIT</button>
										</div>

									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->

			<!-- partial -->

			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>

	<!-- main-panel ends -->
	<!-- page-body-wrapper ends -->
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="js/off-canvas.js"></script>
	<script src="js/hoverable-collapse.js"></script>
	<script src="js/template.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<!-- End custom js for this page-->

</body>

</html>









