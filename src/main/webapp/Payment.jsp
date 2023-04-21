<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dummy Payment Page</title>
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

<div class="flex_container_admin" style="width: 800px; border: 2px">
<h3 align="center"> Card Details </h3>
<form action="BookingSuccess.jsp" method="post">
	<input type="hidden" value="<%=request.getParameter("flightName")%>" name="flightName">
	<input type="hidden" value="<%=request.getParameter("source")%>" name="source">
	<input type="hidden" value="<%=request.getParameter("destination")%>" name="destination">
	<input type="hidden" value="<%=request.getParameter("arrival")%>" name="arrival">
	<input type="hidden" value="<%=request.getParameter("duration")%>" name="duration">
	<input type="hidden" value="<%=request.getParameter("departureDate")%>" name="departureDate">
	<input type="hidden" value="<%=request.getParameter("price")%>" name="price">	
	<input type="hidden" value="<%=request.getParameter("firstName")%>" name="firstName">
	<input type="hidden" value="<%=request.getParameter("lastName")%>" name="lastName">
	<input type="hidden" value="<%=request.getParameter("age")%>" name="age">
	<input type="hidden" value="<%=request.getParameter("phone")%>" name="phone">
		
	<h4>Card: <input type="number" name="card"></h4>
	<h4>Date of Expiry: <input type="date" name="doe"></h4>
	<h4>cvv: <input type="number" name="cvv"></h4>
	<h4>Name of Card Holder: <input type="text" name="nameOfCardHolder"></h4>
	<br>
	<input type="submit" value="submit">
</form>
</div>

</body>
</html>