<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="component/head.jsp"%>
</head>

<body>
	<div class="container-xxl"
		style="background-color: #F5F5F5; height: 100%; padding: 0;">
		<%@ include file="component/banner.jsp"%>

		<%@ include file="component/navigation.jsp"%>

		<div class="content">
			<div class="title">Mượn sách</div>

			<div class="d-flex flex-row justify-content-around"
				style="padding: 15px;">
				<div class="info d-flex flex-row justify-content-center p-2"
					style="width: 55%; border: 1px solid #0C85FF; border-radius: 20px;">
					<img src="images/trangTongQuan.jpg" alt="image"
						style="width: 150px; height: 200px; margin-right: 80px;">
					<div class="d-flex flex-column justify-content-around">
						<span>Ho va ten</span> <span>Ngay thang nam sinh</span> <span>Gioi
							tinh</span> <span>CMND</span> <span>Ma so the</span> <span>Tinh
							trang the ok</span>
					</div>
				</div>

				<div class="addBook p-2"
					style="width: 40%; height: 218px; border: 1px solid #0C85FF; border-radius: 20px;">
					<form action="" style="margin-top: 35px;">
						<input type="text" placeholder="Nhập mã số thẻ thư viện"
							style="width: 100%; margin-bottom: 20px;">
						<button class="btn btn-primary"
							style="display: block; margin: auto;">Thêm sách</button>
					</form>
				</div>
			</div>

			<div
				style="display: block; margin: auto; width: 95%; border: 1px solid #0C85FF; border-radius: 20px; padding: 10px;">
				<p class="font-weight-bold">Thông tin mượn (thời gian, mã số
					sách, tên sách, tác giả, nhà xuất bản, lần tái bản, số tiền cọc)</p>
				<p class="font-weight-bold">8:42:41 5/5/2021, 12316546, Java
					core, Bill Gate, Kim Đồng, 8, 0VND</p>
				<p class="font-weight-bold">8:42:41 5/5/2021, 12316546, Java
					core, Bill Gate, Kim Đồng, 8, 0VND</p>
				<p class="font-weight-bold">*Lưu ý: Nếu sách không thể mượn thì
					thông báo</p>
			</div>

			<div class="d-flex flex-row justify-content-center mt-3">
				<button class="btn btn-primary pr-5 pl-5"
					style="margin-right: 80px;">Mượn sách</button>
				<button class="btn btn-primary pr-5 pl-5" style="margin-left: 80px;">Hủy</button>
			</div>
		</div>

		<%@ include file="component/footer.jsp"%>
	</div>
</body>

</html>