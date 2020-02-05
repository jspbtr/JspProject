<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User name</title>
</head>
<body>

         <%@page import="com.mysql.cj.jdbc.Driver"%>
         <%@page import="java.sql.*"%>
         
         <% String nu = request.getParameter("newuser");%>
         <% String uemail = request.getParameter("uemail"); %>
         
         <% Driver driver = new Driver();
         DriverManager.registerDriver(driver);
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
         String query = "update creds set uname = ? where uemail = ?";
         PreparedStatement ps = con.prepareStatement(query);
         ps.setString(1, nu);
         ps.setString(2, uemail);
         int eq = ps.executeUpdate();
         if(eq==1){
        	 response.sendRedirect("display.jsp");
         }else{
        	 out.println("Data insertion successfull");
         }
         con.close();
         %><br>
         
</body>
</html>