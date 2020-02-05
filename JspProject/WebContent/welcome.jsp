<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
       <% String uname = request.getParameter("uname"); %>
       <% out.print("Welcome Mr "+uname); %>
       <% request.getRequestDispatcher("ins.jsp").forward(request, response); %>
</body>
</html>