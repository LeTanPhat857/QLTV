
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
						notify("* M?? th??? th?? vi???n kh??ng h???p l???! Vui l??ng ki???m tra l???i!");
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
							+	"<td>S???n s??ng</td>"
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
						notify("* Kh??ng th??? m?????n s??ch! S??ch ch??a ???????c th??m v??o h??ng ?????i!")
					} else if (result.includes("databaseError")) {
						notify("* Kh??ng th??? m?????n s??ch! Kh??ng th??? l??u l???ch s??? m?????n s??ch v??o c?? s??? d??? li???u!");
					} else {
						$("#content").html("");
						$("#content").append(result);	
						notify("M?????n s??ch th??nh c??ng! L???ch s??? m?????n s??ch ???? ???????c l??u v??o c?? s??? d??? li???u!");
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
						$("#" + barcode + " td:first-child").text("S???n s??ng");						
					} else {
						$("#" + barcode + " td:first-child").text("???? m?????n");												
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
						notify("* Kh??ng th??? tr??? s??ch! S??ch ch??a ???????c ch???n v??o h??ng ?????i!")
					} else if (result.includes("databaseError")) {
						notify("* Kh??ng th??? tr??? s??ch! Kh??ng th??? l??u l???ch s??? tr??? s??ch v??o c?? s??? d??? li???u!");
					} else {
						$("#content").html("");
						$("#content").append(result);	
						notify("Tr??? s??ch th??nh c??ng! L???ch s??? tr??? s??ch ???? ???????c l??u v??o c?? s??? d??? li???u!");
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
	
  
	// tr??? l???i trang ????ng k?? th??? th?? vi???n
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
	// chuy???n snag trang ????ng k?? th??? th?? vi???n
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
	// ch???c n??ng x??a ?????c gi???
	function deleteReader(libraryCardId){
		console.log(libraryCardId);
		var confim = confirm("B???n c?? mu???n x??a t??i kho???n "+libraryCardId);
		if (confim) {
			$.post(
					"deleteUser",
					{"libraryCardId":libraryCardId},
					result => {
						if (result.includes("failDeleted!!")) {
							alert("* X??a t??i kho???n kh??ng th??nh c??ng");
						} else {
							alert("* X??a t??i kho???n "+libraryCardId+" th??nh c??ng!!");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
			})
		}else return
		
	}
	// chuy???n sang trang th??m nhan vi??n
	function addStaff(){
		console.log('nek');
		$.get(
				"addStaff",
				result => {
					console.log($("#content").children());
          		if (result.includes("error")) {
						alert("* M?? th??? th?? vi???n kh??ng h???p l???! Vui l??ng ki???m tra l???i!");
					} else {
						$("#content").children().remove();
						$("#content").append(result);						
					}	
				})
	}
	// n??t h???y th??m nh??n vi??n => tr??? l???i trang  qu???n l?? nh??n vi??n
	function cancelAddStaf(){
		$.get("default?page=manageStaff", result => {
			console.log(result);
			$("#content").children().remove();
			$("#content").append(result);
		})
	}
	// ch???c ??ng

	// s??? trang click c???a trang s??ch
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
	// ki???m tra l???i c???a form ????ng k?? th??? th?? vi???n
	function validateFormLibraryCard() {
		var libraryCardId = document.getElementById("studentId").value;
		var studentName = document.getElementById("studentName").value;
		var CMND = document.getElementById("CMND").value;
		var inputEmail = document.getElementById("inputEmail").value;
		var adressReader = document.getElementById("adressReader").value;
		var mailformat = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    if (libraryCardId == null || libraryCardId == "") {
	        alert("M?? th??? th?? vi???n c???n ???????c ??i???n v??o ?????y ?????");
	        document.getElementById("studentId").focus();
	        return false;
	    } else if (studentName == null || studentName == "") {
	        alert("Ch??a ??i???n h??? v?? t??n");
	        document.getElementById("studentName").focus();
	        return false;
	    }else if (CMND == null || CMND == "") {
	        alert("Ch??a ??i???n s??? ch???ng minh nh??n d??n");
	        document.getElementById("CMND").focus();
	        return false;
	    }else if (adressReader == null || adressReader == "") {
	        alert("Ch??a ??i???n ?????a ch???");
	        document.getElementById("adressReader").focus();
	        return false;
	    }else if ( inputEmail == null || inputEmail == "" ||!mailformat.test(String(inputEmail).toLowerCase())) {
	        alert("L???i mail vui l??ng nh???p l???i");
	        document.getElementById("inputEmail").focus();
	      return false;
	    }
	    return true;
	    
	}
	// ch???c n??ng ????ng k?? th??? th?? vi???n(gi???ng ch???c n??ng ch???nh s???a)
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
						alert("* M?? s??? sinh vi??n ???? t???n t???i\n\t vui l??ng ki???m tra l???i");
					}else if (result.includes("fail")) {
						alert("* Thao t??c th???t b???i!!\n Vui l??ng ki???m tra l???i");
					}else {
						alert("* Th??m ?????c gi??? th??nh c??ng");
						$("#content").children().remove();
						$("#content").append(result);						
					}	
				}	
				) 
		}else{
			alert("* Thao t??c th???t b???i!!\n Vui l??ng ki???m tra l???i");
			return;
		}
	}
	//  chuy???n sang update ?????c gi??? v???i id c???a ?????c gi???... 
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
	// ch???c n??ng ch???nh s???a/ update th??? th?? vi???n
	async function confirmUpdateLibraryCard(){
		var check = validateFormLibraryCard();
		if(check){
			// n???u ???nh c?? s??? thay ?????i th?? updload ???nh, ng?????c l???i th?? c???p nh???t l???y ???????ng link ???nh c??
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
						alert("* Thao t??c c???p nh???t th???t b???i!!\n Vui l??ng ki???m tra l???i");
					}else {
						alert("* C???p nh???t ?????c gi??? th??nh c??ng");
						$("#content").children().remove();
						$("#content").append(result);						
					}	
				}	
				) 
		}
	}
	//
	
	// chuy??n sang trang th??m s??ch
 	function tranferToAddBookPage(){
		$.get("AddNewBook", result => {
			console.log(result);
			$("#content").children().remove();
			$("#content").append(result);
		})
	}
	// kiem tra s???
 	function isNumber(n) { 
 		return /^-?[\d.]+(?:e-?\d+)?$/.test(n); } 
	
	// ch???c n??ng th??m s??ch 
	async function confirmAddBook(){
		if(isNumber($("#barCode").val()) && isNumber($("#price").val()) && isNumber($("#quantityBook").val()) ){
		if(nameImgBook.files[0] === undefined ){
			alert('vui l??ng ch???n ???nh b??a s??ch')
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
							alert("* Th??m s??ch th???t b???i!!\n Vui l??ng ki???m tra l???i");
						}else{
							alert("* Th??m s??ch th??nh c??ng");
							$("#content").children().remove();
							$("#content").append(result);						
						}
					}	
		   	 )
			}
		}else{
			alert('Vui l??ng ??i???n ?????y ????? th??ng tin.\n*barCode, s??? l?????ng, gi?? b??a l?? ch??? s???*')
		}
	}

	//th??m ng??n ng???
	function addLanguage(){
		var languageInput = prompt("Nh???p ng??n ng???:");
		if(languageInput != null && languageInput != ''	){
			$.post(
					"insertLanguage",
					{"language":languageInput},
					result => {
						if (result.includes("error")) {
							alert("* Th??m ng??n ng??? th???t b???i!!\n\tVui l??ng th??? l???i");
						}else {
							alert("* ???? th??m ng??n ng??? th??nh c??ng");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
					})
		}else{
			alert('Kh??ng ???????c ????? tr???ng\n\tVui l??ng nh???p ng??n ng??? s??ch')
			return
		}
	}
	//th??m th??? lo???i s??ch
	function addType(){
		var typeBookInput = prompt("Nh???p Th??? Lo???i s??ch:");
		if(typeBookInput != null && typeBookInput != ''	){
			$.post(
					"insertTypeBook",
					{"typeBook":typeBookInput},
					result => {
						if (result.includes("error")) {
							alert("* Th??m th??? lo???i th???t b???i!!\n\tVui l??ng th??? l???i");
						}else {
							alert("* ???? th??m th??? lo???i s??ch th??nh c??ng");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
					})
		}else{
			alert('Thao t??c th???t b???i\n\tVui l??ng nh???p t??n th??? lo???i s??ch')
			return
		}
	}
	// th??m t??c gi???
	function addAuthor(){
		var nameAuthorInput = prompt("Nh???p T??n t??c gi???");
		if(nameAuthorInput != null && nameAuthorInput != ''	){
			var desciptionAuthorInput = prompt("Nh???p m?? t???\n(*c?? th??? b??? qua*)");
			$.post(
					"insertAuthorBook",
					{"authorBook":nameAuthorInput,
					"desciptionAuthor": desciptionAuthorInput},
					result => {
						if (result.includes("error")) {
							alert("* Thao t??c th??m t??c gi??? th???t b???i!!\n\tVui l??ng th??? l???i");
						}else {
							alert("* ???? th??m t??c gi??? th??nh c??ng");
							$("#content").children().remove();
							$("#content").append(result);						
						}	
					})
		}else{
			console.log('out')
			return
		}
	}
	// ch???c n??ng x??a s??ch
	function deleteBook(id){
		$.get("UpdateBook",{
			"id":id			
		}, 
		result => {
			if (result.includes("error")) {
				alert("* S??ch n??y ??ang c?? ng?????i m?????n. Kh??ng th??? x??a!");
			}else {
				if (result.includes("fail")) {
					alert("* X??a s??ch th???t b???i! Vui l??ng ki???m tra l???i");
				}else{
					console.log(result);
					alert("* X??a s??ch "+ id + " th??nh c??ng");
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
			console.log('???nh ko c?? s??? thay ?????i')
		}else{
			console.log('upload ???nh m???i');
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
						alert("* C???p nh???t s??ch th???t b???i!!\n Vui l??ng ki???m tra l???i");
					}else{
						alert("* C???p nh???t s??ch th??nh c??ng");
						$("#content").children().remove();
						$("#content").append(result);						
					}
				}	
	   		 )
	   }else{
			alert('Vui l??ng ki???m tra l???i th??ng tin.\n*barCode, s??? l?????ng, gi?? b??a ph???i l?? ch??? s???*')
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
				<h3 style="margin-top: 30px; color: #0C85FF;">Ng??y m???i an l??nh!</h3>
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
							style="font-size: 20px; font-weight: 700 !important; margin-left: 180px; margin-bottom: 0px">Th??ng
							b??o !</h5>
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
