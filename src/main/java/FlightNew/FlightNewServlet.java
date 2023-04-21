package FlightNew;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FlightsDAO;
import pojo.Flights;

/**
 * Servlet implementation class FlightNewServlet
 */
@WebServlet("/FlightNewServlet")
public class FlightNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Flights f = new Flights();
		String flightName= request.getParameter("flightName");
		String source= request.getParameter("source");
		String destination= request.getParameter("destination");
		String arrivalTime= request.getParameter("arrival");
		String dateString = request.getParameter("departureDate");
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-mm-dd");//Convertion of String date to date Util date format to pass through setters and getters
		Date departureDate= null;
		try {
			departureDate = sdf.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		f.setDepartureDate(departureDate);
		f.setFlightName(flightName);
		f.setSource(source);
		f.setDestination(destination);
		f.setArrival(arrivalTime);
		f.setDuration(request.getParameter("duration"));
		f.setPrice(Integer.parseInt(request.getParameter("price")));
		request.getParameter("username");
		String userP= request.getParameter("username");
		FlightsDAO dao= new FlightsDAO();
		
		
		int row;
		try {
		if(dao.checkDuplicates(flightName, source, destination, arrivalTime, departureDate)==0) {
			row= dao.insert(f);
			System.out.println("DepartureDate: " + departureDate);
			System.out.println("dao.checkDuplicates(airlines, flightName):" + dao.checkDuplicates(flightName, source, destination, arrivalTime, departureDate));
			if(row>0) {
				System.out.println("Entered insert Flight Servlet");
				String Response= "success";
				request.setAttribute("Response", Response);
				request.getRequestDispatcher("Flight.jsp?username="+userP).forward(request, response);
			}
		}else {
			String Response= "success";
			request.setAttribute("Response", Response);
			request.getRequestDispatcher("FlightNew.jsp?username="+userP).forward(request, response);
		}
	}finally {
		System.out.println("Executed Flights New Servlet");
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
