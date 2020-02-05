<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Data</title>
</head>
<body>
<%@page import="com.mysql.cj.jdbc.*"%>
<%@page import="java.sql.Connection" %>  
<%@page import="java.sql.PreparedStatement"%>
         <% String uname = request.getParameter("uname"); %>
         <% String ukey = request.getParameter("ukey"); %>
         <% String uemail = request.getParameter("uemail"); %>
         <% Driver driver = new Driver();
         DriverManager.registerDriver(driver);
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
         String query = "insert into creds values(?,?,?)";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, uemail);
         ps.setString(2, uname);
         ps.setString(3, ukey);
         int eq = ps.executeUpdate();
         if(eq==1){
        	 out.println("Data insertion successfull");
         }else{
        	 out.println("Data insertion successfull");
         }
         con.close();
         %><br>
         <a href="index.jsp">To home</a>
</body>
</html>