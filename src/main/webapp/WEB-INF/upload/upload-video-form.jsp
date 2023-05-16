<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

  <title>Title</title>

</head>

<body>

<form class="row g-3" method="post">
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Video Name</label>
    <input type="text" class="form-control" id="inputEmail4" name="videoName">
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">Category</label>
    <select id="inputState" class="form-select">
      <option selected>Choose...</option>
      <option name="movies">Movies</option>
      <option name="sport">Sport</option>
      <option name="news">News</option>
      <option name="kids">Kids</option>
    </select>
  </div>
  <jsp:include page='./upload-img.jsp'>
    <jsp:param name="articleId" value=""/>
  </jsp:include>
  <jsp:include page='./upload-video.jsp'>
    <jsp:param name="articleId" value=""/>
  </jsp:include>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Create</button>
  </div>
</form>

</body>

</html>