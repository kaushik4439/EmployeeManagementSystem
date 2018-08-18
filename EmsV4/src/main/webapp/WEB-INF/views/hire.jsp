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
.btn {
	background: #2ecc71;
	width: 100px;
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

.textInput {
	background: #ecf0f1;
	border: #ccc 1px solid;
	border-bottom: #ccc 2px solid;
	padding: 8px;
	width: 100px;
	color: #AAAAAA;
	margin-top: 10px;
	font-size: 1em;
	border-radius: 4px;
}
</style>

</head>
<body>
	
	
	<div id="add" align="center" class="ui-content" align="center">
		<h2>Enter Details of new Employee</h2>
		<form action="add" method="post">

			Enter Name :<input type="text" id="contact_name" name="name1"
				class="textInput">
			<h5 id="userName_error"></h5>
			Enter Password :<input type="password" name="password"
				id="contact_pass" class="textInput">
			<h5 id="userPass_error"></h5>
			Enter designation :<input type="text" name="designation"
				id="contact_desig" class="textInput">
			<h5 id="desig_error"></h5>
			Enter department : <input type="text" name="department" id="dept"
				class="textInput">
			<h5 id="dept_error"></h5>
			Enter Age :<input type="text" name="age" id="empAge"
				class="textInput">
			<h5 id="age_error"></h5>
			<input type="submit" value="submit" id = "button" >
			
			<br>
			<br> <span>${errormessage}</span>
		</form>
		
	</div>

	
	 
		<script type="text/javascript">
		
		$(document).ready(function() {
			$("#userName_error").hide();
			$("#desig_error").hide();
			$("#userPass_error").hide();
			$("#dept_error").hide();
			$("#age_error").hide();
			var error_username = false;
			var error_designation = false;
			var error_password = false;
			var error_department = false;
			var error_age = false;
			$("#contact_name").keyup(function(){
				check_name();
			});
			$("#contact_desig").keyup(function(){
				checkDesignation();
			});
			$("#contact_pass").keyup(function(){
				checkPassword();
			});
			$("#dept").keyup(function(){
				checkDepartment();
			});
			$("#empAge").keyup(function(){
				checkAge();
			});

			

			function check_name(){
				var pattern = /^[a-zA-Z]*$/;
				var name = $("#contact_name").val();

				
				if (pattern.test(name) && name !== '' && name.length < 15) {
					error_username = false;
					$("#userName_error").hide();
				}
				else{
					$("#userName_error").show();
					$("#userName_error").html("**enter valid user name");
					$("#userName_error").focus();
					$("#userName_error").css("color", "red");
					error_username = true;
					return false;
				}
			}
			
			function checkDesignation(){
				var pattern = /^[a-zA-Z]*$/;
				var name = $("#contact_desig").val();

				
				if (pattern.test(name) && name !== '' && name.length < 15) {
					error_designation = false;
					$("#desig_error").hide();
				}
				else{
					$("#desig_error").show();
					$("#desig_error").html("**enter valid designation");
					$("#desig_error").focus();
					$("#desig_error").css("color", "red");
					error_designation = true;
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
					error_designation = true;
					return false;
				}
			}
			function checkDepartment(){
				var pattern = /^[a-zA-Z]*$/;
				var name = $("#dept").val();

				
				if (pattern.test(name) && name !== '' && name.length < 15) {
					error_department = false;
					$("#dept_error").hide();
				}
				else{
					$("#dept_error").show();
					$("#dept_error").html("**enter valid designation");
					$("#dept_error").focus();
					$("#dept_error").css("color", "red");
					error_department = true;
					return false;
				}
			}
			function checkAge(){
				var pattern = /^\d+$/;
				var name = $("#empAge").val();

				
				if (pattern.test(name) && name !== '' && name.length < 15) {
					error_age = false;
					$("#age_error").hide();
				}
				else{
					$("#age_error").show();
					$("#age_error").html("**enter valid Age");
					$("#age_error").focus();
					$("#age_error").css("color", "red");
					error_age = true;
					return false;
				}
			}
			
			$("#button").click(function(){
				check_name();
				checkDesignation();
				checkPassword();
				checkDepartment();
				checkAge();
				if (error_username == false && error_designation == false && error_password == false && error_department == false && error_age == false) {
					
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