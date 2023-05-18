<%@ page import="java.util.List" %>
<%@ page import="rikkei.academy.model.Video" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MeTube</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/all.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<!-- navbar -->
<jsp:include page='WEB-INF/navbar/navbar.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>

<!-- sidebar -->
<jsp:include page='WEB-INF/navbar/sidebar.jsp'>
    <jsp:param name="articleId" value=""/>
</jsp:include>


<!-- main content -->
<div class="row main_container">
    <div class="col-md-2"></div>
    <div class="col-md-10">
        <!-- Recommended section -->
        <div class="container-fluid">
            <div class="grid_title">Recommended</div>
            <div class="row">
                <c:forEach var="video" items="${videoList}">
                    <div class="col-md-3 p-2">
                        <a href="/user?action=detail&id=${video.video_id}">
                            <div class="card">
                                <img src="${video.image}"
                                     alt="image" height="174"/>
                                <div class="row">
                                    <div class="col-2 mt-3">
                                        <img width="40" height="40" style="border-radius: 50%"
                                             src="${video.channel.getAvatar()}">
                                    </div>
                                    <div class="col-10 mt-3">
                                        <p class="mb-2">
                                                ${video.video_name}</p>
                                        <p style="color:#606060;">
                                                ${video.channel.getChannel_name()} <i
                                                class="fas fa-check-circle"></i><br>
                                                ${video.view} views - ${video.video_date}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                <!-- Recommended Section -->

<%--                Pagination--%>

<%--                    <c:forEach var="video" items="${videoList}">--%>
<%--                        <div class="col-md-3 p-2">--%>
<%--                            <a href="/user?action=detail&id=${video.video_id}">--%>
<%--                                <div class="card">--%>
<%--                                    <img src="${video.image}"--%>
<%--                                         alt="image" height="174"/>--%>
<%--                                    <div class="row">--%>
<%--                                        <div class="col-2 mt-3">--%>
<%--                                            <img width="40" height="40" style="border-radius: 50%"--%>
<%--                                                 src="${video.channel.getAvatar()}">--%>
<%--                                        </div>--%>
<%--                                        <div class="col-10 mt-3">--%>
<%--                                            <p class="mb-2">--%>
<%--                                                    ${video.video_name}</p>--%>
<%--                                            <p style="color:#606060;">--%>
<%--                                                    ${video.channel.getChannel_name()} <i--%>
<%--                                                    class="fas fa-check-circle"></i><br>--%>
<%--                                                    ${video.view} views - ${video.video_date}--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${pageNumber != 1}">
                            <li class="page-item"><a class="page-link" href="/video?action=page_grid&page=${pageNumber-1}">Previous</a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${sumOfPage}" var="i" varStatus="red">
                            <c:choose>
                                <c:when test="${pageNumber eq i}">
                                    <li class="page-item"><a style="color: red" class="page-link" href="/video?action=page_grid&page=${i}">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a  class="page-link" href="/video?action=page_grid&page=${i}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                        <c:if test="${pageNumber lt sumOfPage}">
                            <li class="page-item"><a href="/video?action=page_gid&page=${pageNumber + 1}">Next</a></li>
                        </c:if>
                    </ul>
                </nav>
<%--                Pagination--%>
                <hr>

                <!-- Trending Section -->
                <div class="container-fluid">
                    <div class="grid_title">Trending</div>
                    <div class="row">
                        <c:forEach var="trending" items='${trendingList}'>
                            <div class="col-md-3 col-sx-10 p-2">
                                <a href="/user?action=detail&id=${trending.video_id}">
                                    <div class="card">
                                        <img src="${trending.getImage()}"
                                             height="174"/>
                                        <div class="row">
                                            <div class="col-2 mt-3">
                                                <img width="48"
                                                     src="${trending.getChannel().getAvatar()}"
                                                     class="rounded-circle">
                                            </div>
                                            <div class="col-10 mt-3">
                                                <p class="mb-2"
                                                   title="${trending.getVideo_name()}">
                                                        ${trending.getVideo_name()}</p>
                                                <p style="color:#606060;">
                                                        ${trending.getChannel().getChannel_name()} <i
                                                        class="fas fa-check-circle"></i><br>
                                                        ${trending.getView()} views ${trending.getVideo_date()}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- Trending Section -->
                <p><br></p>
                <p><br></p>
            </div>
        </div>
        <!-- main content -->

        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </div>
</div>
</body>
</html>