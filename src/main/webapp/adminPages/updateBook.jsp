<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-xxl"
	style="background-color: #F5F5F5; height: 100%; padding: 0;">

	<div id="content">
		<div class="content d-flex justify-content-between"
			style="height: auto; padding-top: 5px">
			<div class="title bd-highlight">Chỉnh sửa sách</div>
		</div>
		<div class="content text-center pt-0">
			<form action="registerLibraryCard" method="post"
				style="border: 1px solid #0C85FF; border-radius: 20px; padding: 10px"
				enctype="multipart/form-data">

				<div class="row" style="margin-bottom: 5px">
					<div class="col-6">
						<img alt="" class="img-thumbnail rounded mx-auto d-block"
							style="max-width: 60%" src="images/book/${book.imgLink == null ? '0.jpeg' : book.imgLink}"> <input
							type="file" id="nameImgBook" class="dropify_" name="file"
							multiple><br>
					</div>

					<div class=" col-6 row text-left">
						<div class="form-group row col-12" style="margin-bottom: 20px">
							<label for="inputEmail" class="col-3 col-form-label">Barcode</label>
							<div class="col-9">
								<input id="barCode" required type="text" class="form-control"
									placeholder="Nhập Barcode"  disabled="disabled" value = "${book.barcode}" name="name">
							</div>
						</div>

						<div class="form-group row col-12" style="margin-bottom: 20px">
							<label for="inputEmail" class="col-3 col-form-label">Tên
								sách</label>
							<div class="col-9">
								<input id="bookName" required type="text" class="form-control"
									placeholder="Tên sách" value="${book.title}" name="name">
							</div>
						</div>

						<div class="form-group row col-12">
							<label for="inputEmail" required class="col-3 col-form-label">Tác
								giả </label>
							<div class="col-7">
								<div class="form-group">
									<select class="form-control" id="author">
										<c:forEach var="item" items="${listAuthor}">
											<option value="${item.id}" ${ item.id == book.authorId ? "selected" : ""} >${item.name }
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-2">
								<input type="button" id="inputGroup-sizing-sm" onclick="addAuthor()" value="+" class="btn btn-primary" >
							</div>
						</div>
						<div class="form-group row col-12">
							<%--@declare id="student_code"--%>
							<label for="student_code" class="col-3 col-form-label">Nhà
								xuất bản</label>
							<div class="col-7">
								<div class="form-group">
									<select class="form-control" id="publisherId">
										<option selected>Chọn nhà sản xuất</option>
										<c:forEach var="item" items="${listPublisher}">
											<option value="${item.id}"  ${ item.id == book.publisherId ? "selected" : ""}>${item.publisher }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-2">
								<input type="button" id="inputGroup-sizing-sm" value="+" class="btn btn-primary" >
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-3 col-form-label">Thể
								loại</label>
							<div class="col-7">
								<div class="form-group">
									<select class="form-control" id="typeId">
										<option selected>Chọn thể loại sách</option>
										<c:forEach var="item" items="${listType}">
											<option value="${item.id}" ${ item.id == book.typeId ? "selected" : ""} >${item.type }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-2">
								<input type="button" id="inputGroup-sizing-sm" onclick="addType()" value="+" class="btn btn-primary" >
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-3 col-form-label">Ngôn
								ngữ </label>
							<div class="col-7">
								<select class="form-control" id="languageId">
									<option selected>Chọn ngôn ngữ</option>
									<c:forEach var="item" items="${listLanguage}">
										<option value="${item.id}"${ item.id == book.languageId ? "selected" : ""}>${item.language }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-2">
								<input type="button" id="inputGroup-sizing-sm" onclick="addLanguage()" value="+" class="btn btn-primary" >
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 20px">
							<label for="inputEmail" class="col-3 col-form-label">Số
								trang</label>
							<div class="col-9">
								<input type="number" required class="form-control"
									id="quantityBook" value = "${book.pageNumber }" placeholder="Số Lượng">
							</div>
							
						</div>
						<div class="form-group row col-12" style="margin-bottom: 20px">
							<label for="number" class="col-3 col-form-label">Giá
								bìa</label>
							<div class="col-9">
								<input type="text"  value = "${book.price}" required class="form-control" id="price"
									placeholder="Nhập giá">
							</div>
						</div>
						<div class="form-group col-12">
							<label for="exampleFormControlTextarea1">Mô tả nội dung</label>
							<textarea class="form-control" id="description"
								rows="3">${book.description}</textarea>
						</div>
					</div>
				</div>
				<input id="registerButton" class="btn btn-primary mr-5"
					type="button" value="Xác nhận"
					onclick="confirmUpdateBook()" /> <input
					class="btn btn-primary" type="reset" value="Hủy"
					onclick="clickNav('manageBookPage', this)" />
			</form>
		</div>
	</div>

</div>
