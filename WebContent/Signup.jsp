<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link href='' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href=""> 
      <link rel="stylesheet" href="css/style.css"> 
</head>
<body>
<div id="Singup">  
 <form action="AddUsertoDB.jsp" method="post">
          <h1>Sign Up for Free</h1>

            <div class="field-wrap">    
              <input type="text" required autocomplete="off" name="fname" placeholder="FirstName*"/>
            </div>
        
            <div class="field-wrap">  
              <input type="text"required autocomplete="off" name="lname" placeholder="LastName*"/>
            </div>
          </div>

          <div class="field-wrap">
            <input type="email"required autocomplete="off" name="mailid" placeholder="Emailid*"/>
          </div>
          
         <button class="button button-block"/>Get Started</button>
</form>
</body>
</html>