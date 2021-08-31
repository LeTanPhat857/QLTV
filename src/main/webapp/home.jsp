<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chu</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">

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
				<div class="title-searchbook  font-weight-bold">
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
				<div class="title-account  font-weight-bold">
					<h2 class="text-account">Tài khoản thư viện</h2>
				</div>
				<c:choose>
					<c:when test="${user != null}">
						<div class="dropdown"
							style="width: 200px; position: relative; left: 30px; top: 35px;">
							<button class="btn" type="button" id="dropdownMenuButton"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span style="font-size: 20px">${user.name}</span>
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
			<div class="border-new mt-4"
				style="width: 100%; height: 100%; border: 1px solid #3486e2; border-radius: 20px;">
				<div class="font-weight-bold ml-5 mt-4"
					style="width: 200px; border-bottom: 1px solid #3486e2;">
					<h2 class="text-new">Tin tức - thông báo</h2>
				</div>

				<div id="newsList">
					<c:forEach var="news" items="${newsList}">
						<div class="m-5 p-3"
							style="border: 1px solid #3486e2; border-radius: 20px;">
							<div class="row ml-5">
								<div class="" style="border: 1px solid #3486e2;">
									<img style="width: 100px; height: 110px;" src="${news.imgLink}"
										alt="">
								</div>
								<div class="ml-5">
									<div class="font-weight-bold" style="">${news.title}</div>
									<div class="">
										<fmt:formatDate pattern="dd/MM/yyyy"
											value="${news.createdDate}" />
									</div>
									<div class="">${news.content}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<div style="" class="d-flex justify-content-end pr-5">
					<nav aria-label="...">
						<ul class="font-weight-bold pagination pagination-lg">
							<li id="previousNews" class="page-item disabled"><a
								class="page-link" onclick="getNewsList('previous')"
								style="cursor: pointer">Trước</a></li>

							<li class="page-item"><input id="newsPage" value="1"
								size="1" maxlength="2" onkeypress="getNewsList_keyEvent()"
								class="font-weight-bolder page-link text-center" /></li>

							<li id="nextNews" class="page-item"><a class="page-link"
								onclick="getNewsList('next')" style="cursor: pointer">Sau</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<script>
	function getNewsList_keyEvent() {
		if	(event.keyCode === 13 || event.which === 13) {
			console.log(event.keyCode);
			getNewsList('current');
		}
	}
	
	function getNewsList(activity) {
		var page = parseInt($("#newsPage").val());
		
		if (activity === "previous") {
			page = parseInt($("#newsPage").val()) - 1;
		}
		
		if (activity === "next") {
			page = parseInt($("#newsPage").val()) + 1;
		}
		
		$.post(
				"getNewsList",
				{"page":page},
				result => {
					console.log(result);
					
					if (result === "error") {
						alert("* Đã có lỗi xảy ra! Vui lòng kiểm tra lại!")
					}  else if (result === "out") {
						alert("* Đã hết tin tức! Không thể tải thêm!");
					} else {
						$("#newsList").html("");
						$("#newsList").append(result);
						
						$("#newsPage").val(page);
						$("#previousNews").removeClass("disabled");
						
						if ($("#newsPage").val() == 1) {
							$("#previousNews").addClass("disabled");
						}
					}
				})
	}
</script>


	<footer class="container">
		<div class="row">
			<div class="border-copyright mt-4 p-2"
				style="color: azure; height: 70px;">
				<div class="d-flex flex-column justify-content-around left ml-5"
					style="height: auto">
					<div class="address" style="height: auto">Nong Lam University</div>
					<div class="copyright" style="height: auto; font-size: 18px">Copyright
						by LTP.Company</div>
				</div>
				<div
					class="d-flex flex-column font-italic font-weight-light justify-content-around ml-5 right"
					style="height: auto">
					<div class="access-account" style="height: auto">
						<div class="title-access">Lượt truy cập hôm nay: 1000</div>
					</div>
					<div class="sum-access" style="height: auto">
						<div class="title-sum">Tổng số lượng truy cập: 20000</div>
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
						<span aria-hidden="true"
							style="font-size: 20px; margin-right: 10px">&times;</span>
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
	<form method="post" action="" id="loginForm" class="d-none"></form>
	<script>
        $('#loginButton').click(function () {
            $.post(
                'login',
                {libraryCardId: $('#libraryCardId').val(), password: $('#password').val()},
                result => {
                    console.log(result);
                    if (result === "error") {
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
						<span aria-hidden="true"
							style="font-size: 20px; margin-right: 10px">&times;</span>
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
	<form method="post" action="" id="forgetPassForm" class="d-none"></form>
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