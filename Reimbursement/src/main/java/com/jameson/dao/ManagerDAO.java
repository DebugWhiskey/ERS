package com.jameson.dao;

import java.sql.SQLException;
import java.util.List;

import com.jameson.exceptions.UserNotFoundException;
import com.jameson.model.Employee;
import com.jameson.model.Reimbursements;

public interface ManagerDAO {

	// View all employees
	public List<Employee> getALLEmployees() throws SQLException;
	
	//Update pending Reimbursements
	public int updateReimbursementInfo(int id, String status)throws UserNotFoundException;
	
	//View All Pending requests (see employee dao)
	public List<Reimbursements> getReimbursementsByStatus(String status) throws UserNotFoundException;;
	
	//View All resolved requests (*^)
	
	
	//View reimbursement requests of a specific employee
	public List<Reimbursements> getReimbursementsByEmail(String email) throws UserNotFoundException;
	
	public List<Reimbursements> getALLReimbursements() throws UserNotFoundException;
	
	public List<Reimbursements> getReimbursementsByEmailAndStatus(String email, String status) throws UserNotFoundException; 
	
}
