<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DAO.*" %>
    <%@ page import="pojo.*" %>
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flights</title>
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
<%
FlightsDAO fdao= new FlightsDAO();
List<Flights> flist= fdao.getallFlights();
%>

<section class="overlay-places">

<% String Response=(String) request.getAttribute("Response");
			if(Response == "success"){ %>
				<button type="button" class="btn btn-success btn-lg btn-block">Action Successfully Done</button>
		<% }else if(Response == "failed to Delete"){%>
		<button type="button" class="btn btn-warning btn-lg btn-block">Deletion Failed</button>
	<% } %>
	
	<div class="Places-Master">
		<h4 class="Places-title"> Flights</h4>
		<a href="FlightNew.jsp?username=<%=request.getParameter("username")%>"><button type="button" class="btn btn-primary link-button">Add new Airline</button></a>
	</div>
	<%int count=1; %>
	<div class="table-Places" >
		<div class="scroll-bar">
		
		<table class="table" border="1">
			<tr><th class="row1">#</th><th class="row1">Flights</th><th class="row1">Source</th><th class="row1">Destination</th>
			<th class="row1">Arrival</th><th class="row1">Duration</th><th class="row1">Departure Date</th><th class="row1">Price</th><th class="row1">Action</th></tr>
    	<% 
    	for(Flights list: flist){ %>
    	
    	<tr class="rows"><td><%=count %></td><td><%=list.getFlightName() %></td><td><%=list.getSource() %></td>
    	<td><%=list.getDestination()%></td><td><%=list.getArrival() %></td><td><%=list.getDuration() %></td>
    	<td><%=list.getDepartureDate() %></td>
    	<td><%=list.getPrice() %></td><td><a href="FlightDelete.jsp?flightName=<%=list.getFlightName() %>&source=<%=list.getSource() %>
    	&destination=<%=list.getDestination() %>&username=<%=request.getParameter("username")%>">Delete</a></td></tr>
    	<% count=count+1; } %>
		</table>
		</div>
	</div>
</section>

</body>
</html>