<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jameson.dao.ManagerDAOImpl"%>
<%@page import="com.jameson.dao.ManagerDAO"%>
<%@page import="com.jameson.exceptions.UserNotFoundException"%>
<%
ManagerDAO mDAO = new ManagerDAOImpl();

String s=request.getParameter("id");
String s1=request.getParameter("status");


if (s==null || s.trim().equals("")){
	out.print("Please input id");
}else{
	int id1=Integer.parseInt(s);
	out.print(id1);
	
	
	try {
		mDAO.updateReimbursementInfo(id1, s1);
	}catch (UserNotFoundException e){
		e.printStackTrace();
		}
}


%>
