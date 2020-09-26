<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <style>

.blue-square {
  background: linear-gradient(to right,  #fc4a1a, #ee0979);  
  width: 80px;
  height: 30px;
  padding-top: 5px;
  display: inline-block;
  text-align: center;
  display: inline-block
}
.blue-square a{
    color: white;
}
.blue-square a:hover{
	color:white
}
header {
    width: 100%;
    height: 70px;
    background: #232323;
}

.hidden {
  display: none;
}
header h1 a {
	
    letter-spacing: 3px;
    position:relative;
    right: -80px;
    top: 10px;
    background: -webkit-linear-gradient(#fc4a1a, #ee0979);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;   
}

header .nav .navlink a{
	color: white;
	position:relative;
    top:-33px;
    right: -1200px;
    text-decoration: none;
    font-size: 1.2em;
}
.register a{
	color: #fc4a1a;

}
.register a:hover{
	color: #fc4a1a;
}

    	.main{
    		padding: 40px 0;
    	}
    	.col-md-3{
    		margin-bottom: 40px;
    	}
    	.album-poster{
    		position: relative;
    		display: block;
    		border-radius: 7px;
    		overflow: hidden;
    		
    		transition: all ease 0.4s;
    	}
    	.album-poster:hover{
    		box-shadow: none;
    		transform: scale(0.98) translateY(5px);
    	}
    	
    	p{
    		font-size: 15px;
    		color: grey;
    	}
    	
 .main{
  margin-top: 40px;
   }
.contain{
position: relative;
  font-family: Arial;
}
.text-block {
  position: absolute;
  width: 400px;
  height: 400px;
  bottom: 180px;
  right: 530px;
  background-color: black;
  color:white;
  padding-left: 20px;
  padding-right: 20px;
  opacity:0.6;
  font-size:30px;
  text-align:center;
}
  </style>
  </head>
  <body>
  <header>
        <h1><a>MUSIC</a></h1>
         <ul class="nav">
            <li class="navlink">
              <a id="example-popover" data-html="true" data-placement="bottom" tabindex="0" data-toggle="popover" role="button" data-trigger="focus">Hello,Sign In</a>
            </li>
        </ul> 
    </header> 
     <div id="example-popover-title" class="hidden"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <div class="blue-square"><a href="AdminLogin.jsp">Sign In</a></div><br><br>
 <div style="font-weight: 4px;" class="register">New User? <a href="AdminRegister.jsp">Start Here</a></div>
 </div>
 <div id="example-popover-content" class="hidden">
 </div>
 <div class="contain">
<img alt="" src="https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80" height="720px" width="1424px">
<div class="text-block">
<br>
    <center><h4>DISCOVER . ADD . FEEL</h4></center>
    <center><p>WHO ARE WE?</p></center><br><br>
        <p>Founded by creaters providing best music,servicing biggest brands human emotions,<br>in any medium through original compositions,sound designs,mixin.</p>
    
  </div>
</div>
<!--  <div class="topnav">
  <h1>MUSIC</h1>
  <ul class="nav">
            <li class="navlink">
              <a id="example-popover" data-html="true" data-placement="bottom" tabindex="0" data-toggle="popover" role="button" data-trigger="focus">Hello,Sign In</a>
            </li>
        </ul> 
 </div> -->
<script>
$(function(){
    // Enables popover
    $("#example-popover").popover({
        html : true, 
        content: function() {
          return $("#example-popover-content").html();
        },
        title: function() {
          return $("#example-popover-title").html();
        }
    });
});

</script>
  </body>
</html>
