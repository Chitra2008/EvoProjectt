<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Employee DashBoard</title>
<link rel="stylesheet" href="style.css" />
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

</head>

<style>
body {
  background: #e35869;
  font-family: 'Rubik', sans-serif;
}

span.b {

font-weight: bold;
}

</style>

<body>
	
	<%@page
		import="com.mastek.demo.dao.EmpDao,com.mastek.demo.model.Employee"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="ShowEmp.jsp">PROFILE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="createRequest.jsp?empId=${u.getEmpId()}">CREATE REQUEST</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="getUser.jsp">SHOW REQUEST</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<a class="navbar-brand" href="logout.html">LOG OUT</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>

	     
	     <%
	     
	     String email = (String)session.getAttribute("email");
	     String pass = (String)session.getAttribute("pass");

	     Employee u = EmpDao.getRecordByEmail(email, pass);
	     	     
		 int empId = u.getEmpId();
		 
		 u = EmpDao.getRecordById(empId);
		 
		 
		%>
	
	
		<span class="b">
		<h3  style="text-align : center">Employee Details</h3>
		<br><br>
		<label>Employee Name : <%= u.getEmpName()%> </label>	<br><br>
		<label>Department : <%= u.getDept()%></label>	<br><br>
		<label>Joining Date : <%= u.getDoj()%></label>	<br><br>
		<label>Nationality <%= u.getNation()%>:</label>	<br><br>
		<label>Nation ID : <%= u.getNationId()%></label>	<br><br>
		<br>
		</div>
		
		</span>

</body>
</html>