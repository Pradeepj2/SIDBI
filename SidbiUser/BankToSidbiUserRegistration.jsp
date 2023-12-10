<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send To Sidb</title>
<link href="assets/css/main.min.css" rel="stylesheet" />
<link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="./assets/vendors/themify-icons/css/themify-icons.css"
	rel="stylesheet" />

<script src="./assets/vendors/jquery/dist/jquery.min.js"
	type="text/javascript"></script>
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
	List<Integer> list = (List<Integer>) request.getAttribute("loanApplications");
	%>
	<div class="container">
		<h2>Send To Sidbi</h2>
		<form action="sendToSidbiRequest.obj" method="POST">
			<fieldset class="form-section">
				<legend>Personal Details</legend>

				<select id="appId" name="appId" required>
					<option selected value="">-Select-</option>
					<%
					for (int id : list) {
					%>
					<option value="<%=id%>">Bank00<%=id%></option>

					<%
					}
					%>
				</select> <label for="name">Applicant Name:</label> <input type="text"
					id="name" name="name" readonly> <label for="email">Email:</label> <input
					type="email" id="email" name="email" readonly><label
					for="contact">Contact No:</label> <input type="number" id="contact"
					name="contact" readonly>

			</fieldset>


			<fieldset class="form-section">
				<legend>Occupation</legend>
				<label for="occupation">Occupation:</label> <input type="text"
					id="occupation" name="occupation" readonly>

				 <label for="loanApplyFor">Loan
					Apply For:</label> <input type="text" name="loanApplyFor" id="loanApplyFor" readonly>
				</select> <label for="vehicleNo">Vehicle No:</label> <input type="text"
					id="vehicleNo" name="vehicleNo" readonly> <label for="annualIncome">Annual
					Income:</label> <input type="number" id="annualIncome" name="annualIncome" readonly>

				<label for="desiredLoan">Desired Loan Amount:</label> <input
					type="number" id="desiredLoan" name="desiredLoan" readonly> <label
					for="downPayment">Down Payment:</label> <input type="number"
					id="downPayment" name="downPayment" readonly>
			</fieldset>


			<input type="submit" value="Send To SIDBI">
		</form>
	</div>
</body>


<script>
	$("#appId").on("change", function() {
		var id = $(this).val();

		$.ajax({
			type : "GET",
			url : "getSingleResponse.obj",
			data : {
				"id" : id
			},
			success : function(result) {
				var data = jQuery.parseJSON(result);
				$("#name").val(data.name);
				$("#email").val(data.email);
				$("#contact").val(data.contact);
				$("#occupation").val(data.occupation);
				$("#loanApplyFor").val(data.loanApplyFor);
				$("#vehicleNo").val(data.vehicleNo);
				$("#desiredLoan").val(data.desiredLoan);
				$("#annualIncome").val(data.annualIncome);
				$("#downPayment").val(data.downPayment);
				
			}
		})
	});
</script>

</html>


