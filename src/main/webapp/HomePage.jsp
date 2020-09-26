<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flickity@2/dist/flickity.css">
<script src="https://npmcdn.com/flickity@2/dist/flickity.pkgd.js"></script>
<style>

body{
	margin:0;
	padding:0;
}
.navbarr {
  overflow: hidden;
  background-color: #333;
  height: 70px;
  padding:0px;
}

.navbarr a {
  float: left;
  font-size: 20px;
  color: white;
  text-align: center;
  padding: 20px 16px;
  text-decoration: none;
}

.dropdownn {
  float: left;
  overflow: hidden;
}

.dropdownn .dropbtn {
  font-size: 20px;  
  border: none;
  outline: none;
  color: white;
  padding: 20px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbarr a:hover, .dropdownn:hover .dropbtn {
  background-color: grey;
}

.dropdown-contentt {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-contentt a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-contentt a:hover {
  background-color: #ddd;
}

.dropdownn:hover .dropdown-contentt {
  display: block;
}
 .navbarr .logout{
	float:right;
	margin-right:100px;
 }
 .container {
  position: relative;
  font-family: Arial;
}

 .text-block {
 	width:400px;
 	height:400px;
  position: absolute;
  bottom: 200px;
  right: 530px;
  background-color: black;
  color:white;
  padding-left: 20px;
  padding-right: 20px;
  opacity:0.6;
  font-size:20px;
  text-align:center;
}
		/* external css: flickity.css */
div.container img {
  width: 100%;
  height: 140px;
}
div.container {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  height:200px;
  width: 200px;
}

div.container:hover {
  border: 1px solid #777;
}



* { box-sizing: border-box; }

body { font-family: sans-serif; }

.carousel {
  background: #EEE;
}

.carousel-cell {
  width: 17%;
  height: 200px;
  margin-right: 10px;
  /*background: #8C8;*/
  border-radius: 5px;
  /*counter-increment: carousel-cell;*/
}

.carousel-cell.is-selected {
  background: #ED2;
}

/* cell number */
.carousel-cell:before {
  display: block;
  text-align: center;
  content: counter(carousel-cell);
  line-height: 200px;
  font-size: 80px;
  color: white;
}
div.desc {
  padding: 15px;
  text-align: center;
}
</style>
</head>
<body>
<%

	String email = (String)session.getAttribute("email");

	if(email == null){
		response.sendRedirect("index.jsp");
	}
	
	
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("Home Page Access", "Admin", email)) {
		System.out.println("Home Page event inserted");
	}
%>

<div class="navbarr">
  <a href="HomePage.jsp">Home</a>
  <a href="news.jsp">News</a>
  <div class="dropdownn">
    <button class="dropbtn">Add Data 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <a href="UploadAlbumController">Add Album</a>
    <a href="AddAlbumTypeController?action=ADD">Add Album Type</a>
    <a href="UploadPerformerController?action=ADD">Add Performer</a>
    <a href="UploadTrackController">Add Track</a>
    </div>
  </div> 
   <div class="dropdownn">
    <button class="dropbtn">Reports
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-contentt">
      <a href="AlbumViewerController?action=DISPLAY">Album Reports</a>
    <a href="AddAlbumTypeController?action=VIEW">Album Type Reports</a>
    <a href="UploadPerformerController?action=VIEW">Performer Reports</a>
    <a href="TrackViewerController?action=DISPLAY">Track Reports</a>
    <a href="UserController?action=LIST">User Reports</a>
    </div>
  </div> 
  <a href="logout.jsp" class="logout" >LOGOUT</a>
</div>
<h1>Upcoming Albums</h1>

<!-- Flickity HTML init -->
<div class="carousel" data-flickity='{ "groupCells": true }'>
  <div class="container"><img src="https://northerntransmissions.com/wp-content/uploads/2020/08/artwork.jpg"><div class="desc">Biffy Clyro A Celebration of Endings</div></div>

  <div class="container"><img src="https://cdn.shopify.com/s/files/1/0024/9803/5810/products/433055-Product-0-I-637196245847949814_large.jpg"><div class="desc">The Killers Imploding the Mirage</div></div>

  <div class="container"><img src="https://a10.gaanacdn.com/gn_img/albums/oAJbDlbnL8/AJbDYQXDKn/size_xxl.jpg"><div class="desc">Darshan Raval Ek Tarfa</div></div>
  <div class="container"><img src="https://images.genius.com/1b9edaa999b01cc55dbdd292e5b6e636.500x500x1.jpg"><div class="desc">Aastha Gill Hermosa</div></div>
  <div class="container"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUWwWDQMBbvaawVLLh2Kn0ayQrpSYqg2lQTQ&usqp=CAU"><div class="desc">Malang
</div></div>
  <div class="container"><img src="https://f4.bcbits.com/img/a1503838412_5.jpg"><div class="desc">Kelly Lee Owens Inner Song</div></div>
  <div class="container"><img src="https://img.republicworld.com/republic-prod/stories/promolarge/xxhdpi/x8gmsclivn8kvmng_1579672135.jpeg?tr=w-812,h-464"><div class="desc">Ed Sheeran's Minus</div></div>
  <div class="container"><img src="https://upload.wikimedia.org/wikipedia/en/1/16/Justin_Bieber_-_Changes.png"><div class="desc">Justin Bieber Changes</div></div>
  <div class="container"><img src="https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2020%2F02%2Fmap-of-the-soul.jpg"><div class="desc">BTS Map of the Soul 7</div></div>
  <div class="container"><img src="https://consequenceofsound.net/wp-content/uploads/2019/04/jonas-brothers-happiness-begins-album-release-date.jpg?quality=80&w=807"><div class="desc">The Jonas Brothers reunion album</div></div>
  <div class="container"><img src="https://media1.popsugar-assets.com/files/thumbor/aBqgGA62G3O3qyKu4P-EEZY7z9w/fit-in/728xorig/filters:format_auto-!!-:strip_icc-!!-/2019/06/14/624/n/1922283/fed46a425d03a84df2d9f4.51641745_/i/Taylor-Swift-Seventh-Album-Details.jpg"><div class="desc">Taylor Swift's Love</div></div>
</div>
<br><br>
<h1>New Performers</h1>
<div class="carousel" data-flickity='{ "groupCells": true }'>
  <div class="container"><img src="https://imgix.ranker.com/user_node_img/3100/61989638/original/ariana-grande-photo-u171?w=120&h=120&q=60&fm=pjpg&fit=crop&crop=faces"><div class="desc">Ariana Grande</div></div>
  <div class="container"><img src="https://imgix.ranker.com/user_node_img/3173/63446522/original/harry-styles-photo-u48?w=333&h=333&fit=crop&crop=faces&q=50&fm=pjpg"><div class="desc">Harry Styles</div></div>
  <div class="container"><img src="https://imgix.ranker.com/user_node_img/4136/82710678/original/shawn-mendes-photo-u15?w=333&h=333&fit=crop&crop=faces&q=50&fm=pjpg"><div class="desc">Shawn Mendes</div></div>
  <div class="container"><img src="https://in.bookmyshow.com/entertainment-news/wp-content/uploads/2017/09/Vidya-Vox-3-810x486.jpg"><div class="desc">Vidya Vox</div></div>
  <div class="container"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQYO4xv6LtQ76UrGuCFcpvCybrZuCLTV8JAYA&usqp=CAU"><div class="desc">Geetha Maduri</div></div>
  <div class="container"><img src="https://i1.wp.com/newsrush.in/wp-content/uploads/2020/07/darshan-raval-fans-assemble-the-mehrama-singer-to-unveil-ek-tarfa-on-this-date.jpg"><div class="desc">Darshan Raval</div></div>
  <div class="container"><img src="https://www.gstatic.com/tv/thumb/persons/1042549/1042549_v9_ba.jpg"><div class="desc">Shreya Ghoshal</div></div>
  <div class="container"><img src="https://a10.gaanacdn.com/images/artists/0/100/crop_480x480_100.jpg"><div class="desc">Vijay Yesudas</div></div>
  <div class="container"><img src="https://upload.wikimedia.org/wikipedia/commons/0/02/KS_harisankar.png"><div class="desc">K.S Harisankar</div></div>
  <div class="container"><img src="https://static.toiimg.com/thumb/msid-76191503,width-800,height-600,resizemode-75,imgsize-268811,pt-32,y_pad-40/76191503.jpg"><div class="desc">S. P. Balasubrahmanyam</div></div>
  <div class="container"><img src="https://www.gstatic.com/tv/thumb/persons/449967/449967_v9_bb.jpg"><div class="desc">A. R. Rahman</div></div>
  <div class="container"><img src="https://th.thgim.com/news/cities/chennai/9chrkl/article26156901.ece/alternates/FREE_435/2THILAIYARAAJA"><div class="desc">Ilaiyaraaja</div></div>
  <div class="container"><img src="https://images.hungama.com/a/1/b93/7f5/4314470/4314470_175x175.jpg"><div class="desc">M. S. Viswanathan</div></div>

</div>

</body>
</html>