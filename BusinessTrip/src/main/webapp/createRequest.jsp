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
		width: 30%;
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
	
	
	#empEmail, #epass{
	
		display:none;
	}
</style>


<title>Create Request</title>
</head>
<body>
	<header><div></div></header>
	<div class="container">
	<h1 id="headline" style="color: aqua;">CREATE REQUEST</h1>
	</div>
	<br>
	<br>
	<br>
	<div class="container">
	<div class="content">
	<form action="addRequest.jsp" method="post">
	
		<div class="form-group">
			<label for="empEmail" class="mr-sm-2">Employee Email : </label> <input
				type="email" value="<%= session.getAttribute("email") %>" id="empEmail"
				placeholder="email" name="empEmail" required>
		</div>
		
		<div class="form-group">
			<label for="epass" class="mr-sm-2">password : </label> <input
				type="password" value="<%= session.getAttribute("pass") %>" id="epass"
				placeholder="pass" name="epass" required>
		</div>
	
		
	
		<div class="form-group">
			<label for="depart" class="mr-sm-2">Starting Point : </label> <input
				type="text"  id="depart"
				placeholder="From" name="depart" required>
		</div>
		

		<div class="form-group">
			<label for="destination" class="mr-sm-2">Destination : </label> <input
				type="text" class="mb-2 mr-sm-2"
				placeholder="To" id="destination" name="destination" required>
		</div>
		
		<div class="dob">
			<label for="travelDate">Date of Journey: </label> <input type="date"
				id="travelDate" name="travelDate"> <br> <br>
		</div>
		
		<div class="jini">
			<label for="accom">Accommodation Required: </label>
			<div class="custom-control custom-radio custom-control-inline">

				<input type="radio" class="custom-control-input" id="accom"
					name="accom" value="yes" required> <label
					class="custom-control-label" for="accom">Yes</label>
			</div>

			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="accom"
					name="accom" value="no" required> <label
					class="custom-control-label" for="accom">No</label> <br>
				<br>
			</div>
		</div>
		
		<div class="jini">
			<label for="advance">Advance Needed: </label>
			<div class="custom-control custom-radio custom-control-inline">

				<input type="radio" class="custom-control-input" id="customRadio3"
					name="advance" value="yes" required> <label
					class="custom-control-label" for="customRadio3">Yes</label>
			</div>

			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="customRadio4"
					name="advance" value="no" required> <label
					class="custom-control-label" for="customRadio4">No</label> <br>
				<br>
			</div>
		</div>
		
		<div class="form-group yes selectt">
			<label for="amount" class="mr-sm-2">Amount : </label> <input
				type="text" class="mb-2 mr-sm-2"
				placeholder="To" id="amount" name="amount" required>
			
			<span class="dropdown">
			 <select name="cur"
				id="curx" required>
				<option value="Rupee">Rupee</option>
				<option value="Dollar">Dollar</option>
				<option value="Yen">Yen</option>
				<option value="Pound">Pound</option>
			</select> <br> <br>
			</span>
		</div>
		
		
		<div class="btn">
			<input type="submit"
			 id="btn"  />
		</div>
		
		
			
			
		
		
	</form>
	</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
            $('#customRadio3').click(function() {
                var inputValue = $(this).attr("value");
                var targetBox = $("." + inputValue);
                $(".selectt").not(targetBox).hide();
                $(targetBox).show();
            });
            $('#customRadio4').click(function() {
                var inputValue = $(this).attr("value");
                var targetBox = $("." + inputValue);
                $(".selectt").not(targetBox).hide();
                $(targetBox).hide();
            });
        });
		
		function handleSubmit(){
			document.getElementById("submited").innerHTML=document.write("Request Created")
		}
	</script>
</body>
</html>