<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
 <link href='' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="css/style.css"> 
</head>
<body>
<div id="Login">   
          <h1>Welcome Back!</h1>
          
          <form action="Login" method="get">
          
            <div class="field-wrap">
        <input type="email" required autocomplete="off" name="mailid" placeholder="Emailid*"/>
          </div>
          
          <div class="field-wrap">
              <input type="password" required autocomplete="off" name="password" placeholder="Password*"/>
          </div>
          
          <p class="forgot"><a href="forgotPassword.jsp">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
       
      </div>

</body>
</html>