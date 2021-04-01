<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
							<button type="button"
								class="btn-md mb-3  btn-primary btn btn-info text-white"
								id="result" onclick="approveDeny()">Confirm</button>
						</div>

						<div id="result2">Result</div>


						  <script>
						function approveDeny(){
							document.getElementById("result2").innerHTML = "";
							var ele = document.getElementsByClassName("AD");
								
								for(i = 0; i < ele.length; i++){
									
									if(ele[i].type="radio") {
										
										if(ele[i].checked)
												document.getElementById("result2").innerHTML += ele[i].name + "Value: " + ele[i].value + "<br>";
												
											}
												
											
												
											
											}
										}
									
								
								
							
							
							
						}	
						
							<%
							//ManagerDAO DeniedDAO = new ManagerDAOImpl();
							//List<Reimbursements> dList = managerDAO2.getALLReimbursements();
							//Reimbursements dObj = dList.get(0);
							//int dId = dObj.getReimbursementId();
							//DeniedDAO.updateReimbursementInfo(dId, "Denied");
							%>
							
						}
						</script> 
</body>
</html>