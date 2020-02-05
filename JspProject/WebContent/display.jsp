<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Profile</title>
</head>
<body>
<%@page import="com.mysql.cj.jdbc.*"%>
<%@page import="java.sql.Connection" %>  
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%! String user = "";  %>
<%! String key = "";   %>
<%! String email = ""; %>
       
         <% Driver driver = new Driver();
         DriverManager.registerDriver(driver);
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
         String query = "select *from creds";
         PreparedStatement ps = con.prepareStatement(query);
         
         ResultSet rs = ps.executeQuery();
         if(rs.next()){
        	email = rs.getString(1); 
            user = rs.getString(2);
        	key = rs.getString(3);
         }
         con.close();
         %>
         email :<%out.print(email); %><br>  
         User : <%out.print(user); %><a href="edituser.jsp">edit</a> <br>
         key  : <%out.print(key); %><a href ="editkey.jsp">edit</a><br>
            <br> <a href="index.jsp">To Home</a>
</body>
</html>