<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jameson.dao.ManagerDAOImpl"%>
<%@page import="com.jameson.dao.ManagerDAO"%>
<%@page import="com.jameson.dao.EmployeeDAOImpl"%>
<%@page import="com.jameson.dao.EmployeeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Integer"%>
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
<title>Manager Home Page</title>

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
				<!-- SIGN OUT FUNCTION--> <a class="nav-link" id="so"
				href="logout.jsp">Sign out</a> <script>
					
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
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#" onclick="myHome()"> <span data-feather="home"></span>
								Home
						</a></li>
						<script>
							function myHome() {
								document.getElementById("Reimburse").className = "table-responsive, visually-hidden";
								document.getElementById("EmployeeTable").className = "table-responsive, visually-hidden";
								document.getElementById("MainPage").className = " ";
								document.getElementById("Profile").className = "table-responsive, visually-hidden";

							}
						</script>

						<li class="nav-item"><a class="nav-link" href="#"
							onclick="myReimburse()"> <span data-feather="file"></span>
								Reimbursements
						</a></li>
						<script>
							function myReimburse() {
								document.getElementById("Reimburse").className = "table-responsive";
								document.getElementById("ReimburseTableAll").className = "table-responsive";
								document.getElementById("EmployeeTable").className = "table-responsive, visually-hidden";
								document.getElementById("MainPage").className = "visually-hidden";
								document.getElementById("Profile").className = "table-responsive, visually-hidden";
								document
										.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
								document
										.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
								document.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";
								document.getElementById("ByEmailTable").className = "table-responsive, visually-hidden";

							}
						</script>
						<li class="nav-item"><a class="nav-link" href="#"
							onclick="myEmployees()"> <span data-feather="users"></span>
								Employees
						</a></li>
						<script>
							function myEmployees() {
								document.getElementById("EmployeeTable").className = "table-responsive";
								document.getElementById("Reimburse").className = "table-responsive, visually-hidden";
								document.getElementById("MainPage").className = "visually-hidden";
								document.getElementById("Profile").className = "table-responsive, visually-hidden";
							}
						</script>


						<li class="nav-item"><a class="nav-link" href="#"
							onclick="myProfile()"> <span data-feather="users"></span>
								Profile
						</a></li>
						<script>
							function myProfile() {
								document.getElementById("EmployeeTable").className = "table-responsive, visually-hidden";
								document.getElementById("Reimburse").className = "table-responsive, visually-hidden";
								document.getElementById("MainPage").className = "visually-hidden";
								document.getElementById("Profile").className = "table-responsive";
							}
						</script>

					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">Manager's Dashboard</h1>
					<div class="btn-toolbar mb-2 mb-md-0"></div>
				</div>
				<div class=" " id="MainPage">
					<h1>MAIN PAGE</h1>
				</div>



				<div class="table-responsive, visually-hidden" id="Profile">
					<h2>Profile</h2>
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
							//out.print(employees.toString());

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

				<div class="table-responsive, visually-hidden" id="EmployeeTable">
					<h2>Employees</h2>
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>Employee Email</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Type</th>
							</tr>
						</thead>
						<tbody>

							<%
							ManagerDAO managerDAO = new ManagerDAOImpl();
							List<Employee> employees = managerDAO.getALLEmployees();
							//out.print(employees.toString());
							for (Employee employee : employees) {
								out.print("<tr>");
								out.print("<td>" + employee.getEmail() + "</td>");
								out.print("<td>" + employee.getFirstName() + "</td>");
								out.print("<td>" + employee.getLastName() + "</td>");
								out.print("<td>" + employee.getType() + "</td>");
								out.print("</tr>");
							}
							%>



						</tbody>
					</table>
				</div>

				<div class="table-responsive, visually-hidden" id="Reimburse">
					<h2>Reimbursments</h2>
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-group me-2">
							<button type="button" class="btn btn-sm btn-outline-secondary"
								onclick="pending()">Pending</button>
							<script>
								function pending() {
									document
											.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTablePending").className = "table-responsive";
									document
											.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";
									document.getElementById("ByEmailTable").className = "table-responsive, visually-hidden";
								}
							</script>
							<button type="button" class="btn btn-sm btn-outline-secondary"
								onclick="approved()">Approved</button>
							<script>
								function approved() {
									document
											.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTableApproved").className = "table-responsive";
									document
											.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";
									document.getElementById("ByEmailTable").className = "table-responsive, visually-hidden";

								}
							</script>
							<button type="button" class="btn btn-sm btn-outline-secondary"
								onclick="denied()">Denied</button>
							<script>
								function denied() {
									document
											.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTableDenied").className = "table-responsive";
									document.getElementById("ByEmailTable").className = "table-responsive, visually-hidden";
								}
							</script>


							<input type="email" id="sByEmail" name="sByEmail"
								class="form-control" placeholder="Search by Email" required
								autofocus> <input type="submit"
								class="form-control btn-sm mb-3  btn-primary btn btn-info text-white"
								value="Submit" onclick="sByEmail(), myFunc()">
							<script>
								function sByEmail() {
									document
											.getElementById("ReimburseTableAll").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTablePending").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTableApproved").className = "table-responsive, visually-hidden";
									document
											.getElementById("ReimburseTableDenied").className = "table-responsive, visually-hidden";
									document.getElementById("ByEmailTable").className = "table-responsive";

								}
							</script>





							<%
							//ManagerDAO DeniedDAO = new ManagerDAOImpl();
							//List<Reimbursements> dList = managerDAO2.getALLReimbursements();
							//Reimbursements dObj = dList.get(0);
							//int dId = dObj.getReimbursementId();
							//DeniedDAO.updateReimbursementInfo(dId, "Denied");
							%>




						</div>
					</div>

					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th>#</th>
								<th>Employee Email</th>
								<th>Reason</th>
								<th>Amount</th>
								<th>Date Submitted</th>
								<th>Status</th>
								<th></th>

							</tr>
						</thead>

						<tbody class="" id="ReimburseTableAll">

							<%
							ManagerDAO managerDAO2 = new ManagerDAOImpl();
							List<Reimbursements> reimbursements = managerDAO2.getALLReimbursements();
							//System.out.println(reimbursements);

							for (Reimbursements reimburse : reimbursements) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getEmployeeEmail() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");

								out.print("<td>");
								if (reimburse.getStatus().equals("Pending")) {
									out.print(
									"<button type='button' class='btn-sm  btn-primary btn btn-info text-white' onclick='approve()'>Approve</button>");

								} else {
									out.print(" ");
								}
								out.print("</td>");

								out.print("</tr>");
							}
							%>


						</tbody>

						<tbody class="visually-hidden" id="ReimburseTablePending">

							<%
							ManagerDAO pendingDAO = new ManagerDAOImpl();
							List<Reimbursements> p = pendingDAO.getReimbursementsByStatus("Pending");
							//System.out.println(reimbursements);

							out.print("<form class='row g-3'>");
							for (Reimbursements reimburse : p) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getEmployeeEmail() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("<td>");

								if (reimburse.getStatus().equals("Pending")) {
									out.print("<input type='radio' name='" + reimburse.getReimbursementId() + "' value='Approved'>");

									out.print("<label for='radioApprove'>Approve</label>");
									out.print("<input type='radio' name='" + reimburse.getReimbursementId() + "' value='Denied'>");
									out.print("<label for='radioDeny'>Deny</label>");
								} else {
									out.print(" ");
								}
								out.print("</td>");
								out.print("</tr>");
							}

							out.print("</form>");
							%>



						</tbody>
						<tbody class="visually-hidden" id="ReimburseTableApproved">

							<%
							ManagerDAO approvedDAO = new ManagerDAOImpl();
							List<Reimbursements> a = approvedDAO.getReimbursementsByStatus("Approved");
							//System.out.println(reimbursements);

							for (Reimbursements reimburse : a) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getEmployeeEmail() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("</tr>");
							}
							%>



						</tbody>
						<tbody class="visually-hidden" id="ReimburseTableDenied">

							<%
							ManagerDAO deniedDAO = new ManagerDAOImpl();
							List<Reimbursements> d = deniedDAO.getReimbursementsByStatus("Denied");
							//System.out.println(reimbursements);

							for (Reimbursements reimburse : d) {
								out.print("<tr>");
								out.print("<td>" + reimburse.getReimbursementId() + "</td>");
								out.print("<td>" + reimburse.getEmployeeEmail() + "</td>");
								out.print("<td>" + reimburse.getReason() + "</td>");
								out.print("<td>$" + reimburse.getAmount() + "</td>");
								out.print("<td>" + reimburse.getSubmitDate() + "</td>");
								out.print("<td>" + reimburse.getStatus() + "</td>");
								out.print("</tr>");
							}
							%>



						</tbody>



						<%
						out.print("<tbody class='' id='ByEmailTable'>");

						ManagerDAO mDAO = new ManagerDAOImpl();
						String byEmail = request.getParameter("sByEmail");
						List<Reimbursements> emailReim = mDAO.getReimbursementsByEmail(byEmail);

						for (Reimbursements reimburse : emailReim) {
							out.print("<tr>");
							out.print("<td>" + reimburse.getReimbursementId() + "</td>");
							out.print("<td>" + reimburse.getEmployeeEmail() + "</td>");
							out.print("<td>" + reimburse.getReason() + "</td>");
							out.print("<td>$" + reimburse.getAmount() + "</td>");
							out.print("<td>" + reimburse.getSubmitDate() + "</td>");
							out.print("<td>" + reimburse.getStatus() + "</td>");

							out.print("<td>");
							if (reimburse.getStatus().equals("Pending")) {
								out.print("<input type='radio' name='" + reimburse.getReimbursementId() + "' value='Approved'>");

								out.print("<label for='radioApprove'>Approve</label>");
								out.print("<input type='radio' name='" + reimburse.getReimbursementId() + "' value='Denied'>");
								out.print("<label for='radioDeny'>Deny</label>");
							} else {
								out.print(" ");
							}
							out.print("</td>");

							out.print("</tr>");
						}

						out.print("</tbody>");
						%>

					</table>

					<form name="vinform">

						<label for="id">Id #:</label><br> <input type="number"
							name="id" class="form-control" required autofocus min="0.00"
							step=".01" value="0"><br>
						<div data-toggle="buttons">
							<div class="btn-group">
								<label class="btn btn-primary"> <input type="radio"
									name="reimtype" id="type" value="Approved" required>Approve
								</label> <label class="btn btn-primary"> <input type="radio"
									name="reimtype" id="type" value="Denied" required>Deny
								</label>
							</div>
						</div>
						<div class="mt-3 mb-3 ">
							<!--<button class="btn-lg mb-3  btn-primary btn btn-info .gap-*">Sign In</button>-->
							<input type="submit"
								class="btn-lg mb-3  btn-primary btn btn-info .gap-* text-white"
								value="Submit" onclick="approve()">

							<script>
								var request;
								function approve() {
									
									var rId = document.vinform.id.value;
									var ele = document
											.getElementsByName('reimtype');
									var rStatus;

									for (i = 0; i < ele.length; i++) {
										if (ele[i].checked)
											rStatus = ele[i].value;
									}

									var url = "update.jsp?id=" + rId
											+ "&status=" + rStatus;

									if (window.XMLHttpRequest) {
										request = new XMLHttpRequest();

									} else if (window.ActiveXObject) {
										request = new ActiveXObject(
												"Microsoft.XMLHTTP");

									}

									try {
										request.onreadystatechange = getInfo;
										request.open("GET", url, true);
										request.send();
									} catch (e) {
										alert("Unable to connect to server");
									}
									function approve() {

									}
								}

								function getInfo() {
									if (request.readyState == 4) {
										var val = request.responseText;

									}
								}
							</script>
						</div>
					</form>
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