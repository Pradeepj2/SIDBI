<%@page import="java.util.List"%>
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


