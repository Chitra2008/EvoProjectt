<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
<meta charset="ISO-8859-1">
<script type="text/javascript" src="passwordValidate.js"></script>
<style type="text/css">
	body {
  background: #e35869;
  font-family: 'Rubik', sans-serif;
}

	
	.selectt{
		display: none;
	}
	
	.container{
		align-content: center;
		background-color: #362b5e;
		color: aqua;
		width: 40%;
		height: 70%;
		border: 3px;
		border-color: red;
		padding: 2px;
		
	}
	
	.content{
		border: 10px;
		padding: 10px;
		border-color: red;
	}
	
	input:hover{
	 box-shadow: 0 1px 5px 1px #cccccc;
	 transform: scale(1.1);
	 }
	 
	.btn input{
		background-color: aqua;
		color: #362b5e;
		font-weight: bold;
	}
	
	#message{
		font-weight: bold;
	}
</style>


<title>Employee Details</title>
</head>
<body>
	<header><div></div></header>
	<div class="container">
	<h1 id="headline" style="color: aqua;">REGISTER HERE</h1>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
	<div class="content">
	<form action="AddUser.jsp" method="post">
		<div class="form-group">
			<label for="empName" class="mr-sm-2">Name: </label> <input
				type="text"  id="empName"
				placeholder="Enter your full name" name="empName" required><br>
		</div>

		<div class="form-group">
			<label for="empEmail" class="mr-sm-2">email: </label> <input
				type="email" class="mb-2 mr-sm-2"
				placeholder="Enter your email" id="empEmail" name="empEmail" required><br>
		</div>
		
		<div class="form-group">
			<label for="passport" class="mr-sm-2">Passport: </label> <input
				type="text" class="mb-2 mr-sm-2"
				placeholder="Passport Number" id="passport" name="passport" required><br>
		</div>
		
		<div class="form-group">
			<label for="dob">Date of Birth: </label> <input type="date"
				id="dob" name="dob" required> <br> 
		</div>
		
		<div class="form-group">
			<label for="doj">Date of Joining: </label> <input type="date"
				id="doj" name="doj" required> <br> 
		</div>
		
		<div class="form-group">
			<label for="nation">Nationality: </label>
			<span class="dropdown">
			 <select name="nation"
				id="nation" required>
				<option value="India">India</option>
				<option value="U.S.">U.S.</option>
				<option value="China">China</option>
				<option value="Englend">England</option>
			</select><br>
			</span>
		</div>
		
		<div class="form-group">
			<label for="dept">Department: </label>
			<span class="dropdown">
			 <select name="dept"
				id="dept" required>
				<option value="A.D.">A.D.</option>
				<option value="ERP">Tech ERP</option>
				<option value="H.C.M.">H.C.M.</option>
				<option value="S.C.M.">S.C.M.</option>
			</select><br>
			</span>
		</div>
		
		<div class="jini">
			<label for="gender">Gender: </label>
			<div class="custom-control custom-radio custom-control-inline">

				<input type="radio" class="custom-control-input" id="customRadio3"
					name="gender" value="male" required> <label
					class="custom-control-label" for="customRadio3">Male</label>
			</div>

			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="customRadio4"
					name="gender" value="female" required> <label
					class="custom-control-label" for="customRadio4">Female</label> 
				<br>
			</div>
		</div>
		
		<div class="form-group">
			<label for="epass" class="mr-sm-2">Password: </label> <input
				type="password" class="mb-2 mr-sm-2"
				placeholder="Enter your password" id="epass" name="epass" required><br>
		</div>
		
		<div class="form-group">
			<label for="cpassword" class="mr-sm-2">Confirm Password: </label> <input
				type="password" class="mb-2 mr-sm-2" onkeyup="validate()"
				placeholder="Confirm your password" id="cpassword" name="cpassword" required>
				<p id="message"></p>
				
		</div>
		
		
		
		
		<div class="btn">
			<input type="submit" 
			 id="btn"  onclick="handleSubmit()"/>
		</div>
		
		<div class="btn">
			<input type="reset" 
			 id="btn" />
		</div>
		
		
		
			
			
		
		
	</form>
	</div>
	</div>
	
	<script type="text/javascript">
	//	function validatePassword(){
	//		let p = deocument.getElementById(password).value;
	//		let cp = deocument.getElementById(cpassword).value;
			
	//		if(p==cp){
	//			continue;
	//		}
	//		else{
	//			alert("Confirm the password again")
	//		}
	//	}
		$('#pass, #cpassword').on('keyup', function () {
 	 	if ($('#pass').val() == $('#cpassword').val()) {
   	 	$('#message').html('Matching').css('color', '#28fc03');
  		} else 
    		$('#message').html('Not Matching').css('color', 'red');
		});
		
			
		
		function handleSubmit(){
			alert("You are registered.");
		}
	</script>
</body>
</html>