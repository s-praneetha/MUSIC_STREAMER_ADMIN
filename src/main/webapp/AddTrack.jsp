<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Track</title>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">
<link href= "https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css"></script>  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 70%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit],input[type=reset] {
  background: linear-gradient(to right, #fc4a1a, #ee0979);
  color: white;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  margin-top:40px;
  margin-left: 160px;
}

input[type=submit]:hover {
  background-color: black;
}

.container {
  margin-right: auto;
  margin-left: auto;
  width: 40%;
  height: 500px;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;

}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 70%;
    margin-top: 0;
  }
}
body {
  font-family: Arial, Helvetica, sans-serif;
  margin : 0;
}

.navbar {
  overflow: hidden;
  background-color: #333;
  height: 60px;
}

.navbar a {
  float: left;
  font-size: 20px;
  color: white;
  text-align: center;
  padding: 20px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 20px;  
  border: none;
  outline: none;
  color: white;
  padding: 20px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: grey;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}


</style>  
</head>
<body>
<div class="navbar">
  <a href="HomePage.jsp">Home</a>
  <a href="news.jsp">News</a>
  <div class="dropdown">
    <button class="dropbtn">Add Data 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="UploadAlbumController">Add Album</a>
    <a href="AddAlbumTypeController?action=ADD">Add Album Type</a>
    <a href="UploadPerformerController?action=ADD">Add Performer</a>
    <a href="UploadTrackController">Add Track</a>
    </div>
  </div> 
   <div class="dropdown">
    <button class="dropbtn">Reports
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="AlbumViewerController?action=DISPLAY">Album Reports</a>
    <a href="AddAlbumTypeController?action=VIEW">Album Type Reports</a>
    <a href="UploadPerformerController?action=VIEW">Performer Reports</a>
    <a href="TrackViewerController?action=DISPLAY">Track Reports</a>
    </div>
  </div> 
</div>

<center><h2>ADD TRACKS</h2></center>
<div class="container">
<br>
  <form name="form" action="./UploadTrackController?action=save" method="POST" enctype="multipart/form-data">
    <div class="row">
      <div class="col-25">
		 <label for="track_performer">Select Performer</label>
      </div>
      <div class="col-75">
        <select name="track_performer" class="chosen" required>
        <option value="" disabled selected>Select Performer</option>
        <c:forEach items="${list}" var="category">
        	
            <option value="${category.performer_id}">${category.performer_name}</option>
        </c:forEach>
    </select>
      </div>
    </div>
  <div class="row">
      <div class="col-25">
        <label for="track_album">Select Album</label>
      </div>
      <div class="col-75">
        <select name="track_album" class="chosen" required>
        <option value="" disabled selected>Select Album</option>
        <c:forEach items="${ablist}" var="album">
        	
            <option value="${album.album_id}">${album.album_name}</option>
        </c:forEach>
    </select>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="track_no">Track No</label>
      </div>
      <div class="col-75">
        <input type="text" id="trno" name="track_no" placeholder="Enter Track No" required>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Track Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="trname" name="track_name" placeholder="Track Name.." required>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Track Duration</label>
      </div>
      <div class="col-75">
        <input type="text" id="trduration" name="track_duration" placeholder="Track Duration" required>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="trackfile">Mp3 Upload</label>
      </div>
      <div class="col-75" style="margin-top:15px;">
        <input type="file" id="trduration" name="track_filen" placeholder="Track File" required>
      </div>
    </div>
     <div class="row">
      <div class="col-25">
        <label for="desc">Description</label>
      </div>
      <div class="col-75">
        <input type="text" id="trduration" name="track_description" placeholder="Track Description" required>
      </div>
    </div> 
    <div class="row">
    	<div class="col-25">
      <input type="submit" value="upload">
      
      </div>
      <div class="col-25">   
      <input type="reset" value="Cancel">
      </div>
    </div>
     
  
</form>
 </div>

<p><%=(request.getAttribute("message") == null) ? ""
         : request.getAttribute("message")%></p>
</body>
<script type="text/javascript" >
$(".chosen").chosen();



</script>
<%
	String email = (String) session.getAttribute("email");
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("Admin Edited Track", "Admin", email)) {
		System.out.println("Edit Track event inserted");
	}
%>
</html>