<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="maintool.jsp" flush="false"/>


	<div>
		<fieldset>
		<legend>작성한 글</legend>
		<div>
		<table border=1>
			<tr>
				<th>글번호</th><th>글제목</th><th>작성일</th><th>조회수</th>
			</tr>
			<c:forEach var="blist" items="${blist}">
			<tr>
				<td>${blist.bnumber}</td>
				<td>${blist.btitle}</td>
				<td>${blist.bwriter}</td>
				<td>${blist.bdate}</td>
				<td>${blist.hits}</td>
			</tr>
			</c:forEach>
		
		</table>
		</div>
		</fieldset>
	</div>
</body>
</html>