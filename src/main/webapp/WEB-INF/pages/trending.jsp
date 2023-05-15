<%--
  Created by IntelliJ IDEA.
  User: My PC
  Date: 5/15/2023
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Youtube</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/css/fontawesome.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">
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
            <div class="border-bottom slide">
                <a href="#">
                    <img class="rounded-circle" alt="" width="100%"
                         src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/music.png?alt=media&token=b6d91a3d-2d24-487f-adb1-b4a6d9fa3c03">
                    <p class="text-center" style="color:#606060;">Music</p>
                </a>

                <a href="#">
                    <img class="rounded-circle" alt="" width="100%"
                         src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/gaming.png?alt=media&token=fc30f16e-a36b-495e-b8d0-0fc87f0caac8">
                    <p class="text-center" style="color:#606060;">Gaming</p>
                </a>

                <a href="#">
                    <img class="rounded-circle" alt="" width="100%"
                         src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/news.png?alt=media&token=2f85b6a1-1dc6-4485-b289-d79bd665e4aa">
                    <p class="text-center" style="color:#606060;">News</p>
                </a>

                <a href="#">
                    <img class="rounded-circle" alt="" width="100%"
                         src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/movies.png?alt=media&token=a53514a0-720e-4083-aba3-9f34c7c245df">
                    <p class="text-center" style="color:#606060;">Movies</p>
                </a>

            </div>

            <div class="container-fluid mt-4 pl-2">
                <a href="#">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                     alt="image" width="100%"
                                     height="138"/>
                            </div>
                            <div class="col-md-7 p-0 pt-2">
                                <div class="row">
                                    <div class="col-1 ml-2 mr-3 desc_hide">
                                        <img width="48"
                                             src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                             class="rounded-circle">
                                    </div>
                                    <div class="col-10">
                                        <p class="mb-1 title"
                                           title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
                                            Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                            Pritam, Amitabh B|Arijit Singh</p>
                                        <p class="subtitle">
                                            T-Series <i class="fas fa-check-circle"></i>
                                            70M views • 7 months ago
                                        </p>
                                        <div class="short_description">
                                            Modi Govt has announced 20 Lakh Crore Package to help the people in these
                                            times of economic slowdown and recession. It was announced on 12th May but
                                            details were released in 5 parts across
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="container-fluid mt-2 pl-2">
                <a href="#">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                     width="100%"
                                     height="138"/>
                            </div>
                            <div class="col-md-7 p-0 pt-2">
                                <div class="row">
                                    <div class="col-1 ml-2 mr-3 desc_hide">
                                        <img width="48"
                                             src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                             class="rounded-circle">
                                    </div>
                                    <div class="col-10">
                                        <p class="mb-1 title"
                                           title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
                                            Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                            Pritam,
                                            Amitabh B|Arijit Singh</p>
                                        <p class="subtitle">
                                            T-Series <i class="fas fa-check-circle"></i>
                                            70M views • 7 months ago
                                        </p>
                                        <div class="short_description">
                                            Modi Govt has announced 20 Lakh Crore Package to help the people in these
                                            times
                                            of economic slowdown and recession. It was announced on 12th May but details
                                            were released in 5 parts across
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <div class="container-fluid mt-2 pl-2">
                <a href="#">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                     alt="image" width="100%" height="138"/>
                            </div>
                            <div class="col-md-7 p-0 pt-2">
                                <div class="row">
                                    <div class="col-1 ml-2 mr-3 desc_hide">
                                        <img width="48"
                                             src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                             class="rounded-circle">
                                    </div>
                                    <div class="col-10">
                                        <p class="mb-1 title"
                                           title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
                                            Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                            Pritam,
                                            Amitabh B|Arijit Singh</p>
                                        <p class="subtitle">
                                            T-Series <i class="fas fa-check-circle"></i>
                                            70M views • 7 months ago
                                        </p>
                                        <div class="short_description">
                                            Modi Govt has announced 20 Lakh Crore Package to help the people in these
                                            times
                                            of
                                            economic slowdown and recession. It was announced on 12th May but details
                                            were
                                            released in 5 parts across
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="container-fluid mt-2 pl-2">
                <a href="#">
                    <div class="card">
                        <div class="row">
                            <div class="col-md-3">
                                <img class="main_img"
                                     src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                     alt="image" width="100%"
                                     height="138"/>
                            </div>
                            <div class="col-md-7 p-0 pt-2">
                                <div class="row">
                                    <div class="col-1 ml-2 mr-3 desc_hide">
                                        <img width="48"
                                             src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                             class="rounded-circle">
                                    </div>
                                    <div class="col-10">
                                        <p class="mb-1 title"
                                           title="Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha | Pritam, Amitabh B|Arijit Singh">
                                            Full Song: KHAIRIYAT (BONUS TRACK) | CHHICHHORE | Sushant, Shraddha |
                                            Pritam,
                                            Amitabh
                                            B|Arijit Singh</p>
                                        <p class="subtitle">
                                            T-Series <i class="fas fa-check-circle"></i>
                                            70M views • 7 months ago
                                        </p>
                                        <div class="short_description">
                                            Modi Govt has announced 20 Lakh Crore Package to help the people in these
                                            times
                                            of
                                            economic slowdown and recession. It was announced on 12th May but details
                                            were
                                            released
                                            in 5 parts across
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <!-- content Section -->

            <p><br></p>
            <p><br></p>

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
