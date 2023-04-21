package NewUserServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;
import pojo.Login;

/**
 * Servlet implementation class newUserServlet
 */
@WebServlet("/newUserServlet")
public class newUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newUserServlet() {
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
		PrintWriter out= response.getWriter();
		Login l= new Login();
		l.setFirstName(request.getParameter("firstName"));
		l.setLastName(request.getParameter("lastName"));
		String email= request.getParameter("email"); 
		l.setEmail(email);
		l.setUsername(request.getParameter("username"));
		l.setPassword(request.getParameter("password"));
		
		LoginDAO dao=new LoginDAO();
		
		int row;
		if(dao.checkDuplicates(email) == 0) {
			row=dao.insert(l);
			if(row>0) {
				System.out.print("Entered user servlet DAO");
				request.getRequestDispatcher("indexLogin.jsp").include(request, response);
				response.setContentType("text/html");
				out.print("<html><body><h4 align='center'>User Added Successfully as an Admin</h4></body></html>");
			}
		}
		//get a condition to check through all the emails registered and give error if email is repeated.
		else {
			response.setContentType("text/html");
			request.getRequestDispatcher("NewUser.jsp").include(request, response);
			out.println("<html><body><h4 align='center'>User Already Exist <br> Please Enter a Valid Usename</h4></body></html>");
		}
		
	}

}
