package com.java;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.java.Mailer;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.sql.*;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("mailid");
		String password_entered= request.getParameter("password");
		String fname=null,lname=null;
		String password_db=null;
		String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
		String username="root";
		String password="root";
		Connection conn=null;
		
		
		Mailer mailer= new Mailer();
		mailer.setMail(uname);
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			
			conn=DriverManager.getConnection(jdbcurl, username, password);
			
			Statement st= conn.createStatement();
		/*	
			ResultSet res= st.executeQuery("select * from booksdetails");
			
			while(res.next())
			{
				System.out.println("BooK name is"+res.getString("bookname"));
			}*/
			
			String query = "select * from logindetails where emailid='"+uname +"'";
			ResultSet res = st.executeQuery(query);
			
			while(res.next())
			{
			 password_db= res.getString("password");
			 fname=res.getString("fname");
			 lname = res.getString("lname");
			}
			//System.out.println(pass1);
		} catch (SQLException | ClassNotFoundException e) {
			
			e.printStackTrace();
			
		} 
		if(password_entered.equals(password_db))
		{
			HttpSession session = request.getSession();
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname); //take name from db
			response.sendRedirect("Home.jsp");
			
		}
		else 
		{
			response.sendRedirect("Error.jsp");
			
		}
		
		
	}

	

	

}
