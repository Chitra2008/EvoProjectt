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
		String empId = request.getParameter("empId");
		String reqId = request.getParameter("reqId");
		Employee u = EmpDao.getRecordById(Integer.parseInt(empId));
		out.println(empId);
		out.println(reqId);
		out.println(u.getReqId());
	
		%>
		<span class="b">
		
		<div id="div1" class="form">
		<br><br>
		<h4  style="text-align:center"></h4>
		<label>Accommodation : <%= u.getAccom()%></label>	<br>
		<label>Advance : <%= u.getAdvance()%></label>	<br>
		<label>Amount : <%= u.getAmount()%></label>	<br>
		<label>Status : <%= u.getStatus()%></label>	<br><br>
		<label>rr : <%= u.getReqId()%></label>	<br><br>
			
		<td><a href="approvePage.jsp?reqId=${u.getReqId()}">Approve</a></td>
		<button type="button" class="btn btn-danger">Reject</button>
		</div>
		
		</span>
		
		
		<script type="text/javascript">
		
		
		</script>
	</body>
</html>