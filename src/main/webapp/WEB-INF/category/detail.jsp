<%--
  Created by IntelliJ IDEA.
  User: minh
  Date: 5/16/2023
  Time: 8:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table>
    <tr>
        <th>STT</th>
        <th>NAME</th>
    </tr>
    <tr>
        <td>${requestScope["category"].getId()}</td>
        <td>${requestScope["category"].getName()}</td>
    </tr>
</table>

</body>
</html>
