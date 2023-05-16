<%--
  Created by IntelliJ IDEA.
  User: minh
  Date: 5/16/2023
  Time: 8:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center">======= From Creat Customer =======</h1>
<c:if test='${requestScope["validate"]!=null}'>
    <label style="color: blue">${requestScope["validate"]}</label>
</c:if>
<form method="post">
    <table>
        <tr>
            <td>Name</td>
            <td><input type="text" name="name"></td>
        </tr>
    </table>
    <button type="submit">CREATE</button>
    <a href="/category">Back</a>
</form>
</body>
</html>
