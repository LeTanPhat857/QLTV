<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="content" style="padding-top: 5px">
	<c:choose>
		<c:when test="${activity == 'borrow'}">
			<div class="title">Xác nhận thẻ thư viện - Mượn sách</div>
		</c:when>
			<c:otherwise>
			<div class="title">Xác nhận thẻ thư viện - Trả sách</div>
		</c:otherwise>
	</c:choose>
	<div class="form" style="margin-top: 80px">
		<c:choose>
			<c:when test="${activity == 'borrow'}">
				<input id="libraryCardId" name="libraryCardId" type="text"
					onkeypress="getUserInfo_keyEvent(event, 'borrow')"
					placeholder="Nhập mã số thẻ thư viện mượn sách" autofocus
					style="width: 100%; margin-bottom: 20px; padding: 5px; border: solid 2px rgb(95, 186, 233); outline: none; border-radius: 5px;">
				<button type="button" class="btn btn-primary"
					onclick="getUserInfo('borrow')"
					style="display: block; margin: auto;">Xác nhận</button>
			</c:when>
			<c:otherwise>
				<input id="libraryCardId" name="libraryCardId" type="text"
					onkeypress="getUserInfo_keyEvent(event, 'pay')"
					placeholder="Nhập mã số thẻ thư viện trả sách" autofocus
					style="width: 100%; margin-bottom: 20px; padding: 5px; border: solid 2px rgb(95, 186, 233); outline: none; border-radius: 5px;">
				<button type="button" class="btn btn-primary"
					onclick="getUserInfo('pay')" style="display: block; margin: auto;">Xác
					nhận</button>
			</c:otherwise>
		</c:choose>
	</div>
</div>
