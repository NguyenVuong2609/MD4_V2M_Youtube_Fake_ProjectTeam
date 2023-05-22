<%--
  Created by IntelliJ IDEA.
  User: My PC
  Date: 5/15/2023
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Youtube</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="Assets/css/loadersmile.css">
</head>
<body>
<jsp:include page='../navbar/navbar.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>

<!-- sidebar -->
<jsp:include page='../navbar/sidebar.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>

<!-- main content -->
<div class="row main_container">
    <div class="col-md-2"></div>
    <div class="col-md-10">
        <!-- content section -->
        <div class="container-fluid">
            <c:if test="${sessionScope['userLogin']!=null}">
                <div class="grid_title"><h3>My Playlist</h3></div>
                <c:if test="${requestScope['listPlaylist'].size()>0}">
                    <c:forEach var="playlist" items="${requestScope['listPlaylist']}">
                        <div class="col-md-3 col-sx-10 p-2">
                            <img width="40" height="40" style="border-radius: 50%" --%
                                 src="${sessionScope['userLogin'].getAvatar()}"
                                 class="rounded-circle">
                            <a href="/playlist?action=video&id=${playlist.getPlaylist_id()}">${playlist.getPlaylist_name()}</a>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${requestScope['listPlaylist'].size()==0}">
                    <h3>You haven't created playlist yet</h3>
                </c:if>
            </c:if>
            <c:if test="${sessionScope['userLogin']==null}">
                <div class="right-wrapper">
                    <h3 class="spinnerIconWrapper">
                        <div class="spinnerIcon"></div>
                    </h3>
                    <h3 class="finished-text">
                        Please login first
                    </h3>
                </div>
            </c:if>
        </div>
    </div>
</div>
<!-- main content -->

<script src="/js/jquery-3.5.1.min.js"></script>
<script src="/js/popper.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>
