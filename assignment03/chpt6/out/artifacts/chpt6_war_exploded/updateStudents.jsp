<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.dao.impl.StudentsDAOImpl" %>
<%@ page import="com.vo.Students" %>
<%@ page import="com.vo.Classes" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.IClassesDAO" %>
<!DOCTYPE html>
<html>
<%
    String token = (String) request.getSession().getAttribute("username"); // 从会话中获取令牌
    if (token == null) {
        // 令牌无效或不匹配，重定向到登录页面
        response.sendRedirect("index.jsp");
    } else {
%>
<head>
    <meta charset="UTF-8">
    <title>修改学生信息</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>修改<%
        try {
            Students temporaryStudent = DAOFactory.getStudentsDAOInstance().findStudentsById(request.getParameter("studentId"));
            out.print(temporaryStudent.getStudentName());
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>的学生信息</h1>
    <form action="" method="post">
        <input type="hidden" name="studentId" value="<%= request.getParameter("studentId") %>">
        <div class="mb-3">
            <label for="studentName" class="form-label">姓名：</label>
            <input type="text" class="form-control" id="studentName" name="studentName" required>
        </div>
        <div class="mb-3">
            <label for="studentPwd" class="form-label">密码：</label>
            <input type="password" class="form-control" id="studentPwd" name="studentPwd" required>
        </div>
        <div class="mb-3">
            <label for="sex" class="form-label">性别：</label>
            <select  class="form-control" id="sex" name="sex" required>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="classId" class="form-label">班级：</label>
            <select  class="form-control" id="classId" name="classId" required>
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
        <button type="submit" class="btn btn-primary" name="action" value="update">提交</button>
    </form>
    <%-- 处理表单提交 --%>
    <%
        if ("update".equals(request.getParameter("action"))) {
            String studentId = request.getParameter("studentId");
            String studentName = request.getParameter("studentName");
            String studentPwd = request.getParameter("studentPwd");
            String sex = request.getParameter("sex");
            int classId = Integer.parseInt(request.getParameter("classId"));

            try {
                boolean success = DAOFactory.getStudentsDAOInstance().updateStudents(studentId, studentName, studentPwd, sex, classId);
                if (success) {
                    out.println("学生信息更新成功！");
                } else {
                    out.println("学生信息更新失败！");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("学生信息更新出现异常：" + e.getMessage());
            }
        }
    %>
</div>
</body>
</html>
<%
    }
%>