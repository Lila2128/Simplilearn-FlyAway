package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LoginDAO;
import DbConnect.DbUtil;
import pojo.Login;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		response.setContentType("text/html");
		String user=request.getParameter("username");
		String password=request.getParameter("password");
		PrintWriter pw= response.getWriter();
		Login l= new Login();
		l.setUsername(user);
		l.setPassword(password);
		
		Connection con;
		try {
			con = DbUtil.getConn();
			PreparedStatement ps=con.prepareStatement("select * from userdetails ud where ud.username='"+user+"' and ud.password='"+password+"' ");
			ResultSet rs= ps.executeQuery();
			if(!rs.isBeforeFirst()){
				request.getRequestDispatcher("admin.jsp").include(request, response);
				pw.println("<html><body><h5> Invalid Username or Password.<br> Please try again</h5></body></html>");
				
			}else if(rs.next()) {
				request.setAttribute(user, request.getParameter("username"));
				request.getRequestDispatcher("homePage.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
