<%@page import="com.mastek.demo.dao.EmpDao, com.mastek.demo.model.Employee"%>
<jsp:useBean id="u" class="com.mastek.demo.model.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<!DOCTYPE html>
<html>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Rubik:400,700'>
<link rel="stylesheet" href="./style1.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin dashBoard</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<%@page
		import="com.mastek.demo.dao.EmpDao,com.mastek.demo.model.Employee"%>



	<jsp:forward page="approvalDash.jsp" />
</body>
</html>