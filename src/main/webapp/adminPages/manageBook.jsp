
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content d-flex justify-content-between"
	style="height: auto; padding-top: 5px">
	<div class="title  p-2 bd-highlight">Quản lý sách</div>
	<div onclick="addBook()"
		style="width: 200px; height: 40px; margin-top: auto; margin-bottom: auto"
		class="btn btn-primary bd-highlight rounded-pill" data-toggle="button"
		aria-pressed="false">Nhập sách</div>
</div>

<div class="content pt-0">
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light border border-dark rounded ">
		<div class="nav-item dropdown border border-dark rounded"
			style="margin-right: 10px">
			<a class="nav-link dropdown-toggle text-dark" data-toggle="dropdown"
				href="#" role="button" aria-haspopup="true" aria-expanded="false">Nhập
				từ khóa bất kỳ</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a> <a
					class="dropdown-item" href="#">Something else here</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Separated link</a>
			</div>
		</div>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Nhập từ khóa cần tìm">
			<button class="btn btn-primary border border-primary rounded-0"
				type="submit">tìm</button>
		</form>
		<div class=" d-flex " style="margin: auto">
			<div class="nav-item dropdown border border-dark rounded mr-2">
				<a class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Tên sách </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</div>
			<div class="nav-item dropdown border border-dark rounded">
				<a class="nav-link dropdown-toggle text-dark" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Tăng dần </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</div>
		</div>
		<div>
			<button type="button" class="btn btn-primary">Reset</button>
		</div>
	</nav>
	<div class="data-table border border-dark rounded mt-3">
		<table class="table table-hover text-center mt-3">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Tên sách</th>
					<th scope="col">Thể Loại</th>
					<th scope="col">Tác giả</th>
					<th scope="col">Nhà Xuất Bản</th>
					<th scope="col">Ngôn Ngữ</th>
					<th scope="col">Gía bìa</th>
					<th scope="col">Tình Trạng</th>
					<th scope="col">Ngày tạo</th>
					<th scope="col">Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${listBook}">
					<tr>
						<th>${book.barcode}</th>
						<td>${book.title}</td>
						<td>${book.type}</td>
						<td>${book.author}</td>
						<td>${book.publisher}</td>
						<td>${book.language}</td>
						<td>${book.price}</td>
						<td>${book.status}</td>
						<td>${book.createdDate}</td>
						<td>
							<button class="btn btn-green border border-primary rounded-0"
								type="submit">Sửa</button>
							<button class="btn btn-danger border border-primary rounded-0"
								type="submit" onclick="deleteReader(${user.libraryCardId})">Xóa</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="...">
			<ul class="pagination pagination-lg">
				<li class="page-item primary"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
			</ul>
		</nav>
	</div>
</div>
