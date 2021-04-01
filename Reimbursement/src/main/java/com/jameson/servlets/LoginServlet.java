package com.jameson.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jameson.dao.EmployeeDAO;
import com.jameson.dao.EmployeeDAOImpl;
import com.jameson.dao.ManagerDAO;
import com.jameson.dao.ManagerDAOImpl;
import com.jameson.exceptions.UserNotFoundException;
import com.jameson.model.Employee;
import com.jameson.services.LoginServices;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeDAO employeeDAO = new EmployeeDAOImpl();
	public ManagerDAO managerDAO = new ManagerDAOImpl();
	public LoginServices login = new LoginServices();
	private static Logger log = Logger.getLogger(LoginServices.class);

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		String email = request.getParameter("emailAddress");
		String pass = request.getParameter("password");
		
		String sessionEmail = request.getParameter("emailAddress");
		request.getSession().setAttribute("seshEmail",sessionEmail);
	
		
		try {
			Employee employee = employeeDAO.getEmployeeByEmailAndPassword(email, pass);
//			List<Employee> employees = managerDAO.getALLEmployees();
//			ObjectMapper mapper = new ObjectMapper();
//			
//			String firstName = employee.getFirstName();
//			String lastName = employee.getLastName();
			String type = employee.getType();
			
			
			
			if (type.equals("manager")) {
				
				
				//request.getSession().setAttribute("manager", employee);
				
				System.out.println("Successfully got to the manager's page");
				
				log.info(email + " successfully signed in.");
				response.sendRedirect("manager.jsp");
				
				
			} else {
				
				//request.getSession().setAttribute("employee", employee);
				
				System.out.println("Successfully got to the employee's's page");


//				try {
//					mapper.writeValue(new File("employee.json"), employee);
//					String jsonString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(employee);
//					out.print(jsonString);
//				}catch (Exception e) {
//					e.printStackTrace();
//				}
				log.info(email + " successfully signed in.");

				response.sendRedirect("employee.jsp");
				
				
			}
			
			
		} catch (UserNotFoundException e) {
			System.out.println(e.getMessage());
			log.info(email + " failed login.");
			out.print("<h2>Login Failed.</h2>");
			response.sendRedirect("failedLogin.jsp");
		} 
		

	}
}
