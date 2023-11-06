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
	List<Object[]> bankList = (List<Object[]>) request.getAttribute("banksList");
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
					</a> <!-- <div class="collapse" id="tables">
							<ul class="nav flex-column sub-menu">
								<li class="nav-item"><a class="nav-link"
									href="pages/tables/basic-table.html">Basic table</a></li>
							</ul>
						</div> --></li>
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

			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Apply For Loan</h4>
									<form action="saveLoanUserRegistration.obj" method="POST"
										enctype="multipart/form-data">
										<!-- <p class="card-description">Personal info</p> -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Applicant
														Name</label>
													<div class="col-sm-8">
														<input type="text" id="name" name="name"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Email</label>
													<div class="col-sm-8">
														<input type="email" id="email" name="email"
															class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Birth Date</label>
													<div class="col-sm-8">
														<input type="date" id="dob" name="dob"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Contact No</label>
													<div class="col-sm-8">
														<input type="number" id="contact" name="contact"
															class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Occupation</label>
													<div class="col-sm-8">
														<input type="text" id="occupation" name="occupation"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Company Name</label>
													<div class="col-sm-8">
														<input type="text" id="companyName" name="companyName"
															class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Employee Id</label>
													<div class="col-sm-8">
														<input type="text" id="empId" name="empId"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">

													<label class="col-sm-4 col-form-label">Bank</label>
													<div class="col-sm-8">
														<select class="form-control" name="bankName" id="bankName"
															required>
															<option selected disabled value="">-Select-</option>
															<%
															for (Object[] bank : bankList) {
															%>
															<option value="<%=bank[1]%>"><%=bank[1]%></option>
															<%
															}
															%>
														</select>
													</div>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Loan Apply
														For</label>
													<div class="col-sm-8">
														<select class="form-control" name="loanApplyFor"
															id="loanApplyFor" required>
															<option selected disabled value="">-Select-</option>
															<option>Two Wheeler</option>
															<option>Three Wheeler</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Vehicle No</label>
													<div class="col-sm-8">
														<input type="text" id="vehicleNo" name="vehicleNo"
															class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Annual
														Income</label>
													<div class="col-sm-8">
														<input type="number" id="annualIncome" name="annualIncome"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Desired Loan
														Amount </label>
													<div class="col-sm-8">
														<input type="number" id="desiredLoan" name="desiredLoan"
															class="form-control" required>
													</div>

												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Down Payment</label>
													<div class="col-sm-8">
														<input type="number" id="downPayment" name="downPayment"
															class="form-control" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row"></div>
											</div>

										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Pan Card</label>
													<div class="col-sm-8">
														<input type="file" name="panCard" required
															class="form-check-input" />
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Adhaar Card
													</label>
													<div class="col-sm-8">
														<input type="file" name="aadharCard"
															class="form-check-input" required>
													</div>

												</div>
											</div>

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






























































<%-- <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply For Loan</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.container {
	max-width: 500px;
	margin: 0 auto;
	background: #ffffff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

.form-section {
	margin-bottom: 20px;
	padding: 10px;
	background: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.form-section legend {
	font-weight: bold;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], input[type="number"], input[type="date"],
	input[type="file"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background: #333;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background: #555;
}
</style>
</head>
<body>
<body>
<%
	List<Object[]> bankList = (List<Object[]>) request.getAttribute("banksList");
	%>
	<div class="container">
		<h2>Apply For Loan</h2>
		<form action="saveLoanUserRegistration.obj" method="POST"
			enctype="multipart/form-data">
			<fieldset class="form-section">
				<legend>Personal Details</legend>
				<label for="name">Applicant Name:</label> <input type="text"
					id="name" name="name"> <label for="email">Email:</label> <input
					type="email" id="email" name="email"> <label for="dob">Birth
					Date:</label> <input type="date" id="dob" name="dob"> <label
					for="contact">Contact No:</label> <input type="number" id="contact"
					name="contact">

			</fieldset>


			<fieldset class="form-section">
				<legend>Occupation</legend>
				<label for="occupation">Occupation:</label> <input type="text"
					id="occupation" name="occupation"> <label for="companyName">Company
					Name:</label> <input type="text" id="companyName" name="companyName">

				<label for="empId">Employee Id:</label> <input type="text"
					id="empId" name="empId"> <label for="bankName">Bank
				</label> <select name="bankName" id="bankName" required>
					<option selected value="">-Select-</option>
					<%
					for (Object[] bank : bankList) {
					%>
					<option value="<%=bank[1]%>"><%=bank[1]%></option>
					<%
					}
					%>
				</select> <label for="loanApplyFor">Loan Apply For:</label> <select
					name="loanApplyFor" id="loanApplyFor" required>
					<option selected value="">-Select-</option>
					<option>Two Wheeler</option>
					<option>Three Wheeler</option>
				</select> <label for="vehicleNo">Vehicle No:</label> <input type="text"
					id="vehicleNo" name="vehicleNo"> <label for="annualIncome">Annual
					Income:</label> <input type="number" id="annualIncome" name="annualIncome">

				<label for="desiredLoan">Desired Loan Amount:</label> <input
					type="number" id="desiredLoan" name="desiredLoan"> <label
					for="downPayment">Down Payment:</label> <input type="number"
					id="downPayment" name="downPayment">
			</fieldset>

			<fieldset class="form-section">
				<legend>Upload Document</legend>
				<label>Pan Card</label> <input type="file" name="panCard" required />
				<label>Adhaar Card</label> <input type="file" name="aadharCard"
					required />
			</fieldset>

			<input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>


 --%>