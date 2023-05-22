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
<section class="vh-100" style="background-color: #9A616D;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://firebasestorage.googleapis.com/v0/b/vuongcuti-6ce58.appspot.com/o/ada16846d3640d3a5475.jpg?alt=media&token=101c8026-84ed-4653-9b4b-209194ca3236"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;"/>
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center">
                            <div class="card-body p-4 p-lg-5 text-black">
                                <form method="post">
                                    <h3>Create Channel</h3>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
