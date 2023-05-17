<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/15/2023
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script>
    const firebaseConfig = {
        apiKey: "AIzaSyA77N_ysoRaVII4Lu4JHY_c-z2Ej7mJKRs",
        authDomain: "vuongcuti-6ce58.firebaseapp.com",
        projectId: "vuongcuti-6ce58",
        storageBucket: "vuongcuti-6ce58.appspot.com",
        messagingSenderId: "268262293286",
        appId: "1:268262293286:web:8cd35e7267375745d04be7",
        measurementId: "G-E7PQZW5JV2"
    };
</script>
<body>
<script>
    const firebaseConfig = {
        apiKey: "AIzaSyA77N_ysoRaVII4Lu4JHY_c-z2Ej7mJKRs",
        authDomain: "vuongcuti-6ce58.firebaseapp.com",
        projectId: "vuongcuti-6ce58",
        storageBucket: "vuongcuti-6ce58.appspot.com",
        messagingSenderId: "268262293286",
        appId: "1:268262293286:web:8cd35e7267375745d04be7",
        measurementId: "G-E7PQZW5JV2"
    };
</script>
<h1>Form create Channel</h1>
<form method="post">
    <div class="mb-3">
        <label class="form-label">Channel's Name:</label>
        <input type="text" class="form-control" name="channel_name">
    </div>
    <div class="mb-3">
        <label class="form-label">Avatar</label>
        <jsp:include page='../upload/upload-img.jsp'>
            <jsp:param name="articleId" value=""/>
        </jsp:include>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>
