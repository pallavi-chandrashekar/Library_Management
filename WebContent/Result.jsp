<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href=""> 
      <link rel="stylesheet" href="css/style.css"> 

</head>
<body>
<div id="Result">  
 
<jsp:declaration> String bookname=null;
String Enddate;
String firstname=null,
lastname=null;</jsp:declaration>

<jsp:scriptlet>  
bookname=request.getParameter("bookentered"); 
</jsp:scriptlet>

Book entered is 
<strong><jsp:expression> bookname</jsp:expression>  </strong>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.java.*" %>
<%

String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
String username="root";
String password="root";
String Startdate=null;
String bookIntable=null;
Connection conn=null; 
	 
//out.println("Registered.");

   
//out.print(bookname);

Mailer mailer = new Mailer();
mailer.setBookName(bookname);

Class.forName("com.mysql.jdbc.Driver"); 
conn=DriverManager.getConnection(jdbcurl, username, password);

Statement st= conn.createStatement(); 

String query="select * from bookdetails where bookname='"+bookname+"'";
try{
ResultSet res=st.executeQuery(query);
while(res.next())
{
	Startdate = res.getString("startdate");
	Enddate= res.getString("enddate");
	bookIntable= res.getString("bookname");
}
 if(Startdate==null && !bookIntable.equals(null))
{
	out.println("Book is available");
	session.setAttribute("bookname", bookname);
	out.print("<br> <br> <button class='button-black'><a href='Booknow.jsp'> Book now </a></button>");
	
	
}
 
else 
{
	out.println("Book is available on "+Enddate);
	 Mailer mailer1= new Mailer();
	mailer1.sendEnddate(Enddate);
}
 }
 catch(Exception e)
 {
	 out.println("Sorry book you entered is not there in our library");
 }

%>

<div style='float: right;'><button><a href="Home.jsp">Home Page </a></button></div>
</div>
</body>
</html>