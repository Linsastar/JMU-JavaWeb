<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello JSP的处理页面</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String likeCourse = request.getParameter("course");
%>
<p>从上一页得知，您所喜欢的课程是：<%=likeCourse%>
</p>
</body>