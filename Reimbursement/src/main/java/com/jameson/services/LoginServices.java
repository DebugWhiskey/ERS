package com.jameson.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jameson.dao.EmployeeDAO;
import com.jameson.dao.EmployeeDAOImpl;
import com.jameson.exceptions.UserNotFoundException;
import com.jameson.model.Employee;

public class LoginServices {
	
	private static Logger log = Logger.getLogger(LoginServices.class);
	
	public static EmployeeDAO employeeDAO = new EmployeeDAOImpl();

	
	public static void employeeLogin(String email, String pass,  HttpServletResponse response) throws SQLException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		try {
			Employee employee = employeeDAO.getEmployeeByEmailAndPassword(email, pass);
			String firstName = employee.getFirstName();
			String type = employee.getType();
			if (type == "manager") {
				// go to manager tools page
			} else {
				//go to employee tools page
			}
			log.info(email + " successfully signed in.");
			out.print("<h2>Welcome: "+ firstName +"</h2>");
		} catch (UserNotFoundException e) {
			System.out.println(e.getMessage());
			log.info(email + " failed login.");
			out.print("<h2>Login Failed.</h2>");
			response.sendRedirect("failedLogin.jsp");
		} 
	}
}
