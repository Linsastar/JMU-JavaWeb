<%--
  Created by IntelliJ IDEA.
  User: 巩晨阳
  Date: 2024/4/1
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    request.getSession().invalidate();
%>
<head>
    <title>退出登录</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">退出登录</h5>
                    <p class="card-text">您已成功退出登录。</p>
                    <p class="card-text">页面将在 5 秒后自动跳转到登录页面。</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // 5秒后自动跳转到登录页面
    setTimeout(function () {
        window.location.replace("index.jsp");
    }, 5000);
</script>
</body>
</html>

