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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <%--    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>--%>
    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>--%>

    <!-- Buttons Core -->
    <link rel="stylesheet" href="Assets/css/pushy-buttons.css">

    <!-- Or -->

    <!-- Minified Version -->
    <link rel="stylesheet" href="Assets/css/pushy-buttons.min.css">
    <style>
        .card video {
            max-width: 100%;
        }

        .dropend button {
            background-color: #f0f0f0;
            color: black;
            padding: 1px 6px;
            /*border-color: black;*/
            border: 2px black solid;
            border-radius: 0%;
        }

        .dropdown-menu li a {
            color: black;
            text-decoration: none;
        }

        .comment-card {
            font-size: 16px;
        }

        .related-videos img {
            max-height: 140px;
        }
        .dropdown-menu button {
            width: 100%;
            border-color: transparent;
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
        <c:if test='${requestScope["validate"]=="success"}'>
            <div class="alert alert-success" role="alert">
                Added to playlist
            </div>
        </c:if>
        <c:if test='${requestScope["validate"]=="exist"}'>
            <div class="alert alert-warning" role="alert">
                Video already in your playlist
            </div>
        </c:if>
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
                            <div class="row" style="border: 1px solid #005cbf; border-radius: 8px; margin-top: 10px">
                                <div class="col-2 mt-3">
                                    <img width="40" height="40" style="border-radius: 50%"
                                         src="${video.channel.getAvatar()}"
                                         class="rounded-circle">
                                </div>
                                <div class="col-3 mt-3">
                                    <p class="mb-2" style="font-size: 16px">
                                            ${video.video_name}</p>
                                    <p style="color:#606060;">
                                            ${video.channel.getChannel_name()} <i class="fas fa-check-circle"></i><br>
                                            ${video.view} views - ${video.video_date}
                                    </p>
                                    <p>${requestScope['countFollower']} Subscribers</p>
                                </div>
                                <div class="col-2 mt-3">
                                    <c:if test='${sessionScope["userLogin"]!=null}'>
                                        <c:if test="${requestScope['checkSubscribe']==false}">
                                            <a href="/channel?action=add&id=${video.video_id}&idc=${video.channel.getChannel_id()}">
                                                <button type="button" class="pushy__btn pushy__btn--sm pushy__btn--blue">Subscribe</button>
                                            </a>
                                        </c:if>
                                        <c:if test="${requestScope['checkSubscribe']}">
                                            <a href="/channel?action=remove&id=${video.video_id}&idc=${video.channel.getChannel_id()}">
                                                <button type="button" class="pushy__btn pushy__btn--sm pushy__btn--blue">Subscribe</button>
                                            </a>
                                        </c:if>
                                    </c:if>
                                    <c:if test='${sessionScope["userLogin"]==null}'>
                                        <a href="/user?action=login">
                                            <button type="button" class="pushy__btn pushy__btn--sm pushy__btn--blue">Subscribe</button>
                                        </a>
                                    </c:if>
                                </div>
                                <div class="col-2 mt-3">
                                    <span>${requestScope['countLike']}</span>
                                    <c:if test="${sessionScope['userLogin'] == null}">
                                        <a href="/user?action=login">
                                            <button type="button" class="pushy__btn pushy__btn--sm pushy__btn--green">Like</button>
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope['userLogin'] != null}">
                                        <c:if test='${requestScope["checkLike"]!=true}'>
                                            <a href="/like?action=like&id=${video.video_id}">
                                                <button type="button" class="pushy__btn pushy__btn--sm pushy__btn--green">Like</button>
                                            </a>
                                        </c:if>
                                        <c:if test='${requestScope["checkLike"]==true}'>
                                            <a href="/like?action=unlike&id=${video.video_id}">
                                                <button type="button" class="pushy__btn pushy__btn--sm pushy__btn--red">Unlike</button>
                                            </a>
                                        </c:if>
                                    </c:if>
                                </div>
                                <div class="col-2 mt-3">
                                    <div class="btn-group dropend">
                                        <button type="button" class="btn btn-secondary dropdown-toggle"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            Add to Playlist
                                        </button>
                                        <ul class="dropdown-menu">
                                            <c:if test='${sessionScope["userLogin"]!=null}'>
                                                <c:forEach var="playlist" items='${listHavingVideo}'>
                                                    <li>
                                                        <a href="/playlist?action=delete&id=${video.video_id}&idPL=${playlist.getPlaylist_id()}">
                                                            <button class="btn btn-danger">
                                                                Remove from ${playlist.playlist_name}
                                                            </button>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                                <c:forEach var="listNotHavingVideo" items='${listNotHavingVideo}'>
                                                    <li>
                                                        <a href="/playlist?action=add&id=${video.video_id}&idPL=${listNotHavingVideo.getPlaylist_id()}">
                                                            <button class="btn btn-success">
                                                                    ${listNotHavingVideo.playlist_name}
                                                            </button>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test='${sessionScope["userLogin"]==null}'>
                                                <li>
                                                    <a href="/user?action=login">
                                                        <button class="btn">
                                                            Please Login First
                                                        </button>
                                                    </a></li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <%--         Comment form--%>
        <c:if test="${sessionScope['userLogin'] != null}">
            <c:forEach var="video" items="${videoDetail}">
                <div class="card-footer py-3 border-0" style="background-color: #f8f9fa;">
                    <form action="/comment?action=post&id=${video.video_id}" method="post">
                        <div class="d-flex flex-start w-100">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="${sessionScope['userLogin'].getAvatar()}" alt="avatar" width="40"
                                 height="40"/>
                            <div class="form-outline w-100">
                <textarea class="form-control" id="textAreaExample" rows="4"
                          style="background: #fff;" name="content" placeholder="Write something..."></textarea>
                                <label class="form-label" for="textAreaExample"
                                       style="font-size: 16px; font-style: italic">You are comment as <span
                                        style="color: #005cbf">${sessionScope['userLogin'].getName()}</span></label>
                            </div>
                        </div>
                        <div class="float-end mt-2 pt-1">
                            <button type="submit" class="btn btn-primary btn-sm">Post comment</button>
                        </div>
                    </form>
                </div>

            </c:forEach>
        </c:if>
        <br><br>

        <%--        Show list comment--%>
        <c:forEach var="comment" items="${commentList}">
            <div class="card p-3 mt-2 comment-card">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                        <img src="${comment.getUser().getAvatar()}" style="width: 30px;height: 30px"
                             class="user-img rounded-circle mr-2">
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
        <div class="grid_title">Related Videos</div>
        <c:forEach var="video" items="${relatedVideos}">
            <div class="container-fluid related-videos">
                <a href="/user?action=detail&id=${video.video_id}">
                    <div class="row" style="width: 100%;">
                        <div class="col-md-12 col-sx-10 p-2">
                            <div class="card">
                                <img src="${video.image}">
                                <div class="row">
                                    <div class="col-12 mt-3">
                                        <p class="mb-2" style="font-weight: bold; font-size: 16px">
                                                ${video.video_name}</p>
                                        <p class="mb-2"
                                           style="font-size: 14px; color:#606060;">${video.channel.getChannel_name()}</p>
                                        <p class="mb-2" style="color:#606060;">${video.view} views</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
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
