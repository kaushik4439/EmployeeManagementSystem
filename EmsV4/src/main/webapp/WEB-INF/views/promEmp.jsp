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

.textInput {
	width: 50%;
	background: #ecf0f1;
	border: #ccc 1px solid;
	border-bottom: #ccc 2px solid;
	padding: 8px;
	width: 250px;
	color: #AAAAAA;
	margin-top: 10px;
	font-size: 1em;
	border-radius: 4px;
}
</style>
<title></title>
</head>
<body>

	<div id="promEmp" class="ui-content" align="center">
		<form action="promote" method="post">
			Enter Id of employee to promote :<input type="text" name="employeeId" id = "empId"
				class="textInput"><h5 id="id_error"></h5> Enter new designation :<input
				type="text" name="designation" class="textInput" id="contact_desig"><h5 id="desig_error"></h5><input
				type="submit" value="submit" id = "button" class="btn">
		</form>
		<br> 
		<br> <span>${errormessage}</span>
		
	
	</div>
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#id_error").hide();
		$("#desig_error").hide();
		var error_id = false;
		var error_designation = false;
		$("#empId").keyup(function(){
			checkId();
		});
		$("#contact_desig").keyup(function(){
			checkDesignation();
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
		
		$("#button").click(function(){
			checkId();
			checkDesignation();
			if (error_id == false && error_designation == false) {
				
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