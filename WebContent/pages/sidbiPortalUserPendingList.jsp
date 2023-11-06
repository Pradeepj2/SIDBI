<%@page import="com.sidbi.model.SidbiUserRegistration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sidbi User Applicants</title>
<link href="assets/css/main.min.css" rel="stylesheet" />
<link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
	<link href="./assets/vendors/themify-icons/css/themify-icons.css"
	rel="stylesheet" />
</head>
<body>
	<div class="page-heading">
		<h1 class="page-title">Sidbi User Applicants</h1>
	</div>
	<%
	List<Object[]> list = (List<Object[]>) request.getAttribute("loanApplications");
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
								<th>Applicant Id</th>
								<th>Applicant Name</th>
								<th>Loan For</th>
								<th>Status</th>
						</thead>
						<tbody>
							<%
							int i = 1;
							for (Object[] requestEl : list) {
							%>
							<tr>
								<td><%=i%></td>
								<td>BANK00<%=requestEl[0]%></td>
								<td><%=requestEl[13]%></td>
							
								<td><%=requestEl[12]%></td>
								
								<td>
									<%
									int check =(int) requestEl[2];
									if (check == 1) {
										out.print("Approved");
									} else {
										out.println("Pending");
									}
									%>
								</td>


								<td><a onclick="return confirm('Are you sure you want to Approve this Loan?');"
									href="approvedBySidbi.obj?reqId=<%=requestEl[0]%>&setIt=1"
									class="btn btn-success btn-sm btn-block">Approve</a></td>
									
								<td><a onclick="return confirm('Are you sure you want to Reject this Loan?');"
									href="approvedBySidbi.obj?reqId=<%=requestEl[0]%>&setIt=0"
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