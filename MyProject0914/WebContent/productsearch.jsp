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
	<h3>검색결과</h3>
	
	<c:forEach var="i" items="${plist}">
		${i.pnumber}
		${i.pname}
		${i.pcontents}
		${i.pfile}
		${i.pprice}
	</c:forEach>
	
	

</body>
</html>