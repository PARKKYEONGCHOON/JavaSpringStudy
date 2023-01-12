
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<meta charset="UTF-8">
	<title>list</title>
</head>
<body>
<form name="userForm">
<h1>List Page</h1>
<table>
	<thead>
		<tr>
		<th scope="col">번호</th>
		<th scope="col">ID</th>
		<th scope="col">성함</th>
		<th scope="col">목표</th>
		<th scope="col">작성일</th>
		<th scope="col">작성시간</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="list">
		<tr>
			<td class="text_ct">${list.no}&nbsp;</td>
			<td class="text_ct">${list.id}&nbsp;</td>
			<td class="text_ct"><a href="${path}/board/detail?no=${list.no}">${list.name}&nbsp;</a></td>
			<td class="text_ct">${list.goal}&nbsp;</td>
			<td class="text_ct"><fmt:formatDate value="${list.date}" pattern="yyyy/MM/dd"/></td>
			<td class="text_ct"><fmt:formatDate value="${list.time}" pattern="HH:mm:ss"/></td>
		</tr>
		</c:forEach>
	</tbody>
</table>

<a href="<c:url value='/board/create' />" role="button" class="btn btn-outline-info">글쓰기</a>


</form>

</body>
</html>
