<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="assets/css/main.min.css" rel="stylesheet" />
<link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<title>Approved Banks</title>
</head>
<%
List<String> banks = (List<String>) request.getAttribute("listOfApprovedBanks");
%>
<body>



	<div class="page-heading">
		<h1 class="page-title">Approved Banks</h1>
	</div>

	<div class="page-content fade-in-up">
		<div class="ibox">
			<div class="ibox-body">
				<div class="scrollmenu">

					<div class="container">
						<%
						for (String s : banks) {
						%>
						<div class="row">
						<a href="fetchUserForBank.obj?bank=<%=s%>">
							<button class="btn btn-success mt-3">
								<%=s%>
							</button>
							
							</a>

						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>










</body>
</html>