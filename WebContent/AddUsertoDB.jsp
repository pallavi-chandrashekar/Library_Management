<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href='' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href=""> 
</head>
<body>
<jsp:declaration> 
String fname=null; 
String lname=null;
String emailid=null;
String pass;
</jsp:declaration>

<jsp:scriptlet>  fname=request.getParameter("fname"); 
lname=request.getParameter("lname");
emailid=request.getParameter("mailid");</jsp:scriptlet>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="com.java.*" %>

<%! String makePassword(int leng)
{
	String res="";
	for(int i=0;i<leng-2;i++)
	{
		res=res+randomCharacter("abcdefghijklmnopqrstuvwxyz");
	}
	String randomDig= randomCharacter("0123456789");
	res= insertAtRandom(res, randomDig);
	
	String randomSymbol= randomCharacter("+-!@#$%^&*()/?<>~");
	res= insertAtRandom(res, randomSymbol);
	return res;
}
%>
<%! String randomCharacter(String characters)
{
	int n=characters.length();
	int r=(int) (n* Math.random());
	return characters.substring(r, r+1);
	
}
%>

<%!  String insertAtRandom(String str, String  toInsert)
{
	int n=str.length();
	int r = (int)((n+1)* Math.random());
	return str.substring(0,r)+ toInsert +str.substring(r);
	
}
%>



<%

String lname = request.getParameter("lname");
String mailid= request.getParameter("mailid");
pass=makePassword(7);



Class.forName("com.mysql.jdbc.Driver");

String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
String username="root";
String password="root";
Connection conn=null;

conn=DriverManager.getConnection(jdbcurl, username, password);

 Statement st= conn.createStatement();

String res= "insert into logindetails (fname,lname,emailid,password) values ("+"'"+fname+"',"+"'"+lname+"',"+"'"+emailid+"',"+"'"+pass+"')" ;
try{
int result=st.executeUpdate(res);


 Mailer mailer = new Mailer();
 mailer.sendPassword(mailid,pass);
 out.print("<div class='field-wrap'>");
 out.print("<h1> User Added Successfully</h1>");

 out.print("<h1> Please check the mail for password and</h1> <a href='Login.jsp'> login here</a>");
 out.print("</div>");
}
catch(Exception e)
{
	out.print("User is already registered please click on forgot password to get your password");
	out.print("<a href='Login.jsp'> login here</a>");
}


%>
</body>
</html>