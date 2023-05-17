<%--
  Created by IntelliJ IDEA.
  User: My PC
  Date: 5/15/2023
  Time: 3:03 PM
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
    <style>
        .card video {
            max-width: 100%;
        }
    </style>
</head>
<body>
<!-- navbar -->
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
    <div class="col-md-7">
        <!-- History section -->
        <c:forEach var="video" items="${videoDetail}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-sx-10 p-2">
                        <div class="card">
                            <video controls autoplay>
                                <source src="${video.video_link}"
                                        type="video/mp4">
                            </video>
                            <div class="row">
                                <div class="col-2 mt-3">
                                    <img width="48"
                                         src="${video.channel.getAvatar()}"
                                         class="rounded-circle">
                                </div>
                                <div class="col-5 mt-3">
                                    <p class="mb-2">
                                            ${video.video_name}</p>
                                    <p style="color:#606060;">
                                            ${video.channel.getChannel_name()} <i class="fas fa-check-circle"></i><br>
                                            ${video.view} views - ${video.video_date}
                                    </p>
                                </div>
                                <div class="col-1 mt-3"></div>
                                <div class="col-2 mt-3">
                                    <button type="button">Subscribe</button>
                                </div>
                                <div class="col-2 mt-3">
                                    <span>143N</span>
                                    <c:if test="${sessionScope['userLogin'] == null}">
                                        <a href="/user?action=login">
                                            <button type="button">Like</button>
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope['userLogin'] != null}">
                                        <c:if test='${requestScope["checkLike"]!=true}'>
                                            <a href="/user?action=detail&id=${video.video_id}&like=like">
                                                <button type="button">Like</button>
                                            </a>
                                        </c:if>
                                        <c:if test='${requestScope["checkLike"]==true}'>
                                            <a href="/user?action=detail&id=${video.video_id}&like=unlike">
                                                <button type="button">Unlike</button>
                                            </a>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-2 mt-3">
                                <button type="button">Add to Playlist</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach var="comment" items="${commentList}">
            <div class="card p-3 mt-2">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                        <img src="${comment.getUser().getAvatar()}" width="30" class="user-img rounded-circle mr-2">
                        <span><small class="font-weight-bold text-primary">${comment.getUser().getName()}</small>
                            <small class="font-weight-bold">${comment.getComment_content()} </small></span>
                    </div>
                    <small>${comment.getDate()}</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4">
                        <small>Remove</small>
                        <span class="dots"></span>
                        <small>Reply</small>
                        <span class="dots"></span>
                        <small>Translate</small>
                    </div>
                    <div class="icons align-items-center">
                        <i class="fa fa-check-circle-o check-icon text-primary"></i>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- History Section -->
        <p><br></p>
        <p><br></p>
    </div>
    <div class="col-md-3">
        <!-- Related Videos -->
        <div class="container-fluid">
            <div class="grid_title">Related Videos</div>
            <a href="#">
                <div class="row" style="width: 100%;">
                    <div class="col-md-12 col-sx-10 p-2">
                        <div class="card">
                            <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity2.webp?alt=media&token=a19ccb54-ef92-4eb3-bf16-27f853e13bf5">
                            <div class="row">
                                <div class="col-12 mt-3">
                                    <p class="mb-2">
                                        Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                        Pritam,
                                        Amitabh B|Arijit Singh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="container-fluid">
            <div class="grid_title">Related Videos</div>
            <a href="#">
                <div class="row" style="width: 100%;">
                    <div class="col-md-12 col-sx-10 p-2">
                        <div class="card">
                            <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity2.webp?alt=media&token=a19ccb54-ef92-4eb3-bf16-27f853e13bf5">
                            <div class="row">
                                <div class="col-12 mt-3">
                                    <p class="mb-2">
                                        Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                        Pritam,
                                        Amitabh B|Arijit Singh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="container-fluid">
            <div class="grid_title">Related Videos</div>
            <a href="#">
                <div class="row" style="width: 100%;">
                    <div class="col-md-12 col-sx-10 p-2">
                        <div class="card">
                            <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity2.webp?alt=media&token=a19ccb54-ef92-4eb3-bf16-27f853e13bf5">
                            <div class="row">
                                <div class="col-12 mt-3">
                                    <p class="mb-2">
                                        Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                        Pritam,
                                        Amitabh B|Arijit Singh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="container-fluid">
            <div class="grid_title">Related Videos</div>
            <a href="#">
                <div class="row" style="width: 100%;">
                    <div class="col-md-12 col-sx-10 p-2">
                        <div class="card">
                            <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity2.webp?alt=media&token=a19ccb54-ef92-4eb3-bf16-27f853e13bf5">
                            <div class="row">
                                <div class="col-12 mt-3">
                                    <p class="mb-2">
                                        Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                        Pritam,
                                        Amitabh B|Arijit Singh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="container-fluid">
            <div class="grid_title">Related Videos</div>
            <a href="#">
                <div class="row" style="width: 100%;">
                    <div class="col-md-12 col-sx-10 p-2">
                        <div class="card">
                            <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity2.webp?alt=media&token=a19ccb54-ef92-4eb3-bf16-27f853e13bf5">
                            <div class="row">
                                <div class="col-12 mt-3">
                                    <p class="mb-2">
                                        Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                        Pritam,
                                        Amitabh B|Arijit Singh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <!-- History Section -->
        <p><br></p>
        <p><br></p>
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
