<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="maintool.jsp" flush="false"/>
<body>
	<h3>검색결과</h3>
	<table border=1 style="margin-left:auto;margin-right:auto;">
		<tr>
			<th>상품번호</th><th>상품이름</th><th>상품이미지</th><th>상품가격</th>
		</tr>
	<c:forEach var="i" items="${plist}">
		<tr>
			<td>${i.pnumber}</td>
			<td><a href="productview?psearch=${i.pnumber}">${i.pname}</a></td>
			<td>${i.pfile}</td>
			<td>${i.pprice}</td>
		</tr>
	</c:forEach>
	</table>
	

</body>
</html>