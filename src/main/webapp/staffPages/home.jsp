<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="component/head.jsp" %>
    <style>
        .selected {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
<div class="container-xxl" style="background-color: #F5F5F5; height: 100%; padding: 0;">
    <%@ include file="component/banner.jsp" %>

    <%@ include file="component/navigation.jsp" %>

    <div class="content text-center">
        <h3 style="margin-top: 30px; color: #0C85FF;">Ngày mới an lành!</h3>
        <img style="display:block; max-width: 600px; margin: auto; margin-top: 25px;"
             src="staffPages/images/trangTongQuan.jpg" alt="image">
    </div>

    <%@ include file="component/footer.jsp" %>
</div>
<%--<script>--%>
<%--    $(".navigation > ul li").click(function () {--%>
<%--        $(this).--%>
<%--    })--%>
<%--</script>--%>
</body>

</html>
