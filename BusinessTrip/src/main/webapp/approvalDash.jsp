<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>approvalPage</title>
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
	margin: 90px;
	width: 300px;
	height: 430px;
	padding: 5px;
	border: 1px solid black;
	background-color: #362b5e;
	height: 430px;
}

#headline1 {
	text-align: center;
	color: white;
	padding-bottom: 10px;
}

#div1 {
	color: white;
}

#div2 {
	text-align: center;
}

ul {
	display: flex;
	flex-direction: column;
	gap: 10px;
}
</style>
</head>
<body>
	<%@page
		import="com.mastek.demo.dao.EmpDao,com.mastek.demo.model.*,java.util.ArrayList,java.util.List"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Employee List</h1>
	<br>
	<br>

	<%
	List<Employee> list = EmpDao.getAllRecords();
	request.setAttribute("list", list);
	%>

	<table border="1" width="90%">
		<tr>
			<th>Name</th>
			<th>Depart</th>
			<th>Destination</th>
			<th>Travel Date</th>
			<th>Show</th>

		</tr>
		<c:forEach items="${list}" var="u">
			<tr>

				<td>${u.getEmpName()}</td>
				<td>${u.getDepart()}</td>
				<td>${u.getDestination()}</td>
				<td>${u.getTravelDate() }</td>
				<td><a href="showreq.jsp?empId=${u.getEmpId()}&reqId=${u.getReqId()}">Show</a></td>
			</tr>

		</c:forEach>

	

	</table>
</html>