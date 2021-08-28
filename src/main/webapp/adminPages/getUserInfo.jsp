<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<div class="content">
	<div class="title">Xác nhận thẻ thư viện</div>

	<div class="form" style="margin-top: 80px">
		<form action="getUserInfo" method="post">
			<input name="libraryCardId" type="text" required
				placeholder="Nhập mã số thẻ thư viện"
				style="width: 100%; margin-bottom: 20px;">
			<button type="submit" class="btn btn-primary"
				style="display: block; margin: auto;">Xác nhận</button>
		</form>
	</div>
</div>
