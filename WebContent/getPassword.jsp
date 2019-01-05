<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:declaration> String mailid=null; </jsp:declaration>

<jsp:scriptlet>  mailid=request.getParameter("mailid"); </jsp:scriptlet>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "com.java.*" %>
<%

String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
String username="root";
String password="root";
String userPassword=null;
Connection conn=null;

Class.forName("com.mysql.jdbc.Driver"); 
conn=DriverManager.getConnection(jdbcurl, username, password);

Statement st= conn.createStatement(); 

String query="select password from logindetails where emailid='"+mailid+"'";

ResultSet res=st.executeQuery(query);
while(res.next())
{
	userPassword = res.getString("password");
	//out.println("User password is "+userPassword);
	Mailer mailer = new Mailer();
	mailer.sendPassword(mailid,userPassword);
	
}
%>
<h1> ${mailid} </h1>
<h1> password has been sent to your email id please check and </h1><a href="Login.jsp"> login here</a>
</body>
</html>