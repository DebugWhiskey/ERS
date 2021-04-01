<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jameson.dao.EmployeeDAOImpl"%>
<%@page import="com.jameson.dao.EmployeeDAO"%>
<%@page import="com.jameson.dao.ManagerDAOImpl"%>
<%@page import="com.jameson.dao.ManagerDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.jameson.model.Employee"%>
<%@page import="com.jameson.model.Reimbursements"%>
<%@page import="com.jameson.util.FilterUtil"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.82.0">
<title>Employee Home Page</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/dashboard/">



<!-- Bootstrap core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>

<body>

	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3"> <%
 String sessEmail = (String) session.getAttribute("seshEmail");
 out.print(sessEmail);
 %>
		</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search"> -->
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap">
				<!-- SIGN OUT FUNCTION--> 
				 <a class="nav-link" id="so" href="logout.jsp"
				>Sign out</a> <script>
				</script>
			</li>
		</ul>
	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="employee.jsp"> <span
								data-feather="home"></span> Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#1"
							onclick="myReimburse()"> <span data-feather="file"></span>
								Reimbursements
						</a></li>
						<script>
							function myReimburse() {
								document.getElementById("Reimburse").className = "table-responsive";
								document.getElementById("ReimburseTableAll").className = "table-responsive";
								document.getElementById("MainPage").className = "visually-hidden";
								document.getElementById("Profile").className = "table-responsive, visually-hidden";
								document.getElementById("SubmitRequest").className = "table-responsive, visually-hidden";
								document.getElementById("ProfileButton").className = "visually-hidden";
								document.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";

							}
						</script>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="submitRequest()"><span data-feather="file"></span> Submit Request
						</a></li>
						<script>
							function submitRequest(){
								document.getElementById("Reimburse").className = "table-responsive, visually-hidden";
								document.getElementById("MainPage").className = "visually-hidden";
								document.getElementById("Profile").className = "table-responsive, visually-hidden";
								document.getElementById("SubmitRequest").className = "table-responsive"
								document.getElementById("ProfileButton").className = "visually-hidden";
							}						</script>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="myProfile()"> <span data-feather="users"></span>
								Profile
						</a></li>
						<script>
							function myProfile(){
								document.getElementById("Reimburse").className = "table-responsive, visually-hidden";
								document.getElementById("MainPage").className = "visually-hidden";
								document.getElementById("Profile").className = "table-responsive";
								document.getElementById("SubmitRequest").className = "table-responsive, visually-hidden"
								document.getElementById("ProfileButton").className = "";
							}						</script>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Employee Dashboard</h1>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2"></div>

					</div>
				</div>
				<div class=" " id="MainPage">
					<h1>MAIN PAGE</h1>
					
				</div>
				
				<!-- SUBMISSION FORM -->
				<div class="visually-hidden" id="SubmitRequest">
					 <h2>Reimbursement Submission Form</h2>
    <form>
        <label for="reason">Reason:</label><br>
        <input type="text" id="reason" name="reason" class="form-control" required autofocus><br>
        <label for="amount">Amount:</label><br>
        <input type="number" id="amount" name="amount" class="form-control" required autofocus min="0.00" step=".01" value="0"><br>
        <div class="mt-3 mb-3 ">
				<!--<button class="btn-lg mb-3  btn-primary btn btn-info .gap-*">Sign In</button>-->
				<input type="submit"
					class="btn-lg mb-3  btn-primary btn btn-info .gap-* text-white"
					value="Submit" onclick="reimbursementRequest()">
					
					<script>
					function reimbursementRequest(){
						<% 
						String reason = request.getParameter("reason");
						String amount = request.getParameter("amount");
						
						
						EmployeeDAO submitDAO = new EmployeeDAOImpl();
						submitDAO.submitReimbursmentRequest(sessEmail, reason, amount);
						%>
						
					}
					</script>
			</div>
    </form>
				</div>
				
				
				<!--  PROFILE TABLE -->
				<div class="table-responsive, visually-hidden" id="Profile">
					<h2>Profile
					<%%></h2>
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>Employee Email</th>
								<th>Password</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Type</th>
							</tr>
						</thead>
						<tbody>

							<%
							EmployeeDAO profileDAO = new EmployeeDAOImpl();
							Employee profile = profileDAO.getEmployeeByEmail(sessEmail);
							
							
								out.print("<tr>");
								out.print("<td>" + profile.getEmail() + "</td>");
								out.print("<td>" + profile.getEmployeePassword() + "</td>");
								out.print("<td>" + profile.getFirstName() + "</td>");
								out.print("<td>" + profile.getLastName() + "</td>");
								out.print("<td>" + profile.getType() + "</td>");
								out.print("</tr>");
							
							%>



						</tbody>
					</table>
				</div>
				<div class="visually-hidden" id="ProfileButton">
				<input type="button" class="btn-lg mb-3  btn-primary btn btn-info .gap-* text-white" value="Update Profile" onclick="updateProfileReveal()">
				<script>
				function updateProfileReveal(){
					document.getElementById("ProfileUpdate").className = " ";
				}
				</script>
				<div class="visually-hidden" id="ProfileUpdate">
				 <form>
        <label for="reason">New Password:</label><br>
        <input type="text" id="nuPass" name="nuPass" class="form-control" required autofocus><br>
        <label for="amount">First Name:</label><br>
        <input type="text" id="fName" name="fName" class="form-control" required autofocus ><br>
        <label for="amount">Last Name:</label><br>
        <input type="text" id="lName" name="lName" class="form-control" required autofocus ><br>
        
        <div class="mt-3 mb-3 ">
				<!--<button class="btn-lg mb-3  btn-primary btn btn-info .gap-*">Sign In</button>-->
				<input type="submit"
					class="btn-lg mb-3  btn-primary btn btn-info .gap-* text-white"
					value="Submit" onclick="profileUpdate()">
					
					<script>
					function profileUpdate(){
						<% 
						
						String nuPass = request.getParameter("nuPass");
						String nuFirstName = request.getParameter("fName");
						String nuLastName = request.getParameter("lName");
						
						
						EmployeeDAO upProfileDAO = new EmployeeDAOImpl();
						upProfileDAO.updateEmployeeInfo(sessEmail, nuFirstName, nuLastName, nuPass);
						%>
						
					}
					</script>
			</div>
    </form>
				</div>
				</div>

				<div class="table-responsive, visually-hidden"
					id="Reimburse">
					<h2>Reimbursments</h2>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary" onclick="pending()">Pending</button>
							<script>
							function pending() {
								document.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTablePending").className = "table-responsive";
								document.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";
							}
						</script>
							<button type="button" class="btn btn-sm btn-outline-secondary" onclick="approved()">Approved</button>
							<script>
							function approved() {
								document.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableApproved").className = "table-responsive";
								document.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";
								
							}
						</script>
							<button type="button" class="btn btn-sm btn-outline-secondary" onclick="denied()">Denied</button>
							<script>
							function denied() {
								document.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableDenied").className = "table-responsive";
							}
						</script>
						</div>
					</div>
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>Reason</th>
								<th>Amount</th>
								<th>Date Submitted</th>
								<th>Status</th>

							</tr>
						</thead>
						<tbody class="" id="ReimburseTableAll">

							<%
							ManagerDAO employeeDAO = new ManagerDAOImpl();
							List<Reimbursements> reimbursements = employeeDAO.getReimbursementsByEmail(sessEmail);
							//System.out.println(reimbursements);

							for (Reimbursements reimburse : reimbursements) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("</tr>");
							}
							%>
							</tbody>



						<tbody class="visually-hidden"  id="ReimburseTablePending">

							<%
							ManagerDAO pendingDAO = new ManagerDAOImpl();
							List<Reimbursements> p = pendingDAO.getReimbursementsByEmailAndStatus(sessEmail, "Pending");
							//System.out.println(reimbursements);

							for (Reimbursements reimburse : p) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("</tr>");
							}
							%>



						</tbody>
						<tbody class="visually-hidden"  id="ReimburseTableApproved">

							<%
							ManagerDAO approvedDAO = new ManagerDAOImpl();
							List<Reimbursements> a = approvedDAO.getReimbursementsByEmailAndStatus(sessEmail, "Approved");
							//System.out.println(reimbursements);
							
							for (Reimbursements reimburse : a) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("</tr>");
							}
							%>



						</tbody>
						<tbody class="visually-hidden"  id="ReimburseTableDenied">

							<%
							ManagerDAO deniedDAO = new ManagerDAOImpl();
							List<Reimbursements> d = deniedDAO.getReimbursementsByEmailAndStatus(sessEmail, "Denied");
							//System.out.println(reimbursements);
							
							for (Reimbursements reimburse : d) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("</tr>");
							}
							%>
							
							
							
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>


	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script src="dashboard.js"></script>
</body>

</html>