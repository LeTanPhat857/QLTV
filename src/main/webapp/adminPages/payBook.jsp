<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content" style="padding-top: 5px">
	<div class="title">Trả sách</div>

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
					sinh: <fmt:formatDate pattern="dd/MM/yyyy"
						value="${reader.birthday}" />
				</span> <span>Giới tính: ${reader.gender}</span> <span>Trạng thái:
					${readerStatus.status}</span>
			</div>
		</div>

		<div class="addBook p-2r"
			style="width: 40%; height: 218px; border: 1px solid #0C85FF; border-radius: 20px;">
			<div class="font-weight-bold mb-3 mt-3 text-center"
				style="font-size: 24px">Chọn sách</div>

			<div
				class=" d-flex flex-column justify-content-center font-weight-bold ml-4"
				style="font-size: 18px">

				<c:forEach var="book" items="${borrowedBooks}">
					<div class="form-check mb-3" style="">
						<input class="form-check-input" type="checkbox"
							style="height: 20px; width: 20px"
							onclick="chooseBook(${book.barcode})" id="${book.barcode}xyz">
						<label class="form-check-label ml-2" for="${book.barcode}xyz">${book.title}</label>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>

	<div id="info"
		style="display: block; margin: auto; width: 95%; border: 1px solid #0C85FF; border-radius: 20px;">
		<table class="table text-center" style="margin-bottom: 0px">
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
					<tr id="${book.barcode}">
						<td class="font-weight-bold">Đã mượn</td>
						<td><fmt:formatDate pattern="HH:mm:ss dd/MM/yyyy"
								value="${book.date}" /></td>
						<td>${book.barcode}</td>
						<td class="font-weight-bold">${book.title}</td>
						<td>${book.author}</td>
						<td>${book.publisher}</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="0"
								value="${book.price}" /> đ</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="d-flex flex-row justify-content-center mt-3">
		<button id="borrowButton" class="btn btn-primary pr-5 pl-5"
			onclick="payBook()" style="margin-right: 80px;">Trả sách</button>
		<button id="resetButton" type="reset"
			class="btn btn-primary pr-5 pl-5"
			onclick="cancelBorrowAndPayBook('pay')" style="margin-left: 80px;">Hủy</button>
	</div>
</div>