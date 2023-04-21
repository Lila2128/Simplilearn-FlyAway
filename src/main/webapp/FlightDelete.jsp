<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DAO.FlightsDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Delete</title>
</head>
<body>

<!-- Here Unique id is passed from the list when the record containing delete button is clicked. 
Which is further passed to the DAO delete method
Later the page is redirected to the list page  -->

	<%
		String FlightName=request.getParameter("flightName");
		String Source=request.getParameter("source");
		String Destination=request.getParameter("destination");
		String userP= request.getParameter("username");
		out.println(FlightName + Source + Destination);
		try{
			if(FlightsDAO.deleteFlights(FlightName, Source, Destination)>0){
				String Response= "success";
				request.setAttribute("Response", Response);
				request.getRequestDispatcher("Flight.jsp?username="+userP).forward(request, response);
			}
		}finally{
			String Response= "failed to Delete";
			request.setAttribute("Response", Response);
			request.getRequestDispatcher("Flight.jsp?username="+userP).forward(request, response);
		}
		
		
		%>

</body>
</html>