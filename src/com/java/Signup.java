package com.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("In servlet");
		
		String fname=request.getParameter("fname");
		String lname = request.getParameter("lname");
		String emailid= request.getParameter("mailid");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
		String username="root";
		String password="root";
		Connection conn=null;
		
		conn=DriverManager.getConnection(jdbcurl, username, password);
		
		Statement st= conn.createStatement();
		
		
		int i=st.executeUpdate("insert into logindetails values ('"+fname+"','"+lname+"','"+emailid+"')"); 
		
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}

	

}
