<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="news" items="${newsList}">
	<div class="m-5 p-3"
		style="border: 1px solid #3486e2; border-radius: 20px;">
		<div class="row ml-5">
			<div class="" style="border: 1px solid #3486e2;">
				<img style="width: 100px; height: 110px;" src="${news.imgLink}"
					alt="">
			</div>
			<div class="ml-5">
				<div class="font-weight-bold" style="">${news.title}</div>
				<div class="">
					<fmt:formatDate pattern="dd/MM/yyyy" value="${news.createdDate}" />
				</div>
				<div class="">${news.content}</div>
			</div>
		</div>
	</div>
</c:forEach>