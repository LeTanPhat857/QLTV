<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<%@ include file="component/head.jsp"%>
</head>

<body>
	<div class="container-xxl"
		style="background-color: #F5F5F5; height: 100%; padding: 0;">
		<%@ include file="component/banner.jsp"%>

		<%@ include file="component/navigation.jsp"%>

		<div class="content d-flex justify-content-between"
			style="height: auto;">
			<div class="title  p-2 bd-highlight">Chỉnh sửa thông tin đọc
				giả</div>
			<button type="button"
				class="btn btn-primary p-2 bd-highlight rounded-pill"
				data-toggle="button" aria-pressed="false">Đăng kí thư viện</button>
		</div>
		<div class="content text-center border border-dark rounded p-2 mr-5 mt-3	" style="width:80%;height:auto ">
			<form action="" method="post" enctype = "multipart/form-data">
				<div class="row">
					<div class="col-6">
						<img alt=""  class="img-thumbnail rounded mx-auto d-block" style="max-width: 80%"  src="images/trangTongQuan.jpg" >
						<input type="file" name="fileImg" multiple ><br><br>
					</div>
					<div class=" col-6 row">
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Đối tượng 
							</label> 
							<select class="custom-select col-8"
								id="inputGroupSelect02">
								<option selected>Choose...</option>
								<option value="1" name="position">sinh viên</option>
								<option value="2" name="position">giảng viên</option>
								<option value="3" name="position">khác</option>
							</select>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Họ và tên 
							</label>
							<div class="col-8">
								<input type="email" class="form-control" placeholder="Họ Và Tên"
									name="name">
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Giới tính
							</label>
							<div class="col-8 d-flex ">
								<div class="custom-control custom-radio">
									<input type="radio" id="customRadio1" name="sex" value="true"
										class="custom-control-input">
									<label
										class="custom-control-label" for="customRadio1">Nam
									</label>
								</div>
								<div class="custom-control custom-radio ml-2">
									<input type="radio" id="customRadio2" name="sex" value="false"
										class="custom-control-input">
									 <label
										class="custom-control-label" for="customRadio2">Nữ
									</label>
								</div>
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Số CMND
							</label>
							<div class="col-8">
								<input type="email" class="form-control" name="cmnd">
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="number" class="col-4 col-form-label">Mã số sinh viên
							</label>
							<div class="col-8">
								<input type="text" class="form-control" name="student_code">
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Địa chỉ
							</label>
							<div class="col-8">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Email</label>
							<div class="col-8">
								<input type="email" class="form-control" id="inputEmail"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group row col-12">
							<label for="inputEmail" class="col-4 col-form-label">Số
								điện thoại</label>
							<div class="col-8">
								<input type="number" class="form-control" name="phone">
							</div>
						</div>
					</div>
				</div>
				<input class="btn btn-primary mr-5" type = "submit" value = "Xác nhận" />
				<input class="btn btn-primary" type = "submit" value = "Hủy" />
			</form>
		</div>

		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>