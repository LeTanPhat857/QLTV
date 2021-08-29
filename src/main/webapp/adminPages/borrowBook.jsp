<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content" style="padding-top: 5px">
	<div class="title">Mượn sách</div>

	<div class="d-flex flex-row justify-content-around"
		style="padding: 15px;">
		<div class="info d-flex flex-row justify-content-center p-2"
			style="width: 55%; border: 1px solid #0C85FF; border-radius: 20px;">
			<img src="images/user/0.jpeg" alt="image"
				style="width: 150px; height: 200px; margin-right: 80px;">
			<div
				class="d-flex flex-column justify-content-around font-weight-bold">
				<span>Họ và tên: ${reader.name}</span> <span>Mã thẻ:
					${reader.libraryCardId}</span> <span>CMND: ${reader.CMND}</span> <span>Ngày
					sinh: ${reader.birthday}</span> <span>Giới tính: ${reader.gender}</span> <span>Trạng
					thái thẻ: ${readerStatus.status}</span>
			</div>
		</div>

		<div class="addBook d-flex"
			style="width: 40%; height: 218px; border: 1px solid #0C85FF; border-radius: 20px;">
			<form style="width: 90%; margin: auto;">
				<input id="barcode" type="text" placeholder="Nhập mã sách"
					style="width: 100%; margin-bottom: 20px; border: solid 2px rgb(95, 186, 233); outline: none; padding: 5px">
				<button type="button" class="btn btn-primary" onclick="addBook()"
					style="display: block; margin: auto;">Thêm sách</button>
			</form>
		</div>
	</div>

	<div id="info"
		style="display: block; margin: auto; width: 95%; border: 1px solid #0C85FF; border-radius: 20px;">
		<table class="table" style="margin-bottom: 0px">
			<thead>
				<tr>
					<th scope="col">Trạng thái</th>
					<th scope="col">Thời gian</th>
					<th scope="col">Mã số sách</th>
					<th scope="col">Tên sách</th>
					<th scope="col">Tác giả</th>
					<th scope="col">Nhà xuất bản</th>
					<th scope="col">Giá</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${borrowedBooks}">
					<tr>
						<td>Đang mượn</td>
						<td>${book.date}</td>
						<td>${book.barcode}</td>
						<td>${book.title}</td>
						<td>${book.author}</td>
						<td>${book.publisher}</td>
						<td>${book.price}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="d-flex flex-row justify-content-center mt-3">
		<button class="btn btn-primary pr-5 pl-5" style="margin-right: 80px;">Mượn
			sách</button>
		<button type="reset" class="btn btn-primary pr-5 pl-5"
			style="margin-left: 80px;">Hủy</button>
	</div>
</div>
