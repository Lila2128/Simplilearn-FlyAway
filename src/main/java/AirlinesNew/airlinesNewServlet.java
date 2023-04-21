package AirlinesNew;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AirlinesDAO;
import pojo.Airlines;

/**
 * Servlet implementation class airlinesNewServlet
 */
@WebServlet("/airlinesNewServlet")
public class airlinesNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public airlinesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Airlines air = new Airlines();
		String airlines= request.getParameter("airlines");
		String flightName= request.getParameter("flightName");
		air.setCapacity(request.getParameter("capacity"));
		air.setAirlines(airlines);
		air.setFlightName(flightName);
		request.getParameter("username");
		String userP= request.getParameter("username");
		AirlinesDAO dao= new AirlinesDAO();
		
		
		int row;
		try {
		if(dao.checkDuplicates(airlines, flightName)==0) {
			row= dao.insert(air);
			System.out.println("dao.checkDuplicates(airlines, flightName):" + dao.checkDuplicates(airlines, flightName));
			if(row>0) {
				System.out.println("Entered insert Places Servlet");
				String Response= "success";
				request.setAttribute("Response", Response);
				request.getRequestDispatcher("Airlines.jsp?username="+userP).forward(request, response);
			}
		}else {
			String Response= "success";
			request.setAttribute("Response", Response);
			request.getRequestDispatcher("AirlinesNew.jsp?username="+userP).forward(request, response);
		}
	}finally {
		System.out.println("Executed Airlines New Servlet");
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
