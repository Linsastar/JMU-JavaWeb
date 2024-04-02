<%@ page import="com.vo.Students" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.factory.DAOFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    String token = (String) request.getSession().getAttribute("username"); // 从会话中获取令牌
    if (token == null) {
        // 令牌无效或不匹配，重定向到登录页面
        response.sendRedirect("index.jsp");
    } else {
        // 令牌有效，显示学生信息页面
%>
<head>
    <title>显示所有学生信息</title>
    <!-- Include Foundation CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.7.3/css/foundation.min.css">
</head>
<body>
<div class="grid-container">
    <div class="grid-x grid-padding-x">
        <div class="cell text-center">
            <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">学生信息管理系统</h1>
            <h2 style="font-size: 1.5rem;">欢迎，
                <%
                    try {
                        Students temporaryStudent = DAOFactory.getStudentsDAOInstance().findStudentsById((String) request.getSession().getAttribute("username"));
                        out.println(temporaryStudent.getStudentName());
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                %>
            </h2>
        </div>
        <div class="cell text-right">
            <form action="logout.jsp" method="post" id="logoutForm">
                <button class="button alert" type="submit">退出登录</button>
            </form>
        </div>
    </div>
    <div class="grid-x grid-padding-x">
        <div class="cell">
            <table class="unstack-for-small">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>性别</th>
                    <th>班级号</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody>
                <% List<Students> all = new ArrayList<Students>();
                    all = DAOFactory.getStudentsDAOInstance().findAllStudents();
                    if (all.size() != 0) {
                        for (int i = 0; i < all.size(); i++) {
                            Students stu = (Students) all.get(i);
                %>
                <tr>
                    <td><%=stu.getStudentId() %>
                    </td>
                    <td><%=stu.getStudentName() %>
                    </td>
                    <td><%=stu.getStudentPwd() %>
                    </td>
                    <td><%=stu.getSex() %>
                    </td>
                    <td><%=stu.getClassId() %>
                    </td>
                    <td><a class="button primary" href="updateStudents.jsp?studentId=<%=stu.getStudentId() %>">修改</a>
                    </td>
                    <td><a class="button alert" href="deleteStudents.jsp?studentId=<%=stu.getStudentId() %>">删除</a>
                    </td>
                </tr>
                <% } //end for
                }//end if
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="grid-x grid-padding-x mt-3 mb-3">
    <div class="cell text-center">
        <a class="button success" href="addStudent.jsp">添加学生</a>
    </div>
</div>

<!-- Include Foundation JS (optional) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.7.3/js/foundation.min.js"></script>
</body>
</html>

<%
    }
%>
