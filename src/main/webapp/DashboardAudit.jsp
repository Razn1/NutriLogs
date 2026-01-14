<%@ page import="model.User" %>
<%
    // 1. PROTEKSI HALAMAN: Cek Session dan Role
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    if (!"admin_audit".equals(user.getRole())) {
        session.invalidate();
        response.sendRedirect("Login.jsp");
        return;
    }

    String hal = request.getParameter("halaman");
    String includePage = "";

    if (hal != null && !hal.isEmpty()) {
        includePage = hal + ".jsp"; 
    } else {
        includePage = "MainAudit.jsp"; 
    }
%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>NutriLog - Dashboard Audit</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <style>
            body {
                background: #f7f7fb;
                color: #1f2937;
                font-family: system-ui, -apple-system, "Segoe UI", Roboto, Arial, sans-serif;
            }
            .main-content {
                padding: 20px;
                min-height: 100vh;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid p-0">
            <div class="row g-0">
                <div class="col-md-3">
                    <%@include file="sidebar.jsp" %>
                </div>

                <div class="col-md-9">
                    <div class="main-content">
                        <jsp:include page="<%= includePage%>" />
                    </div>
                </div>
            </div>
        </div>

        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>