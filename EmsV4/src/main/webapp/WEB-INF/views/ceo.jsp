<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style>
btn {
	background: #2ecc71;
	width: 150px;
	padding-top: 5px;
	padding-bottom: 5px;
	color: white;
	border-radius: 4px;
	border: #27ae60 1px solid;
	margin-top: 20px;
	margin-bottom: 20px;
	float: center;
	margin-left: 16px;
	font-weight: 800;
	font-size: 1.5em;
}
</style>
<title></title>
</head>
<body>




	<div id="home" class="ui-content" align="center">

		<form action="hire" method="post">
			<input type="submit" class="btn" value="Hire Employee" />
		</form>
		<form action="deleteEmp" method="post">
			<input type="submit" class="btn" value="Delete Employee" />
		</form>
		<form action="showemployee" method="post">
			<input type="submit" class="btn" value="show All Employee" />
		</form>
		<form action="showEmpUnderYou" method="post">
			<input type="submit" class="btn" value="show Employee under You" />
		</form>
		<form action="promoteEmp" method="post">
			<input type="submit" class="btn" value="PromoteEmployee" />
		</form>

		
	</div>





</body>
</html>