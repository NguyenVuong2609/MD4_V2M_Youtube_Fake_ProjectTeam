<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>

  <title>Create Video</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

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
      <option name="sport">Sports</option>
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