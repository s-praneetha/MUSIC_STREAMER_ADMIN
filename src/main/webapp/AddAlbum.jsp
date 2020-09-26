<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
  box-sizing: border-box;
}

input[type=text] {
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
  margin-left: 170px;
}
.container {
  margin-right: auto;
  margin-left: auto;
  width: 40%;
  height: 400px;
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
.row:after {
  content: "";
  display: table;
  clear: both;
}
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
<br><br><br><br>
<center><h2>Add Album</h2></center>


<div class="container">
  <br>	
  <form action="${pageContext.request.contextPath}/UploadAlbumController?action=update"  method="POST">
    
    <div class="row">
      <div class="col-25">
        <label for="fname">Album Name</label>
      </div>
      <div class="col-75">
        <input type="text"  name="album_name" value="${editAlbum.album_name}" placeholder="Album name">
      </div>
    </div>

      <div class="row">
      <div class="col-25">
        <label for="fname">Album Type ID</label>
      </div>
      <div class="col-75">
        <input type="text"  name="typeid" value="${editAlbum.album_type_id}" placeholder="Album Type Id"> 
      </div>
     </div>

      <div class="row">
      <div class="col-25">
        <label for="fname">Album Description</label>
      </div>
      <div class="col-75">
         <input type="text" id="fname" name="desc" value="${editAlbum.album_description}" placeholder="Album Description">
      </div>
    </div>

    <div class="row">
      <div class="col-25">
        <label for="lname">Language</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="lang" value="${editAlbum.language}"  placeholder="Language">  
        <input type="hidden" value="${editAlbum.album_id}" name="id" />
      </div>
    </div> 

    <div class="row">
      <div class="col-25">
      <input type="submit" value="Submit">
      </div>
      <div class="col-25"> 
      <input type="reset" value="Cancel">
      </div>
    </div>   
  </form>

  <p><%=(request.getAttribute("message") == null) ? ""
         : request.getAttribute("message")%></p>
    
</div>
<%
	String email = (String) session.getAttribute("email");
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("Admin Edited Album", "Admin", email)) {
		System.out.println("Edit album event inserted");
	}
%>

</body>
</html>



























