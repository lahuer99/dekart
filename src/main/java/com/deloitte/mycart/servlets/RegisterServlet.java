package com.deloitte.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.deloitte.mycart.entities.User;
import com.deloitte.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
/* @WebServlet(name="RegisterServlet", urlPatterns = {"/RegisterServlet"}) */
/* do this else if web.xml */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");

			if (userName.isEmpty()) {
				out.println("User name is blank");
				return;
			}

			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");

			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction txn = hibernateSession.beginTransaction();

			int userId = (int) hibernateSession.save(user);
			txn.commit();
			hibernateSession.close();

			/* out.println("userId is " + userId); */

			
			 HttpSession httpSession=request.getSession(); 
				/* setAttribute(key, value) */
			 httpSession.setAttribute("message", "Reg success"+userId);
			 response.sendRedirect("register.jsp");
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
