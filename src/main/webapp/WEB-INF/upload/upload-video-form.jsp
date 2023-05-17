<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

    <title>Create Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        .uploadFile {
            margin: 0 10%;
        }
    </style>

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
<form class="row g-3" method="post" style="max-width: 1100px">
    <h3 style="text-align: center">Create Video</h3>
    <div class="col-md-12 uploadFile">
        <div class="col-md-1"></div>
        <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Video Name</label>
            <input type="text" class="form-control" id="inputEmail4" name="videoName">
        </div>
    </div>
    <div class="col-md-4 uploadFile">
        <label for="inputState" class="form-label">Category</label>
        <select name="category" id="inputState" class="form-select">
            <option selected>Choose...</option>
            <c:forEach var="category" items="${categoryList}">
                <option value="${category.getName()}" style="text-transform: capitalize">${category.getName()}</option>
            </c:forEach>
        </select>
    </div>
    <div class="col-md-12">
        <div class="col-md-1"></div>
        <div class="col-md-10 uploadFile">
            <label>Image for Video</label>
            <jsp:include page='./upload-img.jsp'>
                <jsp:param name="articleId" value=""/>
            </jsp:include>
            <label>Video</label>
            <jsp:include page='./upload-video.jsp'>
                <jsp:param name="articleId" value=""/>
            </jsp:include>
            <div class="col-md-1"></div>

        </div>
    </div>
    <div class="col-12" style="text-align: center">
        <button type="submit" class="btn btn-primary">Create</button>
    </div>
</form>

</body>

</html>