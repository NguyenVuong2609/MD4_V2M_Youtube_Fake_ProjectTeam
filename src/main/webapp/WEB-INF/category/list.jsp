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
<h1 style="text-align: center; color: violet"> ========================= CATEGORY CONTROLLER ===================== </h1>
<a href="/category?action=create"> CREATE CATEGORY </a>
<table border="1" style="width: 100%">
    <tr>
        <th>STT</th>
        <th>NAME</th>
        <th colspan="2">ACTION</th>
    </tr>
    <c:forEach items='${requestScope["categoryList"]}' var="ctm">
        <tr>
            <td>${ctm.getId()}</td>
            <td><a href="/category?action=detail&id=${ctm.getId()}">${ctm.getName()}</a></td>
            <td><a href="/category?action=edit&id=${ctm.getId()}"><button>EDIT</button></a></td>
            <td><a href="/category?action=delete&id=${ctm.getId()}"><button>DELETE</button></a></td>
        </tr>
    </c:forEach>


</table>
</body>
</html>
