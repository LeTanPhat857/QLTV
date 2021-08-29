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
			style="height: auto; padding-top:5px">
			<div class="title bd-highlight">Thêm nhân viên</div>

		</div>
		<div class="content text-center pt-0">
			<form action="registerLibraryCard" method="post"
				style="border: 1px solid #0C85FF; border-radius: 20px; padding: 10px"
				enctype="multipart/form-data">
				<div class="row" style="margin-bottom: 5px">
					<div class="col-6">
						<img alt="" class="img-thumbnail rounded mx-auto d-block"
							style="max-width: 60%" src="images/user/0.jpeg"> <input
							type="file" name="fileImg" placeholder="avatar" multiple><br>
						<br>
					</div>
					<div class=" col-6 row text-left">
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<label for="inputEmail" class="col-4 col-form-label">Đối
								tượng </label>
							<div class="col-8">
								<select class="custom-select" id="inputGroupSelect02"
									style="padding: .375rem .75rem">
									<option selected value="1">Sinh viên</option>
									<option value="2">Giảng viên</option>
									<option value="3">Khác</option>
								</select>
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<label for="inputEmail" class="col-4 col-form-label">Họ
								và tên </label>
							<div class="col-8">
								<input type="text" class="form-control" placeholder="Họ Và Tên"
									name="name">
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<label for="inputEmail" class="col-4 col-form-label">Giới
								tính </label>
							<div class="col-8 d-flex ">
								<div class="custom-control custom-radio mr-4"
									style="margin-top: auto; margin-bottom: auto;">
									<input type="radio" id="customRadio1" name="sex" value="true"
										checked class="custom-control-input"> <label
										class="custom-control-label" for="customRadio1">Nam </label>
								</div>
								<div class="custom-control custom-radio ml-2"
									style="margin-top: auto; margin-bottom: auto;">
									<input type="radio" id="customRadio2" name="sex" value="false"
										class="custom-control-input"> <label
										class="custom-control-label" for="customRadio2">Nữ </label>
								</div>
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<label for="inputEmail" class="col-4 col-form-label">Số
								CMND </label>
							<div class="col-8">
								<input type="text" class="form-control" name="cmnd">
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<%--@declare id="student_code"--%>
							<label for="student_code" class="col-4 col-form-label">Mã
								số sinh viên </label>
							<div class="col-8">
								<input type="text" class="form-control" name="student_code">
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<label for="inputEmail" class="col-4 col-form-label">Địa
								chỉ </label>
							<div class="col-8">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 10px">
							<label for="inputEmail" class="col-4 col-form-label">Email</label>
							<div class="col-8">
								<input type="email" class="form-control" id="inputEmail"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group row col-12" style="margin-bottom: 25px">
							<label for="inputEmail" class="col-4 col-form-label">Số
								điện thoại</label>
							<div class="col-8">
								<input type="text" class="form-control" name="phone">
							</div>
						</div>
					</div>
				</div>
				<input id="registerButton" class="btn btn-primary mr-5"
					type="button" value="Xác nhận" /> <input class="btn btn-primary"
					type="reset" value="Hủy" />
			</form>
		</div>

		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>