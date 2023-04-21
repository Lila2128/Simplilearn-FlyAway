<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pojo.Login" %>
    <%@ page import="DAO.LoginDAO" %>
    <%@ page import="java.util.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Home Page of Admin </title>
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
//Data coming from the Login Page servlet. 
String userP = request.getParameter("username");
LoginDAO ldao= new LoginDAO();
List<Login> Llist=ldao.retrieve(userP);
%>
<section class="overlay">
	<div class="Admin-profile">
		<h5 class="section-heading"> <b> CURRENT ADMIN </b></h5>
		<%for(Login list: Llist){ %>
		<h6 class="section-list"><b class="row-headings">Name:</b> <%=request.getParameter("username") %> </h6>
		<h6 class="section-list"><b class="row-headings">Email:</b> <%=list.getEmail()%></h6>
		
		<% String Response=(String) request.getAttribute("Response");
			if(Response == "success"){ %>
				<button type="button" class="btn btn-success btn-lg btn-block">Updated Successfully</button>
		<% }%>
		
		<form action="updateAdminServlet" method="post">
			<h5 class="section-heading"> NEW PROFILE DETAILS</h5>
			<p class="section-list">
				<b class="row-headings">FIRST NAME </b>  
				<input class="input-box" type="text" value="<%=list.getFirstName() %>" name="firstName">
				<br>
				<b class="row-headings">LAST NAME  </b> 
				<input class="input-box" type="text" value="<%=list.getLastName() %>" name="lastName">
				<br>
				<b class="row-headings">EMAIL </b>
				<input type="hidden" name="email" value="<%=list.getEmail() %>">  
				<b class="input-box"><%=list.getEmail()%></b>
				<!--  < String Email= list.getEmail(); >-->
				<br>
				<b class="row-headings">USERNAME </b>
				<input  type="hidden" name="username" value="<%=request.getParameter("username") %>">
				<b class="input-box"> <%=request.getParameter("username") %> </b>
				<br>
				<b class="row-headings">PASSWORD </b>
				<input class="input-box" type="text" value="Enter new Password" name="password">
			</p>
			<input class="submit" type="submit" value="Update">
		</form>
		<%} %>
	</div>
</section>
</body>
</html>