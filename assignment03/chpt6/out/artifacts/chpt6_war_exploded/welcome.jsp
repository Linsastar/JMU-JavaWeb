<%--
  Created by IntelliJ IDEA.
  User: 巩晨阳
  Date: 2024/3/30
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>

<%
  String token = (String) request.getSession().getAttribute("username"); // 从会话中获取令牌
  if (token == null) {
    // 令牌无效或不匹配，重定向到登录页面
    response.sendRedirect("index.jsp");
  } else {
    // 令牌有效，显示学生信息页面
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>欢迎</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      margin-top: 100px;
    }

    .card {
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .card-header {
      background-color: #28a745;
      color: white;
      border-radius: 10px 10px 0 0;
    }

    .card-body {
      text-align: center;
    }

    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }

    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }

    .form-control {
      border-radius: 5px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          欢迎登录成功！
        </div>
        <div class="card-body">
          <h5 class="card-title">Welcome, <%= request.getSession().getAttribute("username") %>!</h5>
          <p class="card-text">您已成功登录。</p>
          <a href="showStudents.jsp" class="btn btn-primary">进入管理系统</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
<%
  }
%>