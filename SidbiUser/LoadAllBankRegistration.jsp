<%@page import="com.jci.model.BankRegistrationModel"%>
<%@page import="com.jci.model.SidbiUserRegistration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Bank Registration</title>
<link href="assets/css/main.min.css" rel="stylesheet" />
<link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="./assets/vendors/themify-icons/css/themify-icons.css"
	rel="stylesheet" />
</head>
<body>
	<div class="page-heading">
		<h1 class="page-title">Pending Bank Requests</h1>
	</div>
	<%
	List<BankRegistrationModel> list = (List<BankRegistrationModel>) request.getAttribute("bankApplications");
	%>
	<div class="page-content fade-in-up">
		<div class="ibox">

			<div class="ibox-head">
				<span>${msg}</span>
			</div>

			<div class="ibox-body">
				<div class="scrollmenu">
					<table class="table table-striped table-bordered table-hover"
						id="example-table" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>SN.</th>
								<th>Application No.</th>
								<th>PFI Name</th>
								<th>RBI Licence</th>
								<th>Apply For</th>
								<th>Status</th>
						</thead>
						<tbody>
							<%
							int i = 1;
							for (BankRegistrationModel requestEl : list) {
								if (requestEl.getApproved() == 0) {
							%>
							<tr>
								<td><%=i%></td>
								<td>BANK00<%=requestEl.getRefId()%></td>
								<td><%=requestEl.getPfiName()%></td>
								<td><%=requestEl.getRbiLicence()%></td>
								<td><%=requestEl.getApplyFor()%></td>
								<td>Pending</td>

								<td><a
									onclick="return confirm('Are you sure you want to Approve this Loan?');"
									href="approveBank.obj?reqId=<%=requestEl.getRefId()%>"
									class="btn btn-success btn-sm btn-block">Approve</a></td>
							</tr>
							<%
							}
							i++;
							}
							%>
						</tbody>

					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>