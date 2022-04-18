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
    text-align:center;
	display: inline-block;
	margin-top: 100px;
	margin-left: 500px;
	width: 300px;
	height: 250px;
	padding: 5px;
	border: 1px solid black;
    position:absolute;
}

#div1{
text-align: center;}


</style>
</head>
<body>
	<%@page
		import="com.mastek.demo.dao.EmpDao, com.mastek.demo.model.Employee,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	
		<%
		String reqId = request.getParameter("reqId");
		boolean flag = EmpDao.ApproveLogic(Integer.parseInt(reqId));
		out.println(reqId);
		
		if(flag)
		{
			response.sendRedirect("AdminDash.jsp");
		}
		else
		{
			response.sendRedirect("myerrorEmailPage.jsp");
		}
	
		%>
		
	</body>
</html>