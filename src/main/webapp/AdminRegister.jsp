<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="in.dao.LogAndAuditDAO"  %>
<%@ page import="in.dao.LogAndAuditDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTER</title>
<style type="text/css">
html,
body {
  height: 100%;
}

body {
  display: -webkit-box;
  display: flex;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  position: relative;
  background-color: white;
/*  background: linear-gradient(135deg, rgba(36, 46, 77, 0.9), rgba(137, 126, 121, 0.9));
*/  
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 1.5em;
}
body:before {
  
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  
  
}

.login-form {
  width: 100%;
  padding: 2em;
  position: relative;
  background: black;
  
}
.login-form:before {
  content: "";
  position: absolute;
  top: -2px;
  left: 0;
  height: 3px;
  width: 100%;
  background: -webkit-gradient(linear, left top, right top, from(#35c3c1), to(#00d6b7));
  background: linear-gradient(to right,  #fc4a1a, #ee0979);
}
@media screen and (min-width: 600px) {
  .login-form {
    width: 50vw;
    max-width: 15em;
  }
}

.flex-row {
  display: -webkit-box;
  display: flex;
  margin-bottom: 1em;

}

.lf--label {
  width: 2em;
  display: -webkit-box;
  display: flex;
  -webkit-box-align: center;
          align-items: center;
  -webkit-box-pack: center;
          justify-content: center;
  background: #f5f6f8;
  cursor: pointer;

}

.lf--input {
  -webkit-box-flex: 1;
          flex: 1;
  padding: 1em;
  border: 0;
  color: #8f8f8f;
  font-size: 1rem;
}
.lf--input:focus {
  outline: none;
  -webkit-transition: -webkit-transform 0.15s ease;
  transition: -webkit-transform 0.15s ease;
  transition: transform 0.15s ease;
  transition: transform 0.15s ease, -webkit-transform 0.15s ease;
  -webkit-transform: scale(1.1);
          transform: scale(1.1);
}

.lf--submit {
  display: block;
  padding: 1em;
  width: 100%;
  background: -webkit-gradient(linear, left top, right top, from(#35c3c1), to(#00d6b7));
  background: linear-gradient(to right, #fc4a1a, #ee0979);
  border: 0;
  color: #fff;
  cursor: pointer;
  font-size: 0.75em;
  font-weight: 600;
  text-shadow: 0 1px 0 rgba(0, 0, 0, 0.2);
}
.lf--submit:focus {
  outline: none;
  -webkit-transition: -webkit-transform 0.15s ease;
  transition: -webkit-transform 0.15s ease;
  transition: transform 0.15s ease;
  transition: transform 0.15s ease, -webkit-transform 0.15s ease;
  -webkit-transform: scale(1.1);
          transform: scale(1.1);
}

.lf--forgot {
  margin-top: 1em;
  color: #fc4a1a;
 /* #00d6b7;*/
  font-size: 0.65em;
  text-align: center;
  position: relative;
}

::-webkit-input-placeholder {
  color: #8f8f8f;
}

::-moz-placeholder {
  color: #8f8f8f;
}

:-ms-input-placeholder {
  color: #8f8f8f;
}

::-ms-input-placeholder {
  color: #8f8f8f;
}

::placeholder {
  color: #8f8f8f;
}

</style>
<script> 
function validate()
{ 
    var AdminId = document.form.AdminId.value;
     var email = document.form.email.value;
     var username = document.form.username.value; 
     var password = document.form.password.value;
     var conpassword= document.form.conpassword.value;
     
     
      if (password!=conpassword)
     { 
     alert("Confirm Password should match with the Password"); 
     return false; 
     } 
 } 
</script> 
</head>
<body>
<%-- <div class="span-17" style="padding-left:20px;">
<br/>
<h3>User Registration</h3>
<hr/>
<div class="span-17">
<form name="form"  action="AdminController" method="POST" onsubmit="return validate()">
  <table style="border:1px solid #9DBCEB;">
    <tr>
      <th colspan="3" bgcolor="#9DBCEB" scope="col">User Registration Form </th>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td width="164">Admin ID </td>
      <td width="12">&nbsp;</td>
      <td width="216">
        <input type="text" name="AdminId" required>
      </td>
    </tr>
    <tr>
      <td width="164">User Name </td>
      <td width="12">&nbsp;</td>
      <td width="216">
        <input type="text" name="username" required>
      </td>
    </tr>
    <tr>
      <td>Email ID </td>
      <td>&nbsp;</td>
      <td>
        <input type="email" name="email" required>
      </td>
    </tr>
    <tr>
      <td>Password</td>
      <td>&nbsp;</td>
      <td>
        <input type="password" name="password" required>
      </td>
    </tr>
    <tr>
      <td>Confirm Password </td>
      <td>&nbsp;</td>
      <td>
        <input type="password" name="conpassword" required>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><button type="submit">Submit</button></td>
    </tr>
  </table>
</form>
<p><%=(request.getAttribute("message") == null) ? ""
         : request.getAttribute("message")%></p>
</div>
</div> --%>
<center><h3>REGISTER</h3></center>
<form class='login-form' name="form" action = "AdminController" method="POST" onsubmit="return validate()">
  <div class="flex-row">
    <label class="lf--label" for="AdminId">
      <svg x="0px" y="0px" width="12px" height="13px">
        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z" />
      </svg>
    </label>
    <input id="AdminID" class='lf--input' placeholder='Admin ID' type='text' name="AdminId" required>
  </div>
  <div class="flex-row">
    <label class="lf--label" for="username">
      <svg x="0px" y="0px" width="12px" height="13px">
        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z" />
      </svg>
    </label>
    <input id="username" class='lf--input' placeholder='Username' type='text' name="username" required>
  </div>
  <div class="flex-row">
    <label class="lf--label" for="email">
      <svg x="0px" y="0px" width="12px" height="13px">
        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z" />
      </svg>
    </label>
    <input id="email" class='lf--input' placeholder='Email' type='text' name="email" required>
  </div>
  <div class="flex-row">
    <label class="lf--label" for="password">
      <svg x="0px" y="0px" width="15px" height="5px">
        <g>
          <path fill="#B1B7C4" d="M6,2L6,2c0-1.1-1-2-2.1-2H2.1C1,0,0,0.9,0,2.1v0.8C0,4.1,1,5,2.1,5h1.7C5,5,6,4.1,6,2.9V3h5v1h1V3h1v2h1V3h1 V2H6z M5.1,2.9c0,0.7-0.6,1.2-1.3,1.2H2.1c-0.7,0-1.3-0.6-1.3-1.2V2.1c0-0.7,0.6-1.2,1.3-1.2h1.7c0.7,0,1.3,0.6,1.3,1.2V2.9z" />
        </g>
      </svg>
    </label>
    <input id="password" class='lf--input' placeholder='Password' type='password' name="password" required>
  </div>
  <div class="flex-row">
    <label class="lf--label" for="conpassword">
      <svg x="0px" y="0px" width="15px" height="5px">
        <g>
          <path fill="#B1B7C4" d="M6,2L6,2c0-1.1-1-2-2.1-2H2.1C1,0,0,0.9,0,2.1v0.8C0,4.1,1,5,2.1,5h1.7C5,5,6,4.1,6,2.9V3h5v1h1V3h1v2h1V3h1 V2H6z M5.1,2.9c0,0.7-0.6,1.2-1.3,1.2H2.1c-0.7,0-1.3-0.6-1.3-1.2V2.1c0-0.7,0.6-1.2,1.3-1.2h1.7c0.7,0,1.3,0.6,1.3,1.2V2.9z" />
        </g>
      </svg>
    </label>
    <input id="conpassword" class='lf--input' placeholder='Confirm Password' type='password' name="conpassword" required>
  </div>
  <input class='lf--submit' type='submit' >
</form>
<br>
<a class='lf--forgot' href='AdminLogin.jsp'>Existing User?</a>
<%
	String email = (String) session.getAttribute("email");
	LogAndAuditDAO logAndAuditDAO = null;
	logAndAuditDAO = new LogAndAuditDAOImpl();
	if(logAndAuditDAO.save("Admin Registered", "Admin", email)) {
		System.out.println("Admin Register event inserted");
	}
%>
</body>
</html>





