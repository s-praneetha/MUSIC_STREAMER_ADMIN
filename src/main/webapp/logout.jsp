<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %>

<%
    String email = (String) session.getAttribute("email");
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("Admin Logout", "Admin", email)) {
		System.out.println("Logout event inserted");
	}
	session.invalidate();
	response.sendRedirect("index.jsp");

%>