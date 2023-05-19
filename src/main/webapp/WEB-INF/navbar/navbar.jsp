<%--
  Created by IntelliJ IDEA.
  User: My PC
  Date: 5/15/2023
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <style>
        .userLogin img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .navbar-brand {
            text-decoration: none;
            color: #000;
            font-weight: 700;
        }

        .modal {
            font-family: 'Quicksand', sans-serif;
        }

        .close:focus {
            outline: 1px dotted #fff !important;
        }

        .modal-body {
            padding: 0rem !important;
        }

        .modal-title {
            color: #fff;
        }

        .modal-header {
            background: #e1251d;
            color: #fff !important;
        }

        .bi-x {
            color: #fff;
        }

        .heading {
            font-weight: 500 !important;
        }

        .subheadings {
            font-size: 12px;
            color: #e1251d;
        }

        .dots {
            height: 10px;
            width: 10px;
            background-color: green;
            border-radius: 50%;
            display: inline-block;
            margin-right: 5px;
        }

        .gallery img {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<!-- Top navbar -->
<nav class="container-fluid fixed-top bg-white pt-2" id="top_nav">
    <div class="row">
        <div class="col-4 pl-4">
            <a class="navbar-brand" href="/"><img
                    src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/logo.png?alt=media&token=ea07d5cc-ec42-4e5e-839c-22b6558e49ae"
                    width="10%"><span> MeTUBE</span></a>
        </div>
        <div class="col-4">
            <form action="/video?action=search" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control search" placeholder="Search" name="search">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-outline-secondary" data-toggle="tooltip"
                                data-placement="bottom" title="Search!"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-4 text-right">
            <c:if test='${sessionScope["userLogin"]==null}'>
                <a href="/user?action=login" class="btn btn-outline-primary"><i class="fas fa-user-circle"
                                                                                style="font-size: 20px;"></i> <span
                        style="font-size:14px; font-weight: 600;">SIGN IN</span></a>
                <a href="/user?action=register" class="btn btn-outline-primary"><i class="fas fa-user-circle"
                                                                                   style="font-size: 20px;"></i> <span
                        style="font-size:14px; font-weight: 600;">SIGN UP</span></a>
            </c:if>
            <c:if test='${sessionScope["userLogin"]!=null}'>
                <div class="userLogin">
                    <div class="dropdown show">
                        <img src='${sessionScope["userLogin"].getAvatar()}'>
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                ${sessionScope["userLogin"].getName()}
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <button type="button" class="btn btn-danger" data-toggle="modal"
                                    data-target="#exampleModal" style="width: 100%">Account Information
                            </button>
                            <c:if test='${sessionScope["userLogin"].getChannel()== null}'>
                                <a class="dropdown-item" href="/channel?action=create">Create your channel</a>
                            </c:if>
                            <c:if test='${sessionScope["userLogin"].getChannel()!= null}'>
                                <a class="dropdown-item" href="/video?action=create">Create Video</a>
                                <c:if test="${sessionScope['userLogin'].getChannel().isStatus() == false}">
                                    <a class="dropdown-item" href="/user?action=active">Active Money Earning</a>
                                </c:if>
                                <c:if test="${sessionScope['userLogin'].getChannel().isStatus() == true}">
                                    <a class="dropdown-item" href="/user?action=active">Deactivate Money Earning</a>
                                </c:if>
                            </c:if>
                            <a class="dropdown-item" href="/playlist?action=create">Create Playlist</a>
                            <a class="dropdown-item" href="/user?action=logout">Log out</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</nav>
<!-- Top navbar -->

<!-- mobile top navbar -->
<nav class="container-fluid fixed-top bg-white pt-3" id="top_nav_mobile">
    <div class="row">
        <div class="col-3 pl-4">
            <a class="navbar-brand" href="../../index.jsp"><img
                    src="https://firebasestorage.googleapis.com/v0/b/giangvan-248ea.appspot.com/o/logo.png?alt=media&token=ea07d5cc-ec42-4e5e-839c-22b6558e49ae"
                    class="mb-2" width="10%"></a>
        </div>
        <div class="col-7">
            <form>
                <div class="input-group mb-3">
                    <input type="text" class="form-control search" placeholder="Search">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" data-toggle="tooltip" data-placement="bottom"
                                title="Search!"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-2 text-right">
            <a href="login.html"><i class="fas fa-user-circle" style="font-size: 30px;"></i></a>
        </div>
    </div>
</nav>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<!-- mobile top navbar -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Account Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                  fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg></span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row g-0">
                    <div class="col-md-8 border-right">
                        <div class="status p-3">
                            <table class="table table-borderless">
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">MeTube Earn Money Ability</span>
                                            <span class="subheadings">${sessionScope['userLogin'].getChannel().isStatus() == true ? "Activate" :"Inactivate"}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Time Created</span>
                                            <span class="subheadings">5:00PM 19-03-2023</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Rank</span>
                                            <span class="subheadings"><i class="dots"></i> User</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">About</span>
                                            <span class="subheadings">Coder</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Name</span>
                                            <span class="subheadings">${sessionScope['userLogin'].getName()}</span>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Contact</span>
                                            <span class="subheadings">Ha Noi, Viet Nam</span>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Mobile Phone</span>
                                            <span class="subheadings">0988686789</span>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Direction</span>
                                            <span class="d-block subheadings">Get direction by using</span>
                                            <span class="d-flex flex-row">
                                        <img src="https://img.icons8.com/color/100/000000/google-maps.png"
                                             class="rounded" width="30"/>
                                        <img src="https://img.icons8.com/color/100/000000/pittsburgh-map.png"
                                             class="rounded" width="30"/>
                                    </span>

                                        </div>
                                    </td>

                                    <td colspan="2">
                                        <div class="d-flex flex-column">
                                            <span class="heading d-block">Achievements</span>
                                            <span class="d-flex flex-row gallery">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/vuongcuti-6ce58.appspot.com/o/ach1.png?alt=media&token=54db746c-fa45-42d7-a6e2-b9656f9b2cd7"
                                             width="50" class="rounded">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/vuongcuti-6ce58.appspot.com/o/ach2.png?alt=media&token=f0451951-b166-4d64-860b-50f9046d101d"
                                             width="50" class="rounded">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/vuongcuti-6ce58.appspot.com/o/ach3.jpg?alt=media&token=9131627a-f043-426b-817c-4d959d79a27e"
                                             width="50" class="rounded">
                                    </span>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="p-2 text-center">
                            <div class="profile">
                                <a href="/user?action=avatar">
                                    <img src="${sessionScope['userLogin'].getAvatar()}"
                                         style="width: 140px; height: 140px"
                                         class="rounded-circle img-thumbnail">
                                </a>
                                <span class="d-block mt-3 font-weight-bold">${sessionScope['userLogin'].getName()}</span>
                            </div>
                            <div class="about-doctor">
                                <table class="table table-borderless">
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <span class="heading d-block">Age:</span>
                                                <span class="subheadings">25</span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex flex-column">
                                                <span class="heading d-block">Nationality</span>
                                                <span class="subheadings">Viet Nam</span>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Toasts--%>

</body>

</html>
