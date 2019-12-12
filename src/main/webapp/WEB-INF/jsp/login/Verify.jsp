<%-- 
    Document   : Verify
    Created on : Dec 1, 2019, 8:28:54 AM
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
            try {
                String token = request.getParameter("token");
                if (token.length() < 100) {
                    out.print("THE SESSION IS INVALIDATED!");
                    session.invalidate();
                    out.print("<script>window.location.assign('" + request.getContextPath() + "');</script>");
                }else{
                    session.setAttribute("Authorization", "Bearer "+token);
                 out.print("<script>window.location.assign('" + request.getContextPath() + "/home');</script>");
                }
            } catch (Exception e) {
                session.invalidate();
                out.print("<script>window.location.assign('" + request.getContextPath() + "');</script>");
            }
        %>
    </body>
</html>
