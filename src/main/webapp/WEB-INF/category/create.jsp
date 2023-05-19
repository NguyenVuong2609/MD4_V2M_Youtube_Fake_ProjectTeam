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
<c:if test='${requestScope["validate"]!=null}'>
    <label style="color: blue">${requestScope["validate"]}</label>
</c:if>
<form method="post">
    <table>
        <tr>
            <div><th>Name</th></div>
           <div><td><input style="border-radius: 5px" type="text" name="name"></td></div>
        </tr>
    </table>
    <br>
    <button style="background-color: #d39e00;border-radius: 5px" type="submit">CREATE</button>
    <a href="/category"><button style="border-radius: 5px;background-color: #1e7e34;margin-left: 100px">Back</button></a>
</form>
</body>
</html>
