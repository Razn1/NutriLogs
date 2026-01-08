<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NutriLog</title>
        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <%--<%@ include file="header.jsp" %>--%>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-md-3">
                    <%@include file="sidebar.jsp" %>
		</div>
		<div class="col-md-9">
                    <%@ include file="MainAudit.jsp" %>
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
