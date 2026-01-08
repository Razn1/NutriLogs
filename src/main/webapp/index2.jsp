<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NutriLog</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background: #f7f7fb;
                color: #1f2937;
                font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", "Apple Color Emoji", "Segoe UI Emoji";
            }
        </style>
    </head>
    <body>
        <div class="container-fluid p-0 m-0">
            <div class="row g-0">
                <div class="col-md-12">
                    <%@ include file="header.jsp" %>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-md-12">
                    <%@ include file="main.jsp" %>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-md-12">
                </div>
            </div>
        </div>
    </body>

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</html>
