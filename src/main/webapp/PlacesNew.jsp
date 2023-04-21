<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Places</title>
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
            <li class="nav-item nav-link logoutButton">
            	<a href="logoutServlet" class="nav-link">Logout</a>
            </li>
        </ul>
	</div>
	
	<div class="HomePage-sidebar-content">
     	<ul class="homePage-list">
     		<li class="list-items">
     			<a href="homePage.jsp?username=<%=request.getParameter("username")%>"class="nav-link"> Admin </a></li>
     		<li class="list-items">
     			<a href="Airlines.jsp?username=<%=request.getParameter("username")%>" class="nav-link"> Airlines </a></li>
     		<li class="list-items">
     			<a href="Places.jsp?username=<%=request.getParameter("username")%>" class="nav-link" > Places </a> </li>
     		<li class="list-items">
     			<a href="Flight.jsp?username=<%=request.getParameter("username")%>" class="nav-link"> Flights </a></li>
     	</ul>
     </div>
</nav>

<section class="overlay">

<% String Response=(String) request.getAttribute("Response");
			if(Response == "success"){ %>
			<br>
				<button type="button" class="btn btn-warning btn-lg btn-small">Combination Already Exist. Please Enter a different Combination</button>
		<% }%>
		
		
	<div class="places-edit">
		<h3 class="section-heading"> Add Places </h3>
		<form action="placesNewServlet" method="get">
			<p class="Places-edit-column">
			<input  type="hidden" value="<%=request.getParameter("username") %> " name="username">
				<b class="row-headings"> Source:</b>
				<input class="input-box" type="text" name="source" required>
				<b class="row-headings"> Destination:</b>
				<input class="input-box" type="text" name="destination" required>
				<input type="submit" value="Add Place" name="submit">		
		</form>
	</div>
</section>

</body>
</html>