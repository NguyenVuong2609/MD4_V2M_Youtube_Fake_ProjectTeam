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
<form method="post">
    <table>
        <tr>
            <th>NAME</th>
        </tr>
        <tr>
            <td><input type="text" value="${requestScope["category"].getName()}" name="name"></td>
        </tr>
    </table>
    <button type="submit">Update</button>
</form>
</body>
</html>
