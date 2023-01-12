
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
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElmentsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		
		function deleteValue(){
			var url = "delete";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			
			for(var i = 0; i< list.length; i++){
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			
			}
			
			if(valueArr.length==0){
				alert("선택된 글이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url : url,
					type : 'POST',
					traditional : true,
					data : {
						valueArr : valueArr
					},
					success: function(jdata){
						if(jdata = 1) {
							alert("삭제 성공");
							location.replace("list");
						}
						else{
							alert("삭제 실패");
						
						}
					}
				});
			}	
		}
		
		
	</script>
<form name="userForm">
<h1>List Page</h1>
<table>
	<thead>
		<tr>
		<th scope="col"><input name="allCheck" id="allCheck" type="checkbox" /></th>
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
			<td class="text_ct"><input name="RowCheck" type="checkbox" value="${list.no}" /></td>
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
<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">


</form>

</body>
</html>
