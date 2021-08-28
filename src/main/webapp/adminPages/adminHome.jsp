<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="component/head.jsp"%>

<style>
.selected {
	background-color: #CCE6FF !important;
}

.pointer {
	cursor: pointer !important;
}
</style>
<script>
	function clickNav(page, target) {
		$(".navigation > ul li").removeClass("selected");
		$(target).addClass("selected");
		console.log(page);
		
		switch (page) {
		case "overviewPage":
			$.get("default?page=overview", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		case  "getUserInfoPage":
			$.get("default?page=getUserInfo", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		case  "manageReaderPage":
			$.get("default?page=manageReader", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		case  "manageBookPage":
			$.get("default?page=manageBook", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		case  "manageStaffPage":
			$.get("default?page=manageStaff", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		case  "configPage":
			$.get("default?page=config", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		}		
	}
</script>
</head>

<body>
	<div class="container-xxl"
		style="background-color: #F5F5F5; height: 100%; padding: 0;">
		<%@ include file="component/banner.jsp"%>

		<%@ include file="component/navigation.jsp"%>

		<div id="content">
			<div class="text-center content">
				<h3 style="margin-top: 30px; color: #0C85FF;">Ngày mới an lành!</h3>
				<img
					style="display: block; max-width: 600px; margin: auto; margin-top: 25px;"
					src="staffPages/images/trangTongQuan.jpg" alt="image">
			</div>
		</div>

		<%@ include file="component/footer.jsp"%>
	</div>
</body>

</html>
