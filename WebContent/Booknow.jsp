<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book now</title>
</head>
<body>

<% if(session.getAttribute("bookname")==null)
{
	out.print("Please enter bookname");
	response.sendRedirect("Home.jsp");
}
%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.java.*" %>
<%

String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
String username="root";
String password="root";
String enddate=null;
 
Connection conn=null; 
Mailer mailer=new Mailer();

String mailid=mailer.to,bookname=mailer.book;
	 
//out.println("Book entered is "+bookname);
Class.forName("com.mysql.jdbc.Driver"); 
conn=DriverManager.getConnection(jdbcurl, username, password);

Statement st= conn.createStatement(); 

String query="update bookdetails set startdate=CURRENT_DATE,enddate= DATE_ADD(CURRENT_DATE,INTERVAL 15 DAY),mailid='"+mailid+"' where bookname='"+bookname+"'";
try{
int res=st.executeUpdate(query);
//out.print("Updated");
}
catch(Exception e)
{
	out.print("Please check bookname");
}

 String query1="select enddate from bookdetails where bookname='"+bookname+"'";
conn=DriverManager.getConnection(jdbcurl, username, password);

Statement st1= conn.createStatement(); 
ResultSet result=st.executeQuery(query1);
while(result.next())
{
	enddate=result.getString("enddate");
	
	out.print("<h1> You have to return book on ");
	out.print(enddate + "</h1>");
} 


%>
<div style='float: right;'><button><a href="Home.jsp">Home Page </a></button></div>
<h1>Book  ${bookname}  is booked in you name and you have to return book on or by ${enddate} </h1>
</body>
</html>