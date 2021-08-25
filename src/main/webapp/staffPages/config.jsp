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
			<div class="title">Tham số hệ thống</div>
			
			<div class="main mt-3 d-flex flex-row  justify-content-center" style="border: 1px solid #0C85FF; border-radius: 20px;">
				<div class="left d-flex flex-row  justify-content-center">
					<div>Qui định</div>
					<div>
						
					</div>
				</div>
				<div class="right">
					<div>Lệ phí</div>
					<div>
						
					</div>
				</div>
			</div>
			
			<div class="d-flex flex-row justify-content-center mt-3">
				<button class="btn btn-primary pr-5 pl-5" style="margin-right: 80px;">Lưu</button>
				<button class="btn btn-primary pr-5 pl-5" style="margin-left: 80px;">Hủy</button>
			</div>
    </div>

    <%@ include file="component/footer.jsp" %>
</div>
</body>

</html>