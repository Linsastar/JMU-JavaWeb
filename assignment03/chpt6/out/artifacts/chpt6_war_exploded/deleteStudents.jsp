<%@ page import="com.factory.DAOFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.dao.impl.StudentsDAOImpl" %>
<%@ page import="com.vo.Students" %>
<%@ page import="com.vo.Classes" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.IClassesDAO" %>
<%
    String studentId = request.getParameter("studentId");

    boolean success = false;
    try {
        success = DAOFactory.getStudentsDAOInstance().deleteStudents(studentId);
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (success) {
%>
<h1>学生信息删除成功！</h1>
<script>
    setTimeout(function(){
        window.location.href = "showStudents.jsp";
    }, 3000); // 三秒后跳转
</script>
<%
} else {
%>
<h1>学生信息删除失败！</h1>
<script>
    setTimeout(function(){
        window.location.href = "showStudents.jsp";
    }, 3000); // 三秒后跳转
</script>
<%
    }
%>
