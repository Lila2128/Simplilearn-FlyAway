<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Booking Success </title>
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
<br><br><br>
<button type="button" class="btn btn-success btn-lg btn-block">Booking Successfully</button>
<div class="user-mx-auto" style="width: 1000px; padding-top: 80px">

		<h6 class="section-list"><b class="row-headings">Flight Name:</b> <%=request.getParameter("flightName") %> </h6>
		<h6 class="section-list"><b class="row-headings">Source:</b> <%=request.getParameter("source")%></h6>
		<h6 class="section-list"><b class="row-headings">Destination:</b> <%=request.getParameter("destination")%></h6>
		<h6 class="section-list"><b class="row-headings">Arrival:</b> <%=request.getParameter("arrival")%></h6>
		<h6 class="section-list"><b class="row-headings">Duration:</b> <%=request.getParameter("duration")%></h6>
		<h6 class="section-list"><b class="row-headings">Departure Date:</b> <%=request.getParameter("departureDate")%></h6>
		<h6 class="section-list"><b class="row-headings">Price:</b> <%=request.getParameter("price")%></h6>
		<br>
		<h6 class="section-list"><b class="row-headings">First Name:</b> <%=request.getParameter("firstName")%></h6>
		<h6 class="section-list"><b class="row-headings">Last Name:</b> <%=request.getParameter("lastName")%></h6>
		<h6 class="section-list"><b class="row-headings">Age:</b> <%=request.getParameter("age")%></h6>
		<h6 class="section-list"><b class="row-headings">Phone:</b> <%=request.getParameter("phone")%></h6>
	</div>	
</body>
</html>