<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/18/2023
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
  <style>
  </style>
</head>
<body>
<div class="container">
  <div class="col-12" style="margin-top: 20px">
    <div class="row">
      <c:forEach items="${videoDetail}" var="video">
        <div class="colum">
          <div class="card">
            <img  src="${video.image}" alt="">
            <b>${video.video_name}</b>
          </div>
        </div>
      </c:forEach>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <c:if test="${pageNumber != 1}">
          <li class="page-item"><a class="page-link" href="/category?action=page_grid&page=${pageNumber-1}">Previous</a>
          </li>
        </c:if>
        <c:forEach begin="1" end="${sumOfPage}" var="i" varStatus="red">
          <c:choose>
            <c:when test="${pageNumber eq i}">
              <li class="page-item"><a style="color: red" class="page-link" href="/category?action=page_grid&page=${i}">${i}</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a  class="page-link" href="/category?action=page_grid&page=${i}">${i}</a></li>
            </c:otherwise>
          </c:choose>

        </c:forEach>
        <c:if test="${pageNumber lt sumOfPage}">
          <li class="page-item"><a href="/category?action=page_gid&page=${pageNumber + 1}">Next</a></li>
        </c:if>
      </ul>
    </nav>
  </div>
</div>
</body>
</html>
