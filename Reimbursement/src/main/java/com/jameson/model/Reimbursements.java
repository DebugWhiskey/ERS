package com.jameson.model;

public class Reimbursements {
	
	int reimbursementId;
	String employeeEmail;
	String reason;
	double amount;
	String submitDate;
	String status;
	
	
	
	
	@Override
	public String toString() {
		return "Reimbursements [reimbursementId=" + reimbursementId + ", employeeEmail=" + employeeEmail + ", reason="
				+ reason + ", amount=" + amount + ", submitDate=" + submitDate + ", status=" + status + "]";
	}


	public Reimbursements() {
		super();
	}


	public Reimbursements(int reimbursementId, String employeeEmail, String reason, double amount, String submitDate,
			String status) {
		super();
		this.reimbursementId = reimbursementId;
		this.employeeEmail = employeeEmail;
		this.reason = reason;
		this.amount = amount;
		this.submitDate = submitDate;
		this.status = status;
	}


	public int getReimbursementId() {
		return reimbursementId;
	}


	public void setReimbursementId(int reimbursementId) {
		this.reimbursementId = reimbursementId;
	}


	public String getEmployeeEmail() {
		return employeeEmail;
	}


	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}


	public String getReason() {
		return reason;
	}


	public void setReason(String reason) {
		this.reason = reason;
	}


	public double getAmount() {
		return amount;
	}


	public void setAmount(double amount) {
		this.amount = amount;
	}


	public String getSubmitDate() {
		return submitDate;
	}


	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(amount);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((employeeEmail == null) ? 0 : employeeEmail.hashCode());
		result = prime * result + ((reason == null) ? 0 : reason.hashCode());
		result = prime * result + reimbursementId;
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((submitDate == null) ? 0 : submitDate.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Reimbursements other = (Reimbursements) obj;
		if (Double.doubleToLongBits(amount) != Double.doubleToLongBits(other.amount))
			return false;
		if (employeeEmail == null) {
			if (other.employeeEmail != null)
				return false;
		} else if (!employeeEmail.equals(other.employeeEmail))
			return false;
		if (reason == null) {
			if (other.reason != null)
				return false;
		} else if (!reason.equals(other.reason))
			return false;
		if (reimbursementId != other.reimbursementId)
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (submitDate == null) {
			if (other.submitDate != null)
				return false;
		} else if (!submitDate.equals(other.submitDate))
			return false;
		return true;
	}
	
	

}
