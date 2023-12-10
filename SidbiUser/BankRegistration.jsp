<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank Registration</title>
<link href="assets/css/main.min.css" rel="stylesheet" />
<link href="./assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
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

input[type="text"], input[type="email"], input[type="number"], input[type="date"] input[type="checkbox"],
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
	<div class="container">
		<h2>Bank Registration As PFI</h2>
		<form action="saveBankRegistration.obj" method="POST"
			enctype="multipart/form-data">
			<fieldset class="form-section">
				<legend> Details</legend>
				<label for="name">Name Of PFI:</label> <input type="text" id="pfi"
					name="pfi"> <label for="rbiLicence">RBI Licence:</label><input
					type="text" id="rbiLicence" name="rbiLicence">

				<div class="mt-2">
					<span>Minimum Two Years of Business:</span> <input type="checkbox"
						name="business" value="yes"> Yes <input type="checkbox"
						name="business" value="no"> No
				</div>

				<div class="mt-2">
					<span>NPA < 8% </span> <input type="checkbox" name="npa" value="yes">Yes</input>
					<input type="checkbox" name="npa" value="no">No</input>

				</div>
				<div class="mt-2">
					<span>Willing to share data for EV and loan performance</span> <input
						type="checkbox" name="WillingShare" value="yes">Yes</input> <input type="checkbox"
						name="WillingShare" value="no">No</input>
				</div>


				<label class="mt-2" for="type">Apply for</label> <select name="applyFor" id=""applyFor"">
					<option selected value="">-Select-</option>
					<option value="PCG">PCG</option>
					<option value="Onlanding">On Lending</option>
					<option value="Both">Both</option>
				</select>

			</fieldset>

			<fieldset class="form-section">
				<legend>Upload Document</legend>
				<label>Add Supporting Documents</label> <input type="file"
					name="docs" required />

			</fieldset>

			<input type="submit" value="Save">
		</form>
	</div>
</body>
</html>


