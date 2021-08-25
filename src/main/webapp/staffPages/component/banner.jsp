<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="top-banner">
    <h5>Phần mềm quản lý thư viện</h5>
</div>

<div class="bottom-banner d-flex justify-content-between">
    <div class="home text-decoration-none">
        <a href="../home.jsp" style="color: white;" class="text-decoration-none">Trang chủ</a>
    </div>

    <div class="account">
        <div class="dropdown">
            <a style="color: white;" class="text-decoration-none" type="button" id="dropdownMenuButton1"
               data-toggle="dropdown" aria-expanded="false">
                Xin chào, ${user.userName}
            </a>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="#">Tài khoản</a></li>
                <li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li>
                <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
            </ul>
        </div>
    </div>
</div>
