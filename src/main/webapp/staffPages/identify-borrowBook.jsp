<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="component/head.jsp" %>
</head>

<body>
<div class="container-xxl" style="background-color: #F5F5F5; height: 100%; padding: 0;">
    <%@ include file="component/banner.jsp" %>

    <%@ include file="component/navigation.jsp" %>

    <div class="content">
        <div class="title">Xác nhận thẻ thư viện</div>

        <div class="form">
            <form action="getUserInfo" method="post">
                <input name="libraryCardId" type="text" required placeholder="Nhập mã số thẻ thư viện"  style="width: 100%; margin-bottom: 20px;">
                <button type="submit" class="btn btn-primary" style="display:block; margin: auto;">Xác nhận</button>
            </form>
        </div>
    </div>

    <%@ include file="component/footer.jsp" %>
</div>
</body>

</html>