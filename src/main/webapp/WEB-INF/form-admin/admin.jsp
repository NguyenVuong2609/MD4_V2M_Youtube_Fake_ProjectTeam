<%--
  Created by IntelliJ IDEA.
  User: minh
  Date: 5/15/2023
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5 px-2">

    <a href="/category?action=create"> CREATE CATEGORY </a>
    <div class="table-responsive">
        <table class="table table-responsive table-borderless">

            <thead>
            <tr class="bg-light">
                <th>STT</th>
                <th>NAME</th>
                <th colspan="2">ACTION</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items='${requestScope["categoryList"]}' var="ctm">
            <tr>
                <td>${ctm.getId()}</td>
                <td><a href="/category?action=detail&id=${ctm.getId()}">${ctm.getName()}</a></td>
                <td><a href="/category?action=edit&id=${ctm.getId()}"><button style="background-color: #e0a800; border-radius: 5px">EDIT</button></a></td>
                <td><a href="/category?action=delete&id=${ctm.getId()}"><button style="background-color: #a71d2a; border-radius: 5px">DELETE</button></a></td>
            </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
