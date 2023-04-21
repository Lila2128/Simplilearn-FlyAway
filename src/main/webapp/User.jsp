<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*"  %>
    <%@page import="pojo.*" %>
    <%@page import="DAO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home Page</title>
<link rel="stylesheet" type="text/css" href="commonCssFile.css"  >
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body style="background-color: #fff;">
	
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
AirlinesDAO adao= new AirlinesDAO();
PlacesDAO pdao= new PlacesDAO();
List<Places> plist= pdao.getallplaces();
List<Airlines> alist= adao.getallairlines();
%>

<div class="user-mx-auto" style="width: 1000px">
	<h1 align="center">  Search Lowest Price </h1>
	<br>
	<form method="get" action="UserDesiredFlights.jsp">
		<p class="Flight-edit-column">
			<b class="row-headings"> From:</b>
			<select name="source" class="input-box" required>
			<option>Select an option
	    		<%for(Places p:plist) {%>
	    		<option><%=p.getSource()%></option>
	    		<%} %>
	    	</select>
    	</p>
    	<p class="Flight-edit-column">
			<b class="row-headings"> To:</b>
	    	<select name="destination" class="input-box" required>
	    		<option>Select an option
	    		<%for(Places p :plist) {%>
	    		<option><%=p.getDestination()%></option>
	    		<%} %>
	    	</select>
    	</p>
    	<p class="Flight-edit-column">
			<b class="row-headings"> Departure Date:</b>
			<input class="input-box" type="date" name="departureDate" required>
		</p>
		<p class="Flight-edit-column">
			<b class="row-headings"> Traveler Numbers:</b>
			<input class="input-box" type="number" name="traveller" required>
		</p>
		<input class="submit" type="submit" value="submit">
	</form>                                             
</div>
</body>
</html>