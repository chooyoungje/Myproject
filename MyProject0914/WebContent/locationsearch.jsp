<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="maintool.jsp" flush="false"/>

	<h3>검색결과</h3>
	<table border=1 style="margin-left:auto;margin-right:auto;">
		<tr>
			<th>시설이름</th><th>시설주소</th><th>시설이미지</th>
		</tr>
	<c:forEach var="i" items="${llist}">
		<tr>
			<td>${i.lname}</td>
			<td>${i.location}</td>
			<td><img src="LocationFile/${i.lfile}" width="300px" height="200px"></td>
		</tr>
	</c:forEach>
	</table>
	
<script>
</script>
	

</body>
</html>