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
<div id="forgotPassword">   

          <h1>Forgot Password!!<br> No Worries</h1>
          <h1>Please provide your registered Email id </h1>
          
          <form action="getPassword.jsp" method="post">
          
          <div class="field-wrap">
            <input type="email" required autocomplete="off" name="mailid" placeholder="EmailId*"/>
          </div>
       
          <input type="submit" value="Please get the password" class="button button-block">
          
          </form>

        </div>
</body>
</html>