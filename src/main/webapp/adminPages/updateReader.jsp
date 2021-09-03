<%@ page contentType="text/html;charset=UTF-8" language="java"%>

	<div class="container-xxl"
		style="background-color: #F5F5F5; height: 100%; padding: 0;">
	
		<div id="content">
			<div class="content d-flex justify-content-between"
				style="height: auto; padding-top: 5px">
				<div class="title bd-highlight">Cập nhật thông tin đọc giả</div>
			</div>
			<div class="content text-center pt-0">
				<form action="registerLibraryCard" method="post"
					style="border: 1px solid #0C85FF; border-radius: 20px; padding: 10px"
					enctype="multipart/form-data">
						
						<div class="row" style="margin-bottom: 5px">
						<div class="col-6">
							<img alt=""  class="img-thumbnail rounded mx-auto d-block"
								style="max-width: 60%" id = "imgid" src="images/user/${user.imgLink == null ? '0.jpeg' : user.imgLink}">
							<input type="file" id= "nameFileLibraryCard" class ="dropify_" name="file"	 multiple><br>
						</div>
						
						<div class=" col-6 row text-left">
						
							<div class="form-group row col-12" style="margin-bottom: 10px">
								<label for="inputEmail"  class="col-4 col-form-label">Họ
									và tên </label>
								<div class="col-8" >
									<input id = "studentName" required type="text" class="form-control" placeholder="Họ Và Tên"
										name="name" value="${user.name}">
								</div>
							</div>
							<div class="form-group row col-12" style="margin-bottom: 10px">
								<label for="inputEmail" class="col-4 col-form-label">Giới
									tính </label>
								<div class="col-8 d-flex" id = "gendel">
									<div class="custom-control custom-radio mr-4"
										style="margin-top: auto; margin-bottom: auto;">
										<input  class="custom-control-input" type="radio" ${user.gender =='Nam'?'checked':''} id="customRadio1" name="sex" value="Nam">
											  <label class="custom-control-label" for="customRadio1">Nam </label>
									</div>
									<div class="custom-control custom-radio ml-2"
										style="margin-top: auto; margin-bottom: auto;">
										<input type="radio" id="customRadio2" ${user.gender =='Nữ'?'checked':''} name="sex" value="Nữ"
											class="custom-control-input"> <label
											class="custom-control-label" for="customRadio2">Nữ </label>
									</div>
								</div>
								
								
							</div>
							<div class="form-group row col-12" style="margin-bottom: 10px">
								<label for="inputEmail" required class="col-4 col-form-label">Số
									CMND </label>
								<div class="col-8">
									<input type="text" value="${user.CMND}" id = "CMND" class="form-control" name="cmnd">
								</div>
							</div>
							<div class="form-group row col-12" style="margin-bottom: 10px">
								<%--@declare id="student_code"--%>
								<label  for="student_code" class="col-4 col-form-label">Mã
									số sinh viên </label>
								<div class="col-8">
									<input id= "studentId"  disabled="disabled" value="${user.libraryCardId}" required type="text" class="form-control" name="student_code">
								</div>
							</div>
							<div class="form-group row col-12" style="margin-bottom: 25px">
								<label  for="inputEmail" class="col-4 col-form-label">Ngày sinh:</label>
								<div class="col-8">
									<input type="date"  value="${user.birthday}"  required id = "birthdayReader" class="form-control" name="phone">
								</div>
							</div>
							<div class="form-group row col-12" style="margin-bottom: 10px">
								<label for="inputEmail" class="col-4 col-form-label"  >Địa
									chỉ </label>
								<div class="col-8">
									<input type="text" value="${user.address}" required id = "adressReader" class="form-control">
								</div>
							</div>
							<div class="form-group row col-12" style="margin-bottom: 10px">
								<label for="inputEmail" class="col-4 col-form-label">Email</label>
								<div class="col-8">
									<input type="email" value="${user.email}" required class="form-control" id="inputEmail"
										placeholder="Email">
								</div>
							</div>
							
						</div>
					</div>
					<input id="registerButton" class="btn btn-primary mr-5"
						type="button" value="Xác nhận" onclick="confirmUpdateLibraryCard()" />
					 <input class="btn btn-primary"
						type="reset" value="Hủy" onclick="cancelRegisterLibraryCard()" />
				</form>
			</div>
		</div>

	</div>
