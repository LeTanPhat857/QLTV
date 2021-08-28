<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chu</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/style.css">
</head>

<body style="">
	<!-- <header class="header-area overlay"> -->
	<nav class="navbar navbar-expand-md navbar-dark" style="z-index: 0;">
		<div class="container color">
			<a href="#" class="navbar-brand">Thư viện Nông Lâm</a>
			<button type="button" class="navbar-toggler collapsed"
				data-toggle="collapse" data-target="#main-nav">
				<span class="menu-icon-bar"></span> <span class="menu-icon-bar"></span>
				<span class="menu-icon-bar"></span>
			</button>

			<div id="mvain-na" class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto ">
					<c:choose>
						<c:when test="${user != null && user.roleId != 1}">
							<li class="mr-3"><a href="default?page=adminHome"
								class="nav-item nav-link active">Trang chủ</a></li>
						</c:when>
						<c:otherwise>
							<li class="mr-3"><a href="#"
								class="nav-item nav-link active">Trang chủ</a></li>
						</c:otherwise>
					</c:choose>
					<li class="mr-3"><a href="#" class="nav-item nav-link">Giới
							thiệu</a></li>
					<li class="mr-3"><a href="#" class="nav-item nav-link">Nội
							quy</a></li>
					<li class="mr-3"><a href="#" class="nav-item nav-link">Liên
							hệ</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<div class="border-img" style="height: auto; margin-top: 15px;">
				<img style="border-radius: 15px;" width="100%; margin-bottom: 15px"
					src="images/home/NongLamLibrary.jpg" alt="">
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row justify-content-between">
			<div class="border-searchbook mt-4">
				<div class="title-searchbook">
					<h2 class="text-searchbook">Tìm sách</h2>
				</div>
				<div class="button-sb">
					<div class="row">
						<div class="dropdown mt-4 ml-4">
							<button class="btn btn-primary dropdown-toggle theloai"
								type="button" data-toggle="dropdown">
								<span class="caret">Thể loại</span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="#" class="caret-a">Tài liệu làm đồ án</a></li>
								<li><a href="#" class="caret-a">Tài liệu chuyên nghành</a></li>
								<li><a href="#" class="caret-a"></a></li>
							</ul>
						</div>
						<input type="text" class="inputText mt-4 ml-3"
							style="border: solid 2px rgb(95, 186, 233) !important; box-shadow: none !important">
						<button style="outline: none;" class="tim mt-4 caret">Tìm</button>
					</div>
				</div>
			</div>

			<div class="border-account mt-4 ml-4">
				<div class="title-account">
					<h2 class="text-account">Tài khoản thư viện</h2>
				</div>
				<c:choose>
					<c:when test="${user != null}">
						<div class="dropdown"
							style="width: 200px; position: relative; left: 30px; top: 40px;">
							<button class="btn" type="button" id="dropdownMenuButton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span style="font-size: 20px">${user.userName}</span>
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#"><span
									style="font-size: 16px">Thông tin tài khoản</span></a> <a
									class="dropdown-item" href="#"><span
									style="font-size: 16px">Thông tin mượn sách</span></a> <a
									class="dropdown-item" href="/QLTV/logout"><span
									style="font-size: 16px">Đăng xuất</span></a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div data-toggle="modal" data-target="#loginModal"
							class="btn-login"
							style="cursor: pointer; width: 125px !important">
							<a class="login ml-4 mt-5 caret">Đăng nhập</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="border-new mt-4 mb-3"
				style="height: 100%; padding-bottom: 40px;">
				<div class="title-new">
					<h2 class="text-new">Tin tức - thông báo</h2>
				</div>

				<div class="bordernew mb-4">
					<div class="new ml-5 ">
						<div class="row">
							<div class="bd-img ml-4">
								<img src="" alt="">
							</div>
							<div class="information">
								<div class="title-newpaper" style="font-weight: bold;">Sinh
									viên có thể dkmh khi chưa thanh toán học phí</div>
								<div class="ngaytao">05/08/2021</div>
								<div class="noidung">Hiện nay dịch bệnh đang khó khắn, nhà
									trường quyết định dời thời hạn đóng học phí đến học kì I năm
									học 2021-2022</div>
							</div>
						</div>
					</div>
				</div>

				<div class="bordernew mb-4">
					<div class="new ml-5 ">
						<div class="row">
							<div class="bd-img ml-4">
								<img src="" alt="">
							</div>
							<div class="information">
								<div class="title-newpaper" style="font-weight: bold;">Sinh
									viên có thể dkmh khi chưa thanh toán học phí</div>
								<div class="ngaytao">05/08/2021</div>
								<div class="noidung">Hiện nay dịch bệnh đang khó khắn, nhà
									trường quyết định dời thời hạn đóng học phí đến học kì I năm
									học 2021-2022</div>
							</div>
						</div>
					</div>
				</div>


				<div class="bordernew mb-4">
					<div class="new ml-5 ">
						<div class="row">
							<div class="bd-img ml-4">
								<img src="" alt="">
							</div>
							<div class="information">
								<div class="title-newpaper" style="font-weight: bold;">Sinh
									viên có thể dkmh khi chưa thanh toán học phí</div>
								<div class="ngaytao">05/08/2021</div>
								<div class="noidung">Hiện nay dịch bệnh đang khó khắn, nhà
									trường quyết định dời thời hạn đóng học phí đến học kì I năm
									học 2021-2022</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<footer class="container">
		<div class="row">
			<div class="border-copyright mt-4 p-2" style="color: azure;">
				<div class="left ml-5 mt-3">
					<div class="copyright">Copyright by LTP.Company</div>
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


	<!-- Login modal -->
	<div id="loginModal" class="modal fade bd-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="border-radius: 15px;">

				<div class="modal-header">
					<h5
						style="font-size: 20px; font-weight: 700 !important; margin-left: 187px; margin-bottom: 0px">Đăng
						nhập</h5>
					<button type="button" class="close " data-dismiss="modal"
						aria-label="Close" style="outline: none;">
						<span aria-hidden="true" style="font-size: 20px">&times;</span>
					</button>
				</div>

				<form action="" method="post"
					class="d-flex flex-column align-items-center">
					<input type="text" name="libraryCardId" id="libraryCardId"
						style="border: solid 2px rgb(95, 186, 233) !important; box-shadow: none !important"
						class="fadeIn second mt-5" placeholder="Nhập mã thẻ thư viện">
					<input type="password" name="password" id="password"
						style="border: solid 2px rgb(95, 186, 233) !important; box-shadow: none !important"
						class="fadeIn third" placeholder="Nhập mật khẩu"> <input
						id="loginButton" type="button"
						class="fadeIn fourth loginButton mb-4 mt-5 btn btn-primary"
						style="font-size: 20px" value="Đăng nhập">
				</form>

				<div class="formFooter">
					<a id="forgetPassButton" style="cursor: pointer"
						class="underLineHover">Quên mật khẩu ?</a>
				</div>

			</div>
		</div>
	</div>
	<!-- Login script -->
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

	<!-- ForgetPass modal -->
	<div id="forgetPassModal" class="modal fade bd-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="border-radius: 15px;">

				<div class="modal-header">
					<h5
						style="font-size: 20px; font-weight: 700 !important; margin-left: 160px; margin-bottom: 0px">Quên
						mật khẩu ?</h5>
					<button type="button" class="close " data-dismiss="modal"
						aria-label="Close" style="outline: none;">
						<span aria-hidden="true" style="font-size: 20px">&times;</span>
					</button>
				</div>

				<form action="" method="post"
					class="d-flex flex-column align-items-center">
					<input type="text" name="email" id="email"
						style="border: solid 2px rgb(95, 186, 233) !important; box-shadow: none !important"
						class="fadeIn second mt-5" placeholder="Nhập email của bạn">
					<input id="forgetPass" type="button"
						class="fadeIn fourth loginButton mb-4 mt-5 btn btn-primary"
						style="font-size: 20px" value="Quên mật khẩu">
				</form>

			</div>
		</div>
	</div>
	<!-- ForgetPass scipt -->
	<form method="post" action="" id="forgetPassForm" hidden></form>
	<script>
        $('#forgetPassButton').click(function () {
        	$("#loginModal").modal("hide");
        	setTimeout(() => {
        		$("#forgetPassModal").modal("show");
			}, 800);
      })
      
      $('#forgetPass').click(function () {
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