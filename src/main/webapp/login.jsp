<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .loginButton {
            background-color: #2783cf;
            border: none;
            color: white;
            padding: 15px 80px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13px;
            -webkit-box-shadow: 0 10px 30px 0 rgb(95 186 233);
            box-shadow: 0 10px 30px 0 rgb(95 186 233);
            border-radius: 7px;
            margin: 5px 20px 10px 20px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }
    </style>
</head>
<body>
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
    <div class="wrapper fadeInDown">
        <div id="formContent">
            <div class="fadeIn first">
               <h3>Đăng nhập</h3>
             
            </div>
            <form action="" method="post">
                <input type="text" name="libraryCardId" id="libraryCardId" class="fadeIn second" placeholder="Nhập mã thẻ thư viện">
                <input type="password" name="password" id="password" class="fadeIn third" placeholder="Nhập mật khẩu">
                <input id="loginButton" type="button" class="fadeIn fourth loginButton" value="Đăng nhập">
            </form>
            <div id="formFooter">
                <a href="default?page=forgetPassword" class="underLineHover">Quên mật khẩu ?</a>
            </div>
        </div>
    </div>
     
    <footer class="container">
        <div class="row">
            <div class="border-copyright mt-4">
                <div class="left ml-5 mt-3">
                    <div class="copyright">Copyright by PDD.Company</div>
                    <div class="address">HCM City</div>
                </div>
                <div class="right mt-3">
                    <div class="access-account">
                        <div class="title-access">Lượt truy cập hôm nay: </div>
                        <div class="amount-access">1000</div>
                    </div>
                    <div class="sum-access">
                        <div class="title-sum">Tổng số lượng truy cập: </div>
                        <div class="amount-access-sum">20000</div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
    <form method="post" action="" id="loginForm" hidden></form>
    <script>
        $('#loginButton').click(function () {
            $.post(
                'login',
                {libraryCardId: $('#libraryCardId').val(), password: $('#password').val()},
                result => {
                    console.log(result);
                    if (result.includes("Error")) {
                        alert("* Sai thông tin đăng nhập! Vui lòng nhập lại!");
                    } else {
                        $('#loginForm').attr('action', result).submit();
                    }
            })
        })
    </script>
</body>
</html>