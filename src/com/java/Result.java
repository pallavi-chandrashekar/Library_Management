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
 * Servlet implementation class Result
 */
@WebServlet("/Result")
public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcurl="jdbc:mysql://localhost:3306/userdetails";
		String username="root";
		String password="root";
		Connection conn=null;
		String bookName = request.getParameter("bookentered");
		System.out.println("in result java");
					
					try {
						Class.forName("com.mysql.jdbc.Driver");
						conn=DriverManager.getConnection(jdbcurl, username, password);
						
						Statement st= conn.createStatement();
						
						String query="select startdate from booksdetails where bookname='"+bookName+"'";
						
						ResultSet res=st.executeQuery(query);
						
						while(res.next())
						{
							String available = res.getString("startdate");
						System.out.println(available);
						}
					}
					catch (SQLException | ClassNotFoundException e) {
						
						e.printStackTrace();
					}
	}

	

}
