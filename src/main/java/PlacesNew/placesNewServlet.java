package PlacesNew;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PlacesDAO;
import pojo.Places;

/**
 * Servlet implementation class placesNewServlet
 */
@WebServlet("/placesNewServlet")
public class placesNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public placesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Places p = new Places();
		String source= request.getParameter("source");
		String destination= request.getParameter("destination");
		p.setSource(source);
		p.setDestination(destination);
		PlacesDAO dao= new PlacesDAO();
		String userP= request.getParameter("username");
		
		int row;
		if(dao.checkDuplicates(source, destination)==0) {
			row= dao.insert(p);
			System.out.println("dao.checkDuplicates(source, destination):" + dao.checkDuplicates(source, destination));
			if(row>0) {
				System.out.println("Entered insert Places Servlet");
				String Response= "success";
				request.setAttribute("Response", Response);
				request.getRequestDispatcher("Places.jsp?username="+userP).forward(request, response);
			}
		}else {
			String Response= "success";
			request.setAttribute("Response", Response);
			request.getRequestDispatcher("PlacesNew.jsp?username="+userP).forward(request, response);
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
