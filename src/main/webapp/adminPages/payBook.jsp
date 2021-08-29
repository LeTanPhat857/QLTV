<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div class="content">
	<div class="title">Mượn sách</div>

	<div class="d-flex flex-row justify-content-around"
		style="padding: 15px;">
		<div class="info d-flex flex-row justify-content-center p-2"
			style="width: 55%; border: 1px solid #0C85FF; border-radius: 20px;">
			<img src="images/trangTongQuan.jpg" alt="image"
				style="width: 150px; height: 200px; margin-right: 80px;">
			<div class="d-flex flex-column justify-content-around font-weight-bold">
				<span>Họ và tên: ${reader.userName}</span> 
				<span>Mã thẻ: ${reader.libraryCardId}</span>
				<span>CMND: ${reader.cmnd}</span> 
				<span>Ngày sinh: ${reader.birthday}</span> 
				<span>Giới tính: ${reader.gender}</span>
				<span>Trạng thái: ${readerStatus.status}</span>
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
		<p class="font-weight-bold">Thông tin trả (thời gian, mã số sách,
			tên sách, tác giả, nhà xuất bản, lần tái bản, phí phạt trễ hạn)</p>
		<p class="font-weight-bold">8:42:41 5/5/2021, 12316546, Java core,
			Bill Gate, Kim Đồng, 8, 0VND</p>
		<p class="font-weight-bold">8:42:41 5/5/2021, 12316546, Java core,
			Bill Gate, Kim Đồng, 8, 0VND</p>
		<p class="font-weight-bold">*Lưu ý: Nếu sách không thể trả thì
			thông báo</p>
	</div>

	<div class="d-flex flex-row justify-content-center mt-3">
		<button class="btn btn-primary pr-5 pl-5" style="margin-right: 80px;">Trả
			sách</button>
		<button class="btn btn-primary pr-5 pl-5" style="margin-left: 80px;">Hủy</button>
	</div>
</div>