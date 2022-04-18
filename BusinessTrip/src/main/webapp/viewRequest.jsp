<!DOCTYPE html>

<html>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<%@page
		import="com.mastek.demo.dao.EmpDao,com.mastek.demo.model.Employee,  java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
	<h1	id="headline">Requests</h1>
	<br>
	<br>

	<div id="reqTable">
		<table border="1" width="90%">
		<tr>
			<th>reqId</th>
			<th>empId</th>
			<th>From</th>
			<th>To</th>
			<th>Date</th>
			<th>Accommodation</th>
			<th>Advance</th>
			<th>status</th>
			<th>Details</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getId()}</td>
				<td>${u.getEname()}</td>
				<td>${u.getEmail()}</td>
				<td>${u.getPhone()}</td>
				<td>${u.getGender()}</td>
				<td>${u.getDept()}</td>
				<td>${u.getDob()}</td>
				<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
				<td><a href="deleteuser.jsp?id=${u.getId()}">Show</a></td>
			</tr>
		</c:forEach>
	</table>
	
	</div>

	

</body>
</html>
