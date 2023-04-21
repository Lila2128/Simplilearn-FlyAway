<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
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

<div class="flex_container_admin" style="width: 500px">
<h3 align="center"> Log In </h3>
<form action="loginServlet" method="post">
<h4>UserName: <input type="text" name="username"></h4>
<h4>Password: <input type="password" name="password"></h4>
<br>
<input type="submit" value="submit">
</form>
</div>

</body>
</html>