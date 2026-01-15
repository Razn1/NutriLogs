<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% 
    if (session.getAttribute("user") != null) {
        // Redirect to dashboard if logged in
        response.sendRedirect(request.getContextPath() + "/kitchen/dashboard"); 
    } else {
        // Redirect to login if not logged in
        response.sendRedirect(request.getContextPath() + "/login");
    }
%>