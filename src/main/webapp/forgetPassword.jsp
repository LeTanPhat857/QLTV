<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request to change password</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
    <div id="forgetPass">
        <div class="form-forgetPass">
            <div class="title-forgetPass">
                <h3>Quên mật khẩu</h3>
            </div>
            <form id="forgetPassForm" method="post" action="" >
                <input id="email" type="text" class="input-forgetPass" name="forgetPass" placeholder="Nhập email của bạn" >
               <!-- <input type="submit" class="btn-forgetPass" value="Xác nhận"> -->
               <div id="forgetPassButton" class="btn-accept" style="cursor: pointer">
                   <a class="accept">Xác nhận</a>
               </div>
            </form>
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
<%--    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>--%>
<%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>--%>

    <script>
        $('#forgetPassButton').click(function () {
            $.post(
                'forgetPassword',
                {email: $('#email').val()},
                result => {
                    console.log(result);
                    alert(result);
                })
        })
    </script>
</body>
</html>