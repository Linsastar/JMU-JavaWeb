<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello JSP页面</title>
</head>
<body>
<p>这是静态的内容：欢迎您学习JSP</p>
<br/>
<%out.println("这是动态显示的内容");%>
<form method="post" action="hello_do.jsp">
    <p>请输入您所喜欢的课程：</p>
    <p><input type="text" name="course" size="20"></p>
    <p><input type="submit" value="提交"></p>
</form>
</body>
</html>
