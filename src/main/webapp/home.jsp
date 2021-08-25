<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chu</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<!-- <header class="header-area overlay"> -->
<nav class="navbar navbar-expand-md navbar-dark">
    <div class="container color">
        <a href="#" class="navbar-brand">Thư viện Nông Lâm</a>
        <button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#main-nav">
            <span class="menu-icon-bar"></span>
            <span class="menu-icon-bar"></span>
            <span class="menu-icon-bar"></span>
        </button>

        <div id="mvain-na" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li><a href="#" class="nav-item nav-link active">Trang chủ</a></li>
                <li><a href="#" class="nav-item nav-link">Giới thiệu</a></li>
                <!-- <li class="dropdown">
                        <a href="#" class="nav-item nav-link" data-toggle="dropdown">Nội quy</a>
                        <div class="dropdown-menu">
                            <a href="#" class="dropdown-item">Dropdown Item 1</a>
                            <a href="#" class="dropdown-item">Dropdown Item 2</a>
                            <a href="#" class="dropdown-item">Dropdown Item 3</a>
                        </div>
                    </li> -->
                <!-- <li class="dropdown">
                        <a href="#" class="nav-item nav-link" data-toggle="dropdown">Nội quy</a>
                        <div class="dropdown-menu">
                            <a href="#" class="dropdown-item">Dropdown Item 1</a>
                            <a href="#" class="dropdown-item">Dropdown Item 2</a>
                            <a href="#" class="dropdown-item">Dropdown Item 3</a>
                            <a href="#" class="dropdown-item">Dropdown Item 4</a>
                            <a href="#" class="dropdown-item">Dropdown Item 5</a>
                        </div>
                    </li> -->
                <li><a href="#" class="nav-item nav-link">Nội quy</a></li>
                <li><a href="#" class="nav-item nav-link">Liên hệ</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="border-img">
            <img style="border-radius: 15px;" height="300px" width="100%" src="PORTAL_DOCUMENT-IDidValue.jpg" alt="">
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="border-searchbook mt-4">
            <div class="title-searchbook">
                <h2 class="text-searchbook">Tìm sách</h2>
            </div>
            <div class="button-sb">
                <div class="row">
                    <div class="dropdown mt-4 ml-4">
                        <button class="btn btn-primary dropdown-toggle theloai" type="button"
                                data-toggle="dropdown">
                            <span class="caret">Thể loại</span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="caret-a">Tài liệu làm đồ án</a></li>
                            <li><a href="#" class="caret-a">Tài liệu chuyên nghành</a></li>
                            <li><a href="#" class="caret-a"></a></li>
                        </ul>
                    </div>
                    <input type="text" class="inputText mt-4 ml-3">
                    <button class="tim ml-4 mt-4">Tìm</button>
                </div>

            </div>

        </div>

        <div class="border-account mt-4 ml-4">
            <div class="title-account">
                <h2 class="text-account">Tài khoản thư viện</h2>
            </div>
            <c:choose>
                <c:when test="${user != null}">
                    <div style="width: 200px; position: relative; left: 30px; top: 40px;">
                        <p style="font-size: 20px">${user.userName}</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="btn-login">
                        <a href="default?page=login" class="login ml-4 mt-5">Đăng nhập</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="border-new mt-4">
            <div class="title-new">
                <h2 class="text-new">Tin tức - thông báo</h2>
            </div>

            <div class="bordernew">
                <div class="new ml-5 ">
                    <div class="row">
                        <div class="bd-img ml-4">
                            <img src="" alt="">
                        </div>
                        <div class="information">
                            <div class="title-newpaper" style="font-weight: bold;">Sinh viên có thể dkmh khi chưa thanh toán học phí</div>
                            <div class="ngaytao">05/08/2021</div>
                            <div class="noidung">Hiện nay dịch bệnh đang khó khắn, nhà trường quyết định dời thời hạn đóng học phí đến học kì I năm học 2021-2022</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<footer class="container">
    <div class="row">
        <div class="border-copyright mt-4">
            <div class="left ml-5 mt-3">
                <div class="copyright">Copyright by PDD.Company</div>
                <div class="address">Nong Lam University</div>
            </div>
            <div class="right mt-3">
                <div class="access-account">
                    <div class="title-access">Lượt truy cập hôm nay:</div>
                    <div class="amount-access">1000</div>
                </div>
                <div class="sum-access">
                    <div class="title-sum">Tổng số lượng truy cập:</div>
                    <div class="amount-access-sum">20000</div>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>

</html>