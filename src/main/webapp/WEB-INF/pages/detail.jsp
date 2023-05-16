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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sx-10 p-2">
                    <div class="card">
                        <video controls autoplay>
                            <source src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/video%2FEVERTON%200-3%20MAN%20CITY%20_%20Premier%20League%20highlights.mp4?alt=media&token=5e236221-c195-4a84-8b74-e52cb31404ff"
                                    type="video/mp4">
                        </video>
                        <div class="row">
                            <div class="col-2 mt-3">
                                <img width="48"
                                     src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                     class="rounded-circle">
                            </div>
                            <div class="col-4 mt-3">
                                <p class="mb-2"
                                   title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
                                    Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                    Pritam,
                                    Amitabh B|Arijit Singh</p>
                                <p style="color:#606060;">
                                    T-Series <i class="fas fa-check-circle"></i><br>
                                    70M views 7 months ago
                                </p>
                            </div>
                            <div class="col-2 mt-3">
                                <button type="button">Subscribe</button>
                            </div>
                            <div class="col-2 mt-3">
                                <span>143N</span>
                                <button type="button">Like</button>
                            </div>
                            <div class="col-2 mt-3">
                                <button type="button">Add to Playlist</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
