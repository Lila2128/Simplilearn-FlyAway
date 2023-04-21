<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DAO.FlightsDAO" %>
    <%@ page import="pojo.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.ParseException"%>
    <%@ page import="java.text.SimpleDateFormat" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> User Desired Flights </title>
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
<%
	User user = new User();
	String source= request.getParameter("source");
	String destination= request.getParameter("destination");
	int traveller= Integer.parseInt(request.getParameter("traveller"));
	String dateDeparture = request.getParameter("departureDate");
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-mm-dd");//Convertion of String date to date Util date format to pass through setters and getters
	Date departureDate= null;
	try {
		departureDate = sdf.parse(dateDeparture);
	} catch (ParseException e) {
		e.printStackTrace();
	}
	user.setDepartureDate(departureDate);
	user.setSource(source);
	user.setDestination(destination);
	user.setTraveller(traveller);
	out.println(traveller);
%>

<%
FlightsDAO adao= new FlightsDAO();
List<Flights> flist= adao.getFlights(departureDate, source, destination);
%>

<% String Response=(String) request.getAttribute("Response");
			if(Response == "success"){ %>
				<button type="button" class="btn btn-success btn-lg btn-block">Action Successfully Done</button>
		<% }else if(Response == "failed to Delete"){%>
		<button type="button" class="btn btn-warning btn-lg btn-block">Booking Failed</button>
	<% } %>
	
	<div class="Places-Master">
		<h4 class="Places-title"> Flights</h4>
		<h6>Price will be shown as per the Total Travellers: <%=user.getTraveller() %></h6>
	</div>
	<%int count=1; %>
	<div class="table-Places" >
		<div class="scroll-bar">
		
		<table class="table" border="1">
			<tr><th class="row1">#</th><th class="row1">Flights</th><th class="row1">Source</th><th class="row1">Destination</th>
			<th class="row1">Arrival</th><th class="row1">Duration</th><th class="row1">Departure Date</th><th class="row1">Price</th><th class="row1">Action</th></tr>
    	<% 
    	for(Flights list: flist){ %>
    	<%long FinalPrice= user.getTraveller() * list.getPrice(); %>

    	<tr class="rows"><td><%=count %></td><td><%=list.getFlightName() %></td><td><%=list.getSource() %></td>
    	<td><%=list.getDestination()%></td><td><%=list.getArrival() %></td><td><%=list.getDuration() %></td>
    	<td><%=list.getDepartureDate() %></td><td><%=FinalPrice %></td>
    	<td><a href="RegisterUserPage.jsp?flightName=<%=list.getFlightName() %>&source=<%=list.getSource() %>
    	&destination=<%=list.getDestination() %>&arrival=<%=list.getArrival() %>&duration=<%=list.getDuration() %>&departureDate=<%=list.getDepartureDate()%>&price=<%=FinalPrice%> ">Book</a></td></tr>
    	<% count=count+1; } %>
		</table>
		</div>
	</div>
	</body>
</html>