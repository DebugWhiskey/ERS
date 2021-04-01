package com.jameson.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

import com.jameson.exceptions.UserNotFoundException;
import com.jameson.model.Employee;
import com.jameson.util.ConnectionUtil;

public class EmployeeDAOImpl implements EmployeeDAO {

	private static Logger log = Logger.getLogger(EmployeeDAOImpl.class);



	@Override
	public Employee getEmployeeByEmailAndPassword(String emailIn, String passwordIn)
			throws UserNotFoundException {

		Employee id = null;

		try (Connection con = ConnectionUtil.getConnection()) {
			// Prepared Statment
			String sql = "SELECT * FROM ers.employees WHERE email  = ? AND pass = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, emailIn);
			pstmt.setString(2, passwordIn);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String email = rs.getString("email");
				String employeePassword = rs.getString("pass");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String type = rs.getString("employee_type");

				id = new Employee(email, employeePassword, firstName, lastName, type);

			} else {
				throw new UserNotFoundException("Invalid Login.");
			}
		} catch (SQLException e) {
			System.out.println("An error occured with JDBC: " + e.getMessage());
			log.info("Failed to find the id and password combination of: " + emailIn + passwordIn);

		}

			

		return id;

	}



	
	@Override
	public int submitReimbursmentRequest(String email, String reason, String amount) throws UserNotFoundException {
		int updateCount = 0;
		long millis = System.currentTimeMillis();
		java.sql.Date currentDate = new java.sql.Date(millis);

		try (Connection con = ConnectionUtil.getConnection()) {
			String sql = "INSERT INTO ers.reimbursements  (employee_email, reason, amount, submit_date, status) VALUES (?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			

			pstmt.setString(1, email);
			pstmt.setString(2, reason);
			pstmt.setString(3, amount);
			pstmt.setDate(4, currentDate);
			pstmt.setString(5, "Pending");
			
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ submitReimbursmentRequest(). E message: "
					+ e.getMessage());
		}

		return updateCount;
	}


// CANNOT change emails as they are connected to their reimbursments
	@Override
	public int updateEmployeeInfo(String email, String nuFirstName, String nuLastName, String nuPass)
			throws UserNotFoundException {
		int updateCount = 0;

		try (Connection con = ConnectionUtil.getConnection()) {
			String sql = "UPDATE ers.employees SET pass =?, first_name =?, last_name =? WHERE email = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, nuPass);
			pstmt.setString(2, nuFirstName);
			pstmt.setString(3, nuLastName);
			pstmt.setString(4, email);
			
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ updateEmployeeInfo(). E message: "
					+ e.getMessage());
		}

		return updateCount;
	}




	@Override
	public Employee getEmployeeByEmail(String emailIn) throws UserNotFoundException {
		Employee id = null;

		try (Connection con = ConnectionUtil.getConnection()) {
			// Prepared Statment
			String sql = "SELECT * FROM ers.employees WHERE email  = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, emailIn);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String email = rs.getString("email");
				String employeePassword = rs.getString("pass");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String type = rs.getString("employee_type");

				id = new Employee(email, employeePassword, firstName, lastName, type);

			} else {
				throw new UserNotFoundException("Not Found.");
			}
		} catch (SQLException e) {
			System.out.println("An error occured with JDBC: " + e.getMessage());
			log.info("Failed to find the email: " + emailIn);

		}

			

		return id;
	}


}