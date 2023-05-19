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
                <div class="grid_title"><h3>My Channel</h3></div>
                <c:if test="${requestScope['myChannel']!=null}">
                    <div>${requestScope["myChannel"].getChannel_name()}</div>
                    <div class="row">
                        <c:forEach var="video" items='${requestScope["videoList"]}'>
                            <div class="col-md-3 col-sx-10 p-2">
                                <a href="/user?action=detail&id=${video.video_id}">
                                    <div class="card">
                                        <img src="${video.getImage()}"
                                             height="174"/>
                                        <div class="row">
                                            <div class="col-2 mt-3">
                                                <img width="40" height="40" style="border-radius: 50%"
                                                     src="${video.getChannel().getAvatar()}"
                                                     class="rounded-circle">
                                            </div>
                                            <div class="col-10 mt-3">
                                                <p class="mb-2"
                                                   title="${video.getVideo_name()}">
                                                        ${video.getVideo_name()}</p>
                                                <p style="color:#606060;">${video.getView()}
                                                    views ${video.getVideo_date()}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${requestScope['myChannel']==null}">
                    <h3>You haven't created channel yet</h3>
                </c:if>
            </c:if>
            <c:if test="${sessionScope['userLogin']==null}">
                <h3>Please login first</h3>
            </c:if>
        </div>
    </div>
    <p><br></p>
    <p><br></p>
    <p><br></p>
    <div class="col-md-2"></div>
    <div class="col-md-10">
        <!-- content section -->
        <div class="container-fluid">
            <c:if test="${sessionScope['userLogin']!=null}">
                <div class="grid_title"><h3>Subscriber</h3></div>
                <c:if test="${requestScope['myChannel']!=null}">
                    <div class="row col-md-12" style="gap: 1%">
                        <c:forEach var="subscriber" items='${requestScope["subscriberList"]}'>
                                <div class="col-md-2 card">
                                    <img src="${subscriber.getAvatar()}"
                                         width="100" height="100" style="border-radius: 50%; margin: 0 auto"/>
                                    <p style="text-align: center">${subscriber.getUsername()}</p>
                                </div>
                        </c:forEach>
                    </div>
                </c:if>
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
