
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="component/head.jsp"%>

<style>
.selected {
	background-color: #CCE6FF !important;
}

.pointer {
	cursor: pointer !important;
}

.form-group {
	margin-bottom: 0.3rem !important;
}

.left-25px {
	left: -25px !important;
}
</style>
<script type="text/javascript">
	function notify(content) {
		$("#contentNoti").text(content);
		$("#notiModal").modal("show");
	}
	
	function clickNav(page, target) {
		console.log("navi page: " + page);
		// change selected
		$(".navigation > ul li").removeClass("selected");
		$(target).addClass("selected");
		// get page
		switch (page) {
		case "overviewPage":
			$.get("default?page=overview", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "getUserInfo_borrowPage":
			$.get("default?page=confirmLibraryCard&activity=borrow", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
				$("#libraryCardId").focus();
			})
			break;
		case  "getUserInfo_payPage":
			$.get("default?page=confirmLibraryCard&activity=pay", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
				$("#libraryCardId").focus();
			})
			break;
		case  "manageReaderPage":
			$.get("default?page=manageReader", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "manageBookPage":
			$.get("default?page=manageBook", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "manageStaffPage":
			$.get("default?page=manageStaff", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		case  "configPage":
			$.get("default?page=config", result => {
				console.log(result);
				$("#content").html("");
				$("#content").append(result);
			})
			break;
		}
	}
	
	function getUserInfo(activity) {
		console.log("libraryCardId: " + $("#libraryCardId").val() + ", activity: " + activity);
		$.post(
				"getUserInfo",
				{"libraryCardId": $("#libraryCardId").val(), "activity": activity},
				result => {
					console.log("getUserInfo: " + result);
					if (result.includes("error")) {
						notify("* Mã thẻ thư viện không hợp lệ! Vui lòng kiểm tra lại!");
					} else {
						$("#content").html("");
						$("#content").append(result);						
						$("#barcode").focus();
					}
				})
		$("#libraryCardId").val("");
	}
	
	function getUserInfo_keyEvent(event, activity) {
		console.log("key event: " + event.key + ", activity: " + activity);
		console.log("libraryCardId: " + $("#libraryCardId").val());
		if	(event.keyCode === 13 || event.which === 13) {
			console.log(event.keyCode);
			getUserInfo(activity);
		}
	}
	
	function addBook() {
		console.log("barcode: " + $("#barcode").val());
		$.post(
				"addBook",
				{"barcode": $("#barcode").val()},
				result => {
					console.log(result);
					
					const response = JSON.parse(result);
					if (response.status.includes("error")) {
						notify(response.data);
					} else {
						$("#info tbody").append(
								"<tr>" 
							+	"<td>Sẵn sàng</td>"
							+	"<td>"+ response.data.date +"</td>"
							+	"<td>"+ response.data.barcode +"</td>"
							+	"<td>"+ response.data.title +"</td>"
							+	"<td>"+ response.data.author +"</td>"
							+	"<td>"+ response.data.publisher +"</td>"
							+	"<td>"+ response.data.price +"</td>"
							+	"</tr>")
					}						
				})
	$("#barcode").val("");
	}
	
	function addBook_keyEvent(event) {
		console.log("key event: " + event.key);
		console.log("barcode: " + $("#barcode").val());
		if	(event.keyCode === 13 || event.which === 13) {
			console.log(event.keyCode);
			addBook();
		}
	}
	
	function borrowBook() {
		$.get(
				"borrowBook",
				result => {
					console.log(result);
					if (result.includes("bookError")) {
						notify("* Không thể mượn sách! Sách chưa được thêm vào hàng đợi!")
					} else if (result.includes("databaseError")) {
						notify("* Không thể mượn sách! Không thể lưu lịch sử mượn sách vào cơ sở dữ liệu!");
					} else {
						$("#content").html("");
						$("#content").append(result);	
						notify("Mượn sách thành công! Lịch sử mượn sách đã được lưu vào cơ sở dữ liệu!");
					}
				})
	}
	
	function chooseBook(barcode) {
		$.post(
			"chooseBook",
			{"barcode":barcode},
			result => {
				console.log(result);
				const response = JSON.parse(result);
				if (response.status === "error") {
					notify(response.data);
				} else {
					if ($("#" + barcode +"xyz").prop("checked") === true) {
						$("#" + barcode + " td:first-child").text("Sẵn sàng");						
					} else {
						$("#" + barcode + " td:first-child").text("Đã mượn");												
					}
				}
			})
	}
	
	function payBook() {
		$.get(
				"payBook",
				result => {
					console.log(result);
					if (result.includes("bookError")) {
						notify("* Không thể trả sách! Sách chưa được chọn vào hàng đợi!")
					} else if (result.includes("databaseError")) {
						notify("* Không thể trả sách! Không thể lưu lịch sử trả sách vào cơ sở dữ liệu!");
					} else {
						$("#content").html("");
						$("#content").append(result);	
						notify("Trả sách thành công! Lịch sử trả sách đã được lưu vào cơ sở dữ liệu!");
					}
				})
	}
	
	function cancelBorrowAndPayBook(activity) {
		$.post(
				"cancelBorrowAndPayBook",
				{"activity":activity},
				result => {
					console.log(result);
          $("#content").html("");
					$("#content").append(result);	
				})
	}         
	
  
	// trở lại trang đăng kí thẻ thư viện
	function cancelRegisterLibraryCard(){
		console.log('click cancel');
		$.get(
				"cancelRegisterLibrary",
				result => {
					console.log($("#content").children());
					$("#content").children().remove();
					$("#content").append(result);	
				})
	}
	// chuyển snag trang đăng kí thẻ thư viện
	function registerLibraryCard(){
		console.log('click registerLibraryCard');
		$.get(
				"registerLibraryCard",
				result => {
					console.log(result);
					$("#content").children().remove();
					$("#content").append(result);	
				})
	}
	// chức năng xóa đọc giả
	function deleteReader(libraryCardId){
		console.log(libraryCardId);
		var confim = confirm("Bạn có muốn xóa tài khoản "+libraryCardId);
		if (confim) {
			$.post(
					"deleteUser",
					{"libraryCardId":libraryCardId},
					result => {
						if (result.includes("failDeleted!!")) {
							alert("* Xóa tài khoản không thành công");
						} else {
							alert("* Xóa tài khoản "+libraryCardId+" thành công!!");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
			})
		}else return
		
	}
	// chuyển sang trang thêm nhan viên
	function addStaff(){
		console.log('nek');
		$.get(
				"addStaff",
				result => {
					console.log($("#content").children());
          		if (result.includes("error")) {
						alert("* Mã thẻ thư viện không hợp lệ! Vui lòng kiểm tra lại!");
					} else {
						$("#content").children().remove();
						$("#content").append(result);						
					}	
				})
	}
	// nút hủy thêm nhân viên => trở lại trang  quản lý nhân viên
	function cancelAddStaf(){
		$.get("default?page=manageStaff", result => {
			console.log(result);
			$("#content").children().remove();
			$("#content").append(result);
		})
	}
	// chức ăng

	// số trang click của trang sách
	function clickPageNumberPageBook(i){
		console.log(i)
			$.post(
					"getListBook",
					{"index":i},
					result => {
						console.log(result);
						$("#content").children().remove();
						$("#content").append(result);
					})
	}
	// kiểm tra lỗi của form đăng kí thẻ thư viện
	function validateFormLibraryCard() {
		var libraryCardId = document.getElementById("studentId").value;
		var studentName = document.getElementById("studentName").value;
		var CMND = document.getElementById("CMND").value;
		var inputEmail = document.getElementById("inputEmail").value;
		var adressReader = document.getElementById("adressReader").value;
		var mailformat = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    if (libraryCardId == null || libraryCardId == "") {
	        alert("Mã thẻ thư viện cần được điền vào đầy đủ");
	        document.getElementById("studentId").focus();
	        return false;
	    } else if (studentName == null || studentName == "") {
	        alert("Chưa điền họ và tên");
	        document.getElementById("studentName").focus();
	        return false;
	    }else if (CMND == null || CMND == "") {
	        alert("Chưa điền số chứng minh nhân dân");
	        document.getElementById("CMND").focus();
	        return false;
	    }else if (adressReader == null || adressReader == "") {
	        alert("Chưa điền địa chỉ");
	        document.getElementById("adressReader").focus();
	        return false;
	    }else if ( inputEmail == null || inputEmail == "" ||!mailformat.test(String(inputEmail).toLowerCase())) {
	        alert("Lỗi mail vui lòng nhập lại");
	        document.getElementById("inputEmail").focus();
	      return false;
	    }
	    return true;
	    
	}
	// chức năng đăng kí thẻ thư viện(giống chức năng chỉnh sửa)
	async function confirmRegisterLibraryCard(){
		var check = validateFormLibraryCard();
		if(check){
		let formData = new FormData(); 
	    formData.append("file", nameFileLibraryCard.files[0]);
	    await fetch('UploadFileImage', {
	      method: "POST", 
	      body: formData,
	    }); 
		$.post(
				"registerLibraryCard",
				{"libraryCardId":$("#studentId").val(),
				"password":123456789,
				"name":$("#studentName").val(),
				"CMND":$("#CMND").val(),
				"gender":document.querySelector('input[name=sex]:checked').value,
				"birthday":$("#birthdayReader").val(),
				"email":$("#inputEmail").val(),
				"address":$("#adressReader").val(),
				"img":nameFileLibraryCard.files[0].name},
				result => {
					if (result.includes("error")) {
						alert("* Mã số sinh viên đã tồn tại\n\t vui lòng kiểm tra lại");
					}else if (result.includes("fail")) {
						alert("* Thao tác thất bại!!\n Vui lòng kiểm tra lại");
					}else {
						alert("* Thêm đọc giả thành công");
						$("#content").children().remove();
						$("#content").append(result);						
					}	
				}	
				) 
		}else{
			alert("* Thao tác thất bại!!\n Vui lòng kiểm tra lại");
			return;
		}
	}
	//  chuyển sang update đọc giả với id của đọc giả... 
	function updateReaderPage(libraryCardId){
		$.get(
				"updateReader",
				{"libraryCardId":libraryCardId},
				result => {
					console.log(result);
					$("#content").children().remove();
					$("#content").append(result);
				})
	}
	// chức năng chỉnh sửa/ update thể thư viện
	async function confirmUpdateLibraryCard(){
		var check = validateFormLibraryCard();
		if(check){
			// nếu ảnh có sự thay đổi thì updload ảnh, ngược lại thì cập nhật lấy đường link ảnh cũ
			if(nameFileLibraryCard.files[0] === undefined){
				console.log();
			}else{
				let formData = new FormData(); 
			    formData.append("file", nameFileLibraryCard.files[0]);
			    await fetch('UploadFileImage', {
			      method: "POST", 
			      body: formData,
			    }); 
			}
			$.post(
				"updateReader",
				{"libraryCardId":$("#studentId").val(),
				"password":123456789,
				"name":$("#studentName").val(),
				"CMND":$("#CMND").val(),
				"gender":document.querySelector('input[name=sex]:checked').value,
				"birthday":$("#birthdayReader").val(),
				"email":$("#inputEmail").val(),
				"address":$("#adressReader").val(),
				"img": nameFileLibraryCard.files[0] === undefined ?  document.getElementById("imgid").src.split("/").pop() : nameFileLibraryCard.files[0].name },
				result => {
					if (result.includes("fail")) {
						alert("* Thao tác cập nhật thất bại!!\n Vui lòng kiểm tra lại");
					}else {
						alert("* Cập nhật đọc giả thành công");
						$("#content").children().remove();
						$("#content").append(result);						
					}	
				}	
				) 
		}
	}
	//
	
	// chuyên sang trang thêm sách
 	function tranferToAddBookPage(){
		$.get("AddNewBook", result => {
			console.log(result);
			$("#content").children().remove();
			$("#content").append(result);
		})
	}
	// kiem tra số
 	function isNumber(n) { 
 		return /^-?[\d.]+(?:e-?\d+)?$/.test(n); } 
	
	// chức năng thêm sách 
	async function confirmAddBook(){
		if(isNumber($("#barCode").val()) && isNumber($("#price").val()) && isNumber($("#quantityBook").val()) ){
		if(nameImgBook.files[0] === undefined ){
			alert('vui lòng chọn ảnh bìa sách')
			return;
		}else{
			let formData = new FormData(); 
		    formData.append("file", nameImgBook.files[0]);
		    await fetch('UploadFileBook', {
		      method: "POST", 
		      body: formData,
		    }); 
		    $.post(
					"AddNewBook",
					{"barCode":$("#barCode").val(),
					"bookName":$("#bookName").val(),
					"author":$("#author").val(),
					"publisherId":$("#publisherId").val(),
					"languageId":$("#languageId").val(),
					"typeId":$("#typeId").val(),
					"price":$("#price").val(),
					"description":$("#description").val(),
					"numpageBook":$("#quantityBook").val(),
					"img": nameImgBook.files[0].name},
					result => {
						if (result.includes("fail")) {
							alert("* Thêm sách thất bại!!\n Vui lòng kiểm tra lại");
						}else{
							alert("* Thêm sách thành công");
							$("#content").children().remove();
							$("#content").append(result);						
						}
					}	
		   	 )
			}
		}else{
			alert('Vui lòng điền đầy đủ thông tin.\n*barCode, số lượng, giá bìa là chữ số*')
		}
	}

	//thêm ngôn ngữ
	function addLanguage(){
		var languageInput = prompt("Nhập ngôn ngữ:");
		if(languageInput != null && languageInput != ''	){
			$.post(
					"insertLanguage",
					{"language":languageInput},
					result => {
						if (result.includes("error")) {
							alert("* Thêm ngôn ngữ thất bại!!\n\tVui lòng thử lại");
						}else {
							alert("* Đã thêm ngôn ngữ thành công");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
					})
		}else{
			alert('Không được để trống\n\tVui lòng nhập ngôn ngữ sách')
			return
		}
	}
	//thêm thể loại sách
	function addType(){
		var typeBookInput = prompt("Nhập Thể Loại sách:");
		if(typeBookInput != null && typeBookInput != ''	){
			$.post(
					"insertTypeBook",
					{"typeBook":typeBookInput},
					result => {
						if (result.includes("error")) {
							alert("* Thêm thể loại thất bại!!\n\tVui lòng thử lại");
						}else {
							alert("* Đã thêm thể loại sách thành công");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
					})
		}else{
			alert('Thao tác thất bại\n\tVui lòng nhập tên thể loại sách')
			return
		}
	}
	// thêm tác giả
	function addAuthor(){
		var nameAuthorInput = prompt("Nhập Tên tác giả");
		if(nameAuthorInput != null && nameAuthorInput != ''	){
			var desciptionAuthorInput = prompt("Nhập mô tả\n(*có thể bỏ qua*)");
			$.post(
					"insertAuthorBook",
					{"authorBook":nameAuthorInput,
					"desciptionAuthor": desciptionAuthorInput},
					result => {
						if (result.includes("error")) {
							alert("* Thao tác thêm tác giả thất bại!!\n\tVui lòng thử lại");
						}else {
							alert("* Đã thêm tác giả thành công");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
					})
		}else{
			console.log('out')
			return
		}
	}
	// chức năng xóa sách
	function deleteBook(id){
		$.get("UpdateBook",{
			"id":id			
		}, 
		result => {
			if (result.includes("error")) {
				alert("* Sách này đang có người mượn. Không thể xóa!");
			}else {
				if (result.includes("fail")) {
					alert("* Xóa sách thất bại! Vui lòng kiểm tra lại");
				}else{
					console.log(result);
					alert("* Xóa sách "+ id + " thành công");
					$("#content").children().remove();
					$("#content").append(result);
				}
			}
		})
	}
	
	// chuyen sang trang update Book
	function tranferToUpdateBookPage(id){
		$.post(
				"UpdateBook",
				{"id":id},
				result => {
					console.log(result);
					$("#content").children().remove();
					$("#content").append(result);
				})
	}
	
	
	async function confirmUpdateBook(){
	if(isNumber($("#barCode").val()) && isNumber($("#price").val()) && isNumber($("#quantityBook").val()) ){	
		if(nameImgBook.files[0] === undefined){
			console.log('ảnh ko có sự thay đổi')
		}else{
			console.log('upload ảnh mới');
			let formData = new FormData(); 
		    formData.append("file", nameImgBook.files[0]);
		    await fetch('UploadFileBook', {
		      method: "POST", 
		      body: formData,
		    }); 
		}
		let formData = new FormData(); 
	    formData.append("file", nameImgBook.files[0]);
	    await fetch('UploadFileBook', {
	      method: "POST", 
	      body: formData,
	    }); 
	    $.post(
				"confirmUpdateBook",
				{"barCode":$("#barCode").val(),
				"bookName":$("#bookName").val(),
				"author":$("#author").val(),
				"publisherId":$("#publisherId").val(),
				"languageId":$("#languageId").val(),
				"typeId":$("#typeId").val(),
				"price":$("#price").val(),
				"description":$("#description").val(),
				"numpageBook":$("#quantityBook").val(),
				"img": nameImgBook.files[0].name},
				result => {
					if (result.includes("fail")) {
						alert("* Cập nhật sách thất bại!!\n Vui lòng kiểm tra lại");
					}else{
						alert("* Cập nhật sách thành công");
						$("#content").children().remove();
						$("#content").append(result);						
					}
				}	
	   		 )
	   }else{
			alert('Vui lòng kiểm tra lại thông tin.\n*barCode, số lượng, giá bìa phải là chữ số*')
		}
	}
</script>
</head>

<body>
	<div class="container-xxl"
		style="background-color: #F5F5F5; height: 100%; padding: 0;">
		<%@ include file="component/banner.jsp"%>

		<%@ include file="component/navigation.jsp"%>

		<div id="content">
			<div class="text-center content">
				<h3 style="margin-top: 30px; color: #0C85FF;">Ngày mới an lành!</h3>
				<img
					style="display: block; max-width: 600px; margin: auto; margin-top: 25px;"
					src="adminPages/images/trangTongQuan.jpg" alt="image">
			</div>
		</div>

		<%@ include file="component/footer.jsp"%>
	</div>

	<!-- notification modal -->
	<div id="notiModal" class="modal fade bd-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="border-radius: 10px;">

				<div class="modal-header p-2">
					<div class="text-center">
						<h5
							style="font-size: 20px; font-weight: 700 !important; margin-left: 180px; margin-bottom: 0px">Thông
							báo !</h5>
					</div>
					<button type="button" class="close " data-dismiss="modal"
						aria-label="Close" style="outline: none;">
						<span aria-hidden="true"
							style="font-size: 25px; margin-right: 10px">&times;</span>
					</button>
				</div>

				<div id="contentNoti" class="font-weight-bold m-3 text-center">This
					is a notification!</div>

			</div>
		</div>
	</div>
</body>

</html>
