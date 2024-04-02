<%--
    Created by IntelliJ IDEA.
    User: 巩晨阳
    Date: 2024/3/30
    Time: 11:17
    To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.dao.impl.StudentsDAOImpl" %>
<%@ page import="com.vo.Students" %>
<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            border-radius: 10px 10px 0 0;
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


<div class="container mt-5">
    <h3 class="text-center mb-4">学生成绩管理系统登录</h3>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    登录
                </div>
                <div class="card-body">
                    <form method="post">
                        <div class="form-group">
                            <label for="username">学号</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">登录</button>
                        </div>
                    </form>
                </div>
                <%
                    if (request.getMethod().equals("POST")) {
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");

                        StudentsDAOImpl studentsDAO = new StudentsDAOImpl();
                        boolean loginSuccess = false;
                        try {
                            loginSuccess = studentsDAO.verifyStudentLogin(username, password);
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }

                        if (loginSuccess) {
                            request.getSession().setAttribute("username", username);
                            String redirectUrl = "welcome.jsp";
                            response.sendRedirect(redirectUrl);
                        } else {
                            // 登录失败，显示错误消息
                            out.println("<div class='alert alert-danger mt-3' role='alert'>用户名或密码错误</div>");
                        }
                    }
                %>

            </div>
        </div>
    </div>
</div>
</body>
</html>



