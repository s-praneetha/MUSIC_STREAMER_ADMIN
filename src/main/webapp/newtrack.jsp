<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Track</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
</head>
<body>


<div class="container">
  <form action="${pageContext.request.contextPath}/UploadTrackController?action=update" method="POST" >
    
    <input type="hidden" value="${editTrack.track_id}" name="id" />
    <label for="fname">Track Name</label>
    <input type="text"  name="trackname" value="${editTrack.track_name}" placeholder="Track name..">
    
    <label for="fname">Track Album Name</label>
    <input type="text"  name="trackalb" value="${editTrack.track_album}" placeholder="Track Album name..">

    <label for="lname">Track Performer Name</label>
    <input type="text"  name="trackperf" value="${editTrack.track_performer}"  placeholder="Track Performer">
    
    <label for="lname">Track Number</label>
    <input type="text"  name="trackno" value="${editTrack.track_no}" placeholder="Track Number">
   
	<label for="lname">Track Duration</label>
    <input type="text" id="lname" name="trackduration"  value="${editTrack.track_duration}" placeholder="Track Duration">
    
	<label for="fname">Track Description</label>
    <input type="text" id="fname" name="trackdesc" value="${editTrack.track_description}" placeholder="Track Description">

    <input type="submit" value="Submit">
  </form>
</div>
<%
	String email = (String) session.getAttribute("email");
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("Admin Add Track", "Admin", email)) {
		System.out.println("Add Track event inserted");
	}
%>
</body>
</html>
