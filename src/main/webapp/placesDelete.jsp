<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DAO.PlacesDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Places</title>
</head>
<body>

<!-- Here Unique id is passed from the list when the record containing delete button is clicked. 
Which is further passed to the DAO delete method
Later the page is redirected to the list page  -->

	<%
		String source=request.getParameter("source");
		String userP= request.getParameter("username");
		PlacesDAO.deletePlaces(source);
		response.sendRedirect("Places.jsp?username="+userP);
		%>
</body>
</html>

