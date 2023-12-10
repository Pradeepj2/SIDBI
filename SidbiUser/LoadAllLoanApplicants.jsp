<%@page import="com.jci.model.SidbiUserRegistration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Loan Applications</title>
<link href="assets/css/main.min.css" rel="stylesheet" />
<link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="./assets/vendors/themify-icons/css/themify-icons.css"
	rel="stylesheet" />
</head>
<body>
	<div class="page-heading">
		<%
		List<SidbiUserRegistration> list = (List<SidbiUserRegistration>) request.getAttribute("loanApplications");
	
		%>

		<h1 class="page-title">
			List Of Loan Applications</h1>
	</div>

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
								<th>Applicant Name</th>
								<th>Loan For</th>
								<th>Desired Amount</th>
								<th>Bank Status</th>
								<th>Loan Status</th>
						</thead>
						<tbody>
							<%
							int i = 1;
							for (SidbiUserRegistration requestEl : list) {
							%>
							<tr>
								<td><%=i%></td>
								<td>BANK00<%=requestEl.getUserId()%></td>
								<td><%=requestEl.getName()%></td>
								<td><%=requestEl.getLoanApplyFor()%></td>
								<td><%=requestEl.getDesiredLoan()%></td>
								<td>
									<%
									if (requestEl.getBankStatus() == 1) {
										out.print("Approved");
									} else {
										out.println("Pending");
									}
									%>
								</td>
								<td>
									<%
									if (requestEl.getSidbiStatus() == 1) {
										out.print("Approved");
									} else {
										out.println("Pending");
									}
									%>
								</td>


								<td><a
									onclick="return confirm('Are you sure you want to Approve this Loan?');"
									href="editStatus.obj?reqId=<%=requestEl.getUserId()%>&setIt=1"
									class="btn btn-success btn-sm btn-block">Approve</a></td>

								<td><a
									onclick="return confirm('Are you sure you want to Reject this Loan?');"
									href="editStatus.obj?reqId=<%=requestEl.getUserId()%>&setIt=0"
									class="btn btn-danger btn-sm btn-block">Reject</a></td>

							</tr>
							<%
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