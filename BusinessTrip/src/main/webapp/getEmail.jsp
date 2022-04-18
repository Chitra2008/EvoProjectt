<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>get email</title>
</head>
<body>

	<%@page
		import="com.mastek.demo.dao.EmpDao,com.mastek.demo.model.Employee"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%
	String email = request.getParameter("uname");

	String pass = request.getParameter("upass");

	Employee u = EmpDao.getRecordByEmail(email, pass);
	
	int a = u.getEmpId();

	session.setAttribute("email", email);
	session.setAttribute("pass", pass);

	if (u.equals(null)) {
		out.println("<center>" + "<b>Either You Enter Wrong UserName or Password</b>");
	%>
	<jsp:include page="loginPage.jsp" />
	<%
	} else {
	if (u.getPostdetailsid() == 0) {
		if (email.equalsIgnoreCase(u.getEmpEmail()) && pass.equalsIgnoreCase(u.getEpass())) {
			
			response.sendRedirect("EmpDash.jsp");

	
	} else {
	out.println("<center>" + "<b>Either You Enter Wrong UserName or Password</b>");
	%>
	<jsp:include page="loginPage.jsp" />
	<%
	}
	} else if (u.getPostdetailsid() > 0){
	if (email.equalsIgnoreCase(u.getEmpEmail()) && pass.equalsIgnoreCase(u.getEpass())) {

	response.sendRedirect("AdminDash.jsp");
	} else {
	out.println("<center>" + "<b>Either You Enter Wrong UserName or Password</b>");
	%>
	<jsp:include page="loginPage.jsp" />
	<%
	}
	}
	}
	%>

</body>
</html>