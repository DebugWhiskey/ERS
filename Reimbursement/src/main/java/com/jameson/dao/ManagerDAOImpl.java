package com.jameson.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.jameson.exceptions.UserNotFoundException;
import com.jameson.model.Employee;
import com.jameson.model.Reimbursements;
import com.jameson.util.ConnectionUtil;

public class ManagerDAOImpl implements ManagerDAO {

	private static Logger log = Logger.getLogger(EmployeeDAOImpl.class);

	@Override
	public List<Employee> getALLEmployees() throws SQLException {

		List<Employee> employees = new ArrayList<>();
		// try-with-resources
		try (Connection con = ConnectionUtil.getConnection()) {
			// get connection

			// obtain a statement object
			Statement stmt = con.createStatement();

			// execute query
			String sql = "SELECT * FROM ers.employees";
			ResultSet rs = stmt.executeQuery(sql);

			// process the results
			while (rs.next()) {

				String email = rs.getString("email");
				String employeePassword = rs.getString("pass");
				String firstName = rs.getString("first_name");
				String lastName = rs.getString("last_name");
				String type = rs.getString("employee_type");

				Employee employee = new Employee(email, employeePassword, firstName, lastName, type);
				employees.add(employee);

			}
//			for (Employee str : employees) {
//				System.out.println(str);
//			}
		} catch (SQLException e) {
			System.out.println("An error occured with JDBC: " + e.getMessage());

		}

		return employees;

	}

	@Override
	public int updateReimbursementInfo(int id, String status) throws UserNotFoundException {
		int updateCount = 0;

		try (Connection con = ConnectionUtil.getConnection()) {
			String sql = "UPDATE ers.reimbursements SET status =? WHERE reimbursement_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			

			pstmt.setString(1, status);
			pstmt.setInt(2, id);
			updateCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ updateReimbursementInfo(). E message: "
					+ e.getMessage());
		}

		return updateCount;

	}

	@Override
	public List<Reimbursements> getReimbursementsByStatus(String status) throws UserNotFoundException {
		List<Reimbursements> reimbursements = new ArrayList<>();

		try (Connection con = ConnectionUtil.getConnection()) {

			// Prepared Statment
			String sql = "SELECT * FROM ers.reimbursements WHERE status = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, status);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int reimbursementId = rs.getInt("reimbursement_id");
				String employeeEmail = rs.getString("employee_email");
				String reason = rs.getString("reason");
				double amount = rs.getDouble("amount");
				String subDate = rs.getString("submit_date");
				String rStatus = rs.getString("status");

				Reimbursements account = new Reimbursements(reimbursementId, employeeEmail, reason, amount, subDate,
						rStatus);
				reimbursements.add(account);
			}

			for (Reimbursements str : reimbursements) {
				System.out.println(str);
			}
		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ getReimbursementsByStatus(). E message: "
					+ e.getMessage());
		}
		return reimbursements;
	}

	@Override
	public List<Reimbursements> getReimbursementsByEmail(String email) throws UserNotFoundException {
		List<Reimbursements> reimbursements = new ArrayList<>();

		try (Connection con = ConnectionUtil.getConnection()) {

			// Prepared Statment
			String sql = "SELECT * FROM ers.reimbursements WHERE employee_email = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int reimbursementId = rs.getInt("reimbursement_id");
				String employeeEmail = rs.getString("employee_email");
				String reason = rs.getString("reason");
				double amount = rs.getDouble("amount");
				String subDate = rs.getString("submit_date");
				String rStatus = rs.getString("status");

				Reimbursements account = new Reimbursements(reimbursementId, employeeEmail, reason, amount, subDate,
						rStatus);
				reimbursements.add(account);
			}

			for (Reimbursements str : reimbursements) {
				System.out.println(str);
			}
		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ getReimbursementsByEmail(). E message: "
					+ e.getMessage());
		}
		return reimbursements;
	}

	@Override
	public List<Reimbursements> getALLReimbursements() throws UserNotFoundException {
		List<Reimbursements> reimbursements = new ArrayList<>();

		try (Connection con = ConnectionUtil.getConnection()) {

			// Prepared Statment
			String sql = "SELECT * FROM ers.reimbursements";
			PreparedStatement pstmt = con.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int reimbursementId = rs.getInt("reimbursement_id");
				String employeeEmail = rs.getString("employee_email");
				String reason = rs.getString("reason");
				double amount = rs.getDouble("amount");
				String subDate = rs.getString("submit_date");
				String rStatus = rs.getString("status");

				Reimbursements account = new Reimbursements(reimbursementId, employeeEmail, reason, amount, subDate,
						rStatus);
				reimbursements.add(account);
			}

			for (Reimbursements str : reimbursements) {
				System.out.println(str);
			}
		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ getALLReimbursements(). E message: "
					+ e.getMessage());
		}
		return reimbursements;
	}

	@Override
	public List<Reimbursements> getReimbursementsByEmailAndStatus(String email, String status)
			throws UserNotFoundException {
		List<Reimbursements> reimbursements = new ArrayList<>();

		try (Connection con = ConnectionUtil.getConnection()) {

			// Prepared Statment
			String sql = "SELECT * FROM ers.reimbursements WHERE employee_email = ? AND status = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, status);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int reimbursementId = rs.getInt("reimbursement_id");
				String employeeEmail = rs.getString("employee_email");
				String reason = rs.getString("reason");
				double amount = rs.getDouble("amount");
				String subDate = rs.getString("submit_date");
				String rStatus = rs.getString("status");

				Reimbursements account = new Reimbursements(reimbursementId, employeeEmail, reason, amount, subDate,
						rStatus);
				reimbursements.add(account);
			}

			for (Reimbursements str : reimbursements) {
				System.out.println(str);
			}
		} catch (SQLException e) {
			log.error("The system failed to connect to the database @ getReimbursementsByEmailAndStatus(). E message: "
					+ e.getMessage());
		}
		return reimbursements;

	}
}
