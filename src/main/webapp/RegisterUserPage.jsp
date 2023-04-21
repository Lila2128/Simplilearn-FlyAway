<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="pojo.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register User</title>
<link rel="stylesheet" type="text/css" href="commonCssFile.css"  >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<nav class="homePage-navbar">
     <div class="homePage-logo">
		<img src="flight_logo.jpg" class="homePage-icon"></img>
		<span class="HomePage-logo-name">FlyAway</span>
		<ul class="navbar homePage">
            <li class="nav-item nav-link HomeButton">
                <a href="indexLogin.jsp" class="nav-link">Home</a>
            </li>
        </ul>
     </div>
</nav>


<div class="user-mx-auto" style="width: 1000px">
	<h1 align="center">  REGISTER  </h1>
	<br>
	<form method="get" action="BookingPage.jsp">
		<p class="Flight-edit-column">
		<input type="hidden" value="<%=request.getParameter("flightName")%>" name="flightName">
		<input type="hidden" value="<%=request.getParameter("source")%>" name="source">
		<input type="hidden" value="<%=request.getParameter("destination")%>" name="destination">
		<input type="hidden" value="<%=request.getParameter("arrival")%>" name="arrival">
		<input type="hidden" value="<%=request.getParameter("duration")%>" name="duration">
		<input type="hidden" value="<%=request.getParameter("departureDate")%>" name="departureDate">
		<input type="hidden" value="<%=request.getParameter("price")%>" name="price">
		<br>
			<b class="row-headings"> First Name:</b>
			<input class="input-box" type="text" name="firstName" required>
    	</p>
    	<p class="Flight-edit-column">
			<b class="row-headings"> Last Name:</b>
			<input class="input-box" type="text" name="lastName" required>
		</p>
		<p class="Flight-edit-column">
			<b class="row-headings"> Age:</b>
			<input class="input-box" type="number" name="age" required>
		</p>
		<p class="Flight-edit-column">
			<b class="row-headings"> Phone:</b>
			<input class="input-box" type="number" name="phone" required>
		</p>
		<input class="submit" type="submit" value="submit">
	</form>                                             
</div>	
</body>
</html>