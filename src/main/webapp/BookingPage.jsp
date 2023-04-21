<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Booking Page </title>
<link rel="stylesheet" type="text/css" href="commonCssFile.css"  >
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


<div class="user-mx-auto" style="width: 1000px">
	<h1 align="center">  Flight Details  </h1>
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
		
	<br>
	<form method="get" action="Payment.jsp">
		<p class="Flight-edit-column">
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
			
		<input class="submit" type="submit" value="Book Now">
	</form>                                             
</div>

</body>
</html>