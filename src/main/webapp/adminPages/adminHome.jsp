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
	function notify(content) {
		$("#contentNoti").text(content);
		$("#notiModal").modal("show");
	}
	
	function clickNav(page, target) {
		console.log("navi page: " + page);
		// change selected
		$(".navigation > ul li").removeClass("selected");
		$(target).addClass("selected");
		// get page
		switch (page) {
		case "overviewPage":
			$.get("default?page=overview", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "getUserInfo_borrowPage":
			$.get("default?page=confirmLibraryCard&activity=borrow", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
				$("#libraryCardId").focus();
			})
			break;
		case  "getUserInfo_payPage":
			$.get("default?page=confirmLibraryCard&activity=pay", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
				$("#libraryCardId").focus();
			})
			break;
		case  "manageReaderPage":
			$.get("default?page=manageReader", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "manageBookPage":
			$.get("default?page=manageBook", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "manageStaffPage":
			$.get("default?page=manageStaff", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "configPage":
			$.get("default?page=config", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		}
	}
	
	function getUserInfo(activity) {
		console.log("libraryCardId: " + $("#libraryCardId").val() + ", activity: " + activity);
		$.post(
				"getUserInfo",
				{"libraryCardId": $("#libraryCardId").val(), "activity": activity},
				result => {
					console.log("getUserInfo: " + result);
					if (result.includes("error")) {
						notify("* Mã thẻ thư viện không hợp lệ! Vui lòng kiểm tra lại!");
					} else {
						$("#content").html("");
						$("#content").append(result);						
						$("#barcode").focus();
					}
				})
		$("#libraryCardId").val("");
	}
	
	function getUserInfo_keyEvent(event, activity) {
		console.log("key event: " + event.key + ", activity: " + activity);
		console.log("libraryCardId: " + $("#libraryCardId").val());
		if	(event.keyCode === 13 || event.which === 13) {
			console.log(event.keyCode);
			getUserInfo(activity);
		}
	}
	
	function addBook() {
		console.log("barcode: " + $("#barcode").val());
		$.post(
				"addBook",
				{"barcode": $("#barcode").val()},
				result => {
					console.log(result);
					
					const response = JSON.parse(result);
					if (response.status.includes("error")) {
						notify(response.data);
					} else {
						$("#info tbody").append(
								"<tr>" 
							+	"<td>Sẵn sàng</td>"
							+	"<td>"+ response.data.date +"</td>"
							+	"<td>"+ response.data.barcode +"</td>"
							+	"<td>"+ response.data.title +"</td>"
							+	"<td>"+ response.data.author +"</td>"
							+	"<td>"+ response.data.publisher +"</td>"
							+	"<td>"+ response.data.price +"</td>"
							+	"</tr>")
					}						
				})
	$("#barcode").val("");
	}
	
	function addBook_keyEvent(event) {
		console.log("key event: " + event.key);
		console.log("barcode: " + $("#barcode").val());
		if	(event.keyCode === 13 || event.which === 13) {
			console.log(event.keyCode);
			addBook();
		}
	}
	
	function borrowBook() {
		$.get(
				"borrowBook",
				result => {
					console.log(result);
					if (result.includes("bookError")) {
						notify("* Không thể mượn sách! Sách chưa được thêm vào hàng đợi!")
					} else if (result.includes("databaseError")) {
						notify("* Không thể mượn sách! Không thể lưu lịch sử mượn sách vào cơ sở dữ liệu!");
					} else {
						$("#content").html("");
						$("#content").append(result);	
						notify("Mượn sách thành công! Lịch sử mượn sách đã được lưu vào cơ sở dữ liệu!");
					}
				})
	}
	
	function chooseBook(barcode) {
		$.post(
			"chooseBook",
			{"barcode":barcode},
			result => {
				console.log(result);
				const response = JSON.parse(result);
				if (response.status === "error") {
					notify(response.data);
				} else {
					if ($("#" + barcode +"xyz").prop("checked") === true) {
						$("#" + barcode + " td:first-child").text("Sẵn sàng");						
					} else {
						$("#" + barcode + " td:first-child").text("Đã mượn");												
					}
				}
			})
	}
	
	function payBook() {
		$.get(
				"payBook",
				result => {
					console.log(result);
					if (result.includes("bookError")) {
						notify("* Không thể trả sách! Sách chưa được chọn vào hàng đợi!")
					} else if (result.includes("databaseError")) {
						notify("* Không thể trả sách! Không thể lưu lịch sử trả sách vào cơ sở dữ liệu!");
					} else {
						$("#content").html("");
						$("#content").append(result);	
						notify("Trả sách thành công! Lịch sử trả sách đã được lưu vào cơ sở dữ liệu!");
					}
				})
	}
	
	function cancelBorrowAndPayBook(activity) {
		$.post(
				"cancelBorrowAndPayBook",
				{"activity":activity},
				result => {
					console.log(result);
					$("#content").html("");
					$("#content").append(result);	
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
					src="adminPages/images/trangTongQuan.jpg" alt="image">
			</div>
		</div>

		<%@ include file="component/footer.jsp"%>
	</div>

	<!-- notification modal -->
	<div id="notiModal" class="modal fade bd-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="border-radius: 10px;">

				<div class="modal-header p-2">
				<div class="text-center">
					<h5
						style="font-size: 20px; font-weight: 700 !important; margin-left: 180px; margin-bottom: 0px">Thông
						báo !</h5>
				</div>
					<button type="button" class="close " data-dismiss="modal"
						aria-label="Close" style="outline: none;">
						<span aria-hidden="true"
							style="font-size: 25px; margin-right: 10px">&times;</span>
					</button>
				</div>

				<div id="contentNoti" class="font-weight-bold m-3 text-center">This is a notification!</div>

			</div>
		</div>
	</div>
</body>

</html>
