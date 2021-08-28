<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="navigation">
    <ul class="nav flex-column">
        <li class="nav-item pointer  selected" onclick="clickNav('overviewPage', this)">
            <a class="nav-link pointer">Tổng quan</a>
        </li>
        <li class="nav-item pointer" onclick="clickNav('getUserInfoPage', this)">
            <a class="nav-link" >Mượn sách</a>
        </li>
        <li class="nav-item pointer" onclick="clickNav('getUserInfoPage', this)">
            <a class="nav-link">Trả sách</a>
        </li>
        <li class="nav-item pointer" onclick="clickNav('manageReaderPage', this)">
            <a class="nav-link">Quản lý bạn đọc</a>
        </li>
        <li class="nav-item pointer" onclick="clickNav('manageBookPage', this)">
            <a class="nav-link">Quản lý sách</a>
        </li>
        <li class="nav-item pointer" onclick="clickNav('manageStaffPage', this)">
            <a class="nav-link">Quản lý nhân viên</a>
        </li>
        <li class="nav-item pointer" onclick="clickNav('configPage, this')">
            <a class="nav-link">Tham số hệ thống</a>
        </li>
    </ul>
</div>