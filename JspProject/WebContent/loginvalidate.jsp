<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<%@page import="com.mysql.cj.jdbc.Driver"%>
	<%@page import="java.sql.*"%>
	
	<% String uname = request.getParameter("uname"); %>
	<% String ukey = request.getParameter("ukey"); %>
	<% Driver driver = new Driver();
         DriverManager.registerDriver(driver);
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
         String query = "select ukey from creds where uname = ?";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, uname);
         ResultSet rs = ps.executeQuery();
         if(rs.next()){
        	 if(rs.getString("ukey").equals(ukey)){
        		out.print("<a href='display.jsp'>View Profile</a><br>");
        	 }else{
        		 out.print("Invalid credentials");
        	 }
         }else{
        	 out.print("Invalid username");
         }
         con.close();
         %>
         <a href="index.jsp">To Home</a>
</body>
</html>