<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Youtube</title>
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

            <a href="/category">=======   CATEGORY   =======</a>

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
                                        <img width="48"
                                             src="${video.channel.getAvatar()}"
                                             class="rounded-circle">
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

                <hr>

                <!-- Trending Section -->
                <div class="container-fluid">
                    <div class="grid_title">Trending</div>
                    <div class="row">
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-3 p-2">
                            <a href="">
                                <div class="card">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/mancity.jpg?alt=media&token=04439fab-f8fc-40b9-a45c-d61e751baab6"
                                         alt="image" height="174"/>
                                    <div class="row">
                                        <div class="col-2 mt-3">
                                            <img width="48"
                                                 src="https://yt3.ggpht.com/a-/AOh14GinKFFtcXMMwrPfhFbie8tgLV0vMzfvVFSMlw=s68-c-k-c0x00ffffff-no-rj-mo"
                                                 class="rounded-circle">
                                        </div>
                                        <div class="col-10 mt-3">
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

                                    </div>
                                </div>
                            </a>
                        </div>
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
        </script></div></div>
</body>
</html>