<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href=""> 
      <link rel="stylesheet" href="css/style.css"> 
<title>Home Page</title>
</head>
<body>
 <form action="Result.jsp" method="post">
 <jsp:declaration> 
String firstname; 
String lastname;
</jsp:declaration>
 
<%
    if(session.getAttribute("fname")==null)
    {
    	
    	response.sendRedirect("Login.jsp");
    	
    }
   
%>

<h1> 
<div style='float: right;'><button class="button-block" ><a href="Login.jsp">Log Out</a></div> </button>
</h1>
<h1>     Welcome ${fname} ${lname}</h1> 
<h1>To Abcd Library</h1> 

<h2>Please enter the book you want!!!</h2>
 <input type="text" name="bookentered" placeholder="Search.."> 
<input type="submit" value="Please  find the book" class="button button-block">
 
</form>
</body> 
</html>