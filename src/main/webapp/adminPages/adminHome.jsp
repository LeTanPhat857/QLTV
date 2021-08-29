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

.left-25px {
	left: -25px !important;
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
		case  "getUserInfo_borrowPage":
			$.get("default?page=getUserInfo&activity=borrow", result => {
				console.log(result);
				$("#content").children().remove();
				$("#content").append(result);
			})
			break;
		case  "getUserInfo_payPage":
			$.get("default?page=getUserInfo&activity=pay", result => {
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
	
	function getUserInfo(activity) {
		console.log( $("#libraryCardId").val());
		$.post(
				"getUserInfo",
				{"libraryCardId": $("#libraryCardId").val(), "activity": activity},
				result => {
					if (result.includes("error")) {
						alert("* Mã thẻ thư viện không đúng! Vui lòng kiểm tra lại!")
					} else {
						$("#content").children().remove();
						$("#content").append(result);						
					}
				})
	}
	
	function addBook() {
		console.log($("#barcode").val());
		$.post(
				"addBook",
				{"barcode": $("#barcode").val()},
				result => {
					if (result.includes("error")) {
						alert("* Mã sách không đúng! Vui lòng kiểm tra lại!")
					} else {
						const book = JSON.parse(result);
						$("#info tbody").append(
								"<tr>" 
							+	"<td>Có sẵn</td>"
							+	"<td>"+ book.date +"</td>"
							+	"<td>"+ book.barcode +"</td>"
							+	"<td>"+ book.title +"</td>"
							+	"<td>"+ book.author +"</td>"
							+	"<td>"+ book.publisher +"</td>"
							+	"<td>"+ book.price +"</td>"
							+	"</tr>")
					}						
				})
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
