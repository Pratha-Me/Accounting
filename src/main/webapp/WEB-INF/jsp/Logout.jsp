<%-- 
    Document   : Logout
    Created on : Dec 1, 2019, 8:13:27 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
session.invalidate();
out.print("<script>window.location.assign('" + request.getContextPath() + "');</script>");
%>
    </body>
</html>
