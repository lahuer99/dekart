package com.deloitte.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.mycart.dao.UserDao;
import com.deloitte.mycart.entities.User;
import com.deloitte.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user=userDao.getUserByEmailAndPassword(userEmail, userPassword);
			System.out.println(user);
			
			HttpSession httpSession=request.getSession();
			
			if(user==null) {
				//out.println("Invalid details");
				httpSession.setAttribute("message", "Invalid credentials. Try again!");
				response.sendRedirect("login.jsp");
			}else {
				//out.println("Welcome "+user.getUserName());
				httpSession.setAttribute("currentUser", user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				else if(user.getUserType().equals("normal")) {
					response.sendRedirect("normal.jsp");
				}
				else {
					out.println("userType not def");
				}
				//httpSession.setAttribute("message", "Welcome "+user.getUserName());
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}
}
