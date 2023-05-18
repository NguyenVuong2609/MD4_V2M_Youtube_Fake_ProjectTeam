<%--
  Created by IntelliJ IDEA.
  User: minh
  Date: 5/15/2023
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5 px-2">

    <div class="mb-2 d-flex justify-content-between align-items-center">

        <div class="position-relative">
            <span class="position-absolute search"><i class="fa fa-search"></i></span>
            <input class="form-control w-100" placeholder="Search by order#, name...">
        </div>

        <div class="px-2">

            <span>Filters <i class="fa fa-angle-down"></i></span>
            <i class="fa fa-ellipsis-h ms-3"></i>
        </div>

    </div>
    <div class="table-responsive">
        <table class="table table-responsive table-borderless">

            <thead>
            <tr class="bg-light">
                <th scope="col" width="5%"><input class="form-check-input" type="checkbox"></th>
                <th scope="col" width="5%">#</th>
                <th scope="col" width="20%">Date</th>
                <th scope="col" width="10%">Status</th>
                <th scope="col" width="20%">Customer</th>
                <th scope="col" width="20%">Purchased</th>
                <th scope="col" class="text-end" width="20%"><span>Revenue</span></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row"><input class="form-check-input" type="checkbox"></th>
                <td>12</td>
                <td>1 Oct, 21</td>
                <td><i class="fa fa-check-circle-o green"></i><span class="ms-1">Paid</span></td>
                <td><img src="https://i.imgur.com/VKOeFyS.png" width="25"> Althan Travis</td>
                <td>Wirecard for figma</td>
                <td class="text-end"><span class="fw-bolder">$0.99</span> <i class="fa fa-ellipsis-h  ms-2"></i></td>
            </tr>

            <tr>
                <th scope="row"><input class="form-check-input" type="checkbox"></th>
                <td>14</td>
                <td>12 Oct, 21</td>
                <td><i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1">Failed</span></td>
                <td><img src="https://i.imgur.com/nmnmfGv.png" width="25"> Tomo arvis</td>
                <td>Altroz furry</td>
                <td class="text-end"><span class="fw-bolder">$0.19</span> <i class="fa fa-ellipsis-h  ms-2"></i></td>
            </tr>


            <tr>
                <th scope="row"><input class="form-check-input" type="checkbox"></th>
                <td>17</td>
                <td>1 Nov, 21</td>
                <td><i class="fa fa-check-circle-o green"></i><span class="ms-1">Paid</span></td>
                <td><img src="https://i.imgur.com/VKOeFyS.png" width="25"> Althan Travis</td>
                <td>Apple Macbook air</td>
                <td class="text-end"><span class="fw-bolder">$1.99</span> <i class="fa fa-ellipsis-h  ms-2"></i></td>
            </tr>


            <tr>
                <th scope="row"><input class="form-check-input" type="checkbox"></th>
                <td>90</td>
                <td>19 Oct, 21</td>
                <td><i class="fa fa-check-circle-o green"></i><span class="ms-1">Paid</span></td>
                <td><img src="https://i.imgur.com/VKOeFyS.png" width="25"> Travis head</td>
                <td>Apple Macbook Pro</td>
                <td class="text-end"><span class="fw-bolder">$9.99</span> <i class="fa fa-ellipsis-h  ms-2"></i></td>
            </tr>


            <tr>
                <th scope="row"><input class="form-check-input" type="checkbox"></th>
                <td>12</td>
                <td>1 Oct, 21</td>
                <td><i class="fa fa-check-circle-o green"></i><span class="ms-1">Paid</span></td>
                <td><img src="https://i.imgur.com/nmnmfGv.png" width="25"> Althan Travis</td>
                <td>Wirecard for figma</td>
                <td class="text-end"><span class="fw-bolder">$0.99</span> <i class="fa fa-ellipsis-h  ms-2"></i></td>
            </tr>
            </tbody>
        </table>

    </div>

</div>
</body>
</html>
