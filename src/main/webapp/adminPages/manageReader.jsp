<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div class="content d-flex justify-content-between"
	style="height: auto;">
	<div class="title  p-2 bd-highlight">Quản lý đọc giả</div>
	<a type="button" href="default?page=registerLibraryCard"
		style="width: 180px; height: 38px; margin-top: auto; margin-bottom: auto"
		class="btn btn-primary bd-highlight rounded-pill" data-toggle="button"
		aria-pressed="false">Đăng kí thẻ thư viện</a>
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
					<th scope="col">Họ và tên</th>
					<th scope="col">CMND</th>
					<th scope="col">Ngày Sinh</th>
					<th scope="col">Gioi Tính</th>
					<th scope="col">Số điện thoại</th>
					<th scope="col">Email</th>
					<th scope="col">Địa chỉ</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<th>1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<th>1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

