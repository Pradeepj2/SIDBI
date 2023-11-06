<%@page import="com.sidbi.model.SidbiUserRegistration"%>
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
		List<Object[]> list = (List<Object[]>) request.getAttribute("loanApplications");
		String bankname = (String) request.getAttribute("bankName");
		String addString = "";
		if (bankname != "") {
			addString = "of " + bankname;
		}
		%>

		<h1 class="page-title">
			List Of Loan Applications
			<%=addString%></h1>
	</div>

	<div class="page-content fade-in-up mt-5">
		<div class="ibox">


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
								<td><%=requestEl[7]%></td>

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