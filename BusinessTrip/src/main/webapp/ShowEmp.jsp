<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>viewRequest</title>
<link rel="stylesheet" href="style.css" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

body {
  background: #e35869;
  font-family: 'Rubik', sans-serif;

}

span.b {
	display: inline-block;
	margin-top: 100px;
	margin-left: 500px;
	width: 400px;
	height: 400px;
	padding: 5px;
	border: 1px solid black;
    position:absolute;
}


</style>
</head>
<body>
	<%@page
		import="com.mastek.demo.dao.EmpDao,com.mastek.demo.model.Employee,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<%
		String empId = request.getParameter("empId");
		Employee u = EmpDao.getRecordById(Integer.parseInt(empId));
		%>
	
	
		<span class="b">
		<h3  style="text-align : center">Employee Details</h3>
		<br><br>
		<label>Employee Name : ${u.getEname()}</label>	<br><br>
		<label>Id :</label><br><br>
		<label>Department : </label>	<br><br>
		<label>Joining Date : </label>	<br><br>
		<label>Nationality :</label>	<br><br>
		<label>Nation ID :</label>	<br><br>
		<br>
		</div>
		
		</span>
	</body>
</html>