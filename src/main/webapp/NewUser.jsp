<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Add Admin </title>
<link rel="stylesheet" type="text/css" href="commonCssFile.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<nav class="homePage-navbar">
        <div class="homePage-logo">
		<img src="flight_logo.jpg" class="homePage-icon" ></img>
		<span class="HomePage-logo-name">FlyAway</span>
		<ul class="navbar homePage">
            <li class="nav-item nav-link HomeButton">
                <a href="indexLogin.jsp" class="nav-link">Home</a>
            </li>
        </ul>
        </div>
</nav>	
<div class="container_admin">
<form action="newUserServlet" method="post">

Enter your First Name <input name="firstName" type="text" required>
<br><br>
<div class="form-group"></div>
Enter your Last Name <input name="lastName" type="text" required>
<br><br>
<div class="form-group"></div>
Enter your Email  <input name="email" type="text" required>
<br><br>
<div class="form-group"></div>
Enter your UserName <input name="username" type="text" required>
<br><br>
<div class="form-group"></div>
Enter your Password <input name="password" type="text" required>
<br><br>
<input name="submit" type="submit" value="Add User">
</form>
</div>

</body>
</html>