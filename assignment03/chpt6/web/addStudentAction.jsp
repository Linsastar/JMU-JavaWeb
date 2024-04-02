<%--
  Created by IntelliJ IDEA.
  User: 巩晨阳
  Date: 2024/4/2
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.vo.Students" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentId = request.getParameter("studentId");
    String studentName = request.getParameter("studentName");
    String studentPwd = request.getParameter("studentPwd");
    String sex = request.getParameter("sex");
    int classId = Integer.parseInt(request.getParameter("classId"));

    Students student = new Students(studentId, studentName, studentPwd, sex, classId);

    boolean success = false;
    try {
        success = DAOFactory.getStudentsDAOInstance().insertStudents(student);
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (success) {
%>
<h1>学生信息添加成功！</h1>
<script>
    setTimeout(function(){
        window.location.href = "showStudents.jsp";
    }, 3000); // 三秒后跳转
</script>
<%
} else {
%>
<h1>学生信息添加失败！</h1>
<script>
    setTimeout(function(){
        window.location.href = "showStudents.jsp";
    }, 3000); // 三秒后跳转
</script>
<%

    }
%>
