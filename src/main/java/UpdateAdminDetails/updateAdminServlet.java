package UpdateAdminDetails;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;
import pojo.Login;

/**
 * Servlet implementation class updateAdminServlet
 */
@WebServlet("/updateAdminServlet")
public class updateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName= request.getParameter("firstName");
		String lastName= request.getParameter("lastName");
		String email= request.getParameter("email");
		String username = request.getParameter("username");
		String password= request.getParameter("password");
		Login l= new Login();
		l.setFirstName(firstName);
		l.setLastName(lastName);
		l.setEmail(email);
		l.setUsername(username);
		l.setPassword(password);
		
		LoginDAO dao= new LoginDAO();
		int row;
		
		row=dao.update(l);
		System.out.println("row: "+ row);
		if(row >0) {
			System.out.println("Entered Update Servlet");
			String Response= "success";
			request.setAttribute("Response", Response);
			request.getRequestDispatcher("homePage.jsp").forward(request, response);
		}
		
	}

}
