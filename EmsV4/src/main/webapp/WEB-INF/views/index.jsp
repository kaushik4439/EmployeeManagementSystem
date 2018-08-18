<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
.btn {
	background: #0000FF;
	width: 50%;
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

.inputText{
	background: #ecf0f1;
	border: #ccc 1px solid;
	border-bottom: #ccc 2px solid;
	padding: 8px;
	width: 50%;
	color: #AAAAAA;
	margin-top: 10px;
	font-size: 1em;
	border-radius: 4px;
}
</style>

<title>Spring Boot</title>
</head>
<body>
	<h1 align="center">Employee Management System</h1>
	<hr>

	<div class="form" class="ui-content" align="center">
		<form action="hello" method="post">
			<span style="color: red">${errormsg }</span><br>

			<h1>Enter your details</h1>

			<input type="text" name="id" placeholder="Employee Id" id = "empId"class="inputText" /><br><h5 id="id_error"></h5> <input
				type="password" name="password" placeholder="password" id="contact_pass" class="inputText" /> <br><h5 id="userPass_error"></h5>
				<input type="submit" class="btn" value = "Sign In" id = "button"/><br>

		
		</form>
		
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#id_error").hide();
		$("#userPass_error").hide();
		var error_id = false;
		var error_password = false;
		$("#empId").keyup(function(){
			checkId();
		});
		$("#contact_pass").keyup(function(){
			checkPassword();
		});
		function checkId(){
			var pattern = /^\d+$/;
			var name = $("#empId").val();

			
			if (pattern.test(name) && name !== '' && name.length < 15) {
				error_id = false;
				$("#id_error").hide();
			}
			else{
				$("#id_error").show();
				$("#id_error").html("**enter valid Id");
				$("#id_error").focus();
				$("#id_error").css("color", "red");
				error_id = true;
				return false;
			}
		}
		
		function checkPassword(){
			
			var name = $("#contact_pass").val();

			
			if (name !== '' && name.length >= 3 && name.length <= 15) {
				error_password = false;
				$("#userPass_error").hide();
			}
			else{
				$("#userPass_error").show();
				$("#userPass_error").html("**password must be b/w length 3 and 15");
				$("#userPass_error").focus();
				$("#userPass_error").css("color", "red");
				error_password = true;
				return false;
			}
		}
		
		
		$("#button").click(function(){
			checkId();
			checkPassword();
			if (error_id == false && error_password == false) {
				
				return true;
			}
			else{
				alert("enter correct details");
				return false;
			}

		});
		
	});
	</script>
</body>
</html>