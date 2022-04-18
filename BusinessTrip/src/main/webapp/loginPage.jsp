<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login page</title>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Rubik:400,700'><link rel="stylesheet" href="./style1.css">

</head>

<style>
a, a:hover, a:focus, a:active {
      text-decoration: none;
      color: inherit;
 }
 
 .action1 input{
		background-color: aqua;
		color: #362b5e;
		font-weight: bold;
	}
</style>
 
 </script>
<body>
<!-- partial:index.partial.html -->
<div class="login-form">
  <form class="form" action="getEmail.jsp" method="post">
  


    <h1>Login</h1>
      <br><br>
    
    <div class="content">
      <div class="input-field">
        <input type="email" placeholder="Email" autocomplete="nope" id="email" name="uname"> 
      </div>
      <div class="input-field">
        <input type="password" placeholder="Password" autocomplete="new-password" id="pass" name="upass">
    <div class="action">
      <button>Login</button>
    </div>
 </form>
 <br> <br>
 
		<a href="register.jsp">Register</a>


</body>
</html>
