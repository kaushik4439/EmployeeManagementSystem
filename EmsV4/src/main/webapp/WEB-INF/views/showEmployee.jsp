<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<div id="employee" align="center">
		<h2>These are All Employee</h2>
		<table border="1">

			<tbody>

				<tr>
					<td>Employee ID</td>
					<td>Employee Name</td>
					<td>Employee Age</td>
					<td>Employee Designation</td>
				</tr>
				<c:forEach items="${allEmployee}" var="employee">
					<tr>
						<td><c:out value="${employee.employeeID}" /></td>
						<td><c:out value="${employee.name}" /></td>
						<td><c:out value="${employee.age}" /></td>
						<td><c:out value="${employee.designation}" /></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<span>${errormessage}</span>
	</div>

</body>
</html>