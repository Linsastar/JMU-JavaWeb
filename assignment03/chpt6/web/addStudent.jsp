<%@ page import="com.vo.Students" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.vo.Classes" %>
<%@ page import="com.dao.IClassesDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String token = (String) request.getSession().getAttribute("username"); // 从会话中获取令牌
    if (token == null) {
        // 令牌无效或不匹配，重定向到登录页面
        response.sendRedirect("index.jsp");
    } else {
%>
<head>
    <title>添加学生信息</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="text-center">添加学生信息</h1>
    <form action="addStudentAction.jsp" method="post">
        <div class="form-group">
            <label for="studentId">学号</label>
            <input type="text" class="form-control" id="studentId" name="studentId" required>
        </div>
        <div class="form-group">
            <label for="studentName">姓名</label>
            <input type="text" class="form-control" id="studentName" name="studentName" required>
        </div>
        <div class="form-group">
            <label for="studentPwd">密码</label>
            <input type="password" class="form-control" id="studentPwd" name="studentPwd" required>
        </div>
        <div class="form-group">
            <label for="sex">性别</label>
            <select class="form-control" id="sex" name="sex" required>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="classId">班级</label>
            <select class="form-control" id="classId" name="classId" required>
                <%
                    IClassesDAO classesDAO = DAOFactory.getClassesDAOInstance();
                    List<Classes> classesList = classesDAO.findClassesID();
                    for (Classes classes : classesList) {
                %>
                <option value="<%=classes.getClassId()%>"><%=classes.getClassName()%></option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="text-center"> <!-- 将按钮包装在居中的 div 中 -->
            <button type="submit" class="btn btn-primary btn-lg">提交</button> <!-- 使用 btn-lg 类来增加按钮尺寸 -->
        </div>
    </form> <!-- Close the form element here -->
</div>
<!-- Include Bootstrap JS (optional) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
<%
    }
%>
