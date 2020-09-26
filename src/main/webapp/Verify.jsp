<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VERIFY EMAIL</title>
<style>

/** {
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}*/

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

</head>
<body>
<!-- <div class="arrange">
<span>We have sent a verification code to your respective email. Please type the code to get verified</span><br><br><br><br><br><br>
<form  action="VerifyCode" method="post">
<input type="text" name="authcode">
<input type="submit" value="verify">
</form>

</div> -->
<center><h3 style="margin-top:-70px;">We have sent a verification code to your respective email.</h3><br><p> Please type the code to get verified</p></center>

<form class='login-form' name="form" action = "VerifyCodeController" method="POST">
  <div class="flex-row">
    <label class="lf--label" for="authcode">
      <svg x="0px" y="0px" width="12px" height="13px">
        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z" />
      </svg>
    </label>
    <input id="authcode" class='lf--input' placeholder='Authcode' type='text' name="authcode" required>
  </div>
  
  <input class='lf--submit' type='submit'>
</form>
</body>
</html>