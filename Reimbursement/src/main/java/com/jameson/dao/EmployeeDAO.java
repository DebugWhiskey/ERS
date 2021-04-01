package com.jameson.dao;

import com.jameson.exceptions.UserNotFoundException;
import com.jameson.model.Employee;

public interface EmployeeDAO {
	
	// login authentication
	public Employee getEmployeeByEmailAndPassword(String emailIn, String passwordIn) throws UserNotFoundException;
	
	public Employee getEmployeeByEmail(String emailIn) throws UserNotFoundException;
	
	// Submit reimbursment request
	public int submitReimbursmentRequest(String email, String reason, String amount)throws UserNotFoundException;
	
	// update their information
	public int updateEmployeeInfo(String email, String firstName, String lastName, String pass)throws UserNotFoundException;
	
	// View employee pending reimbursement requests*
	
	// View resolved reimbursement requests*
	
	//*see Manager DAO

}
