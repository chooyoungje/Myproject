<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="maintool.jsp" flush="false"/>
<body>
	<p>아이디 ${mdto.mid}님의 비밀번호는 ${mdto.mpassword} 입니다 </p><br>
	<button onclick="Main.jsp">로그인 하러가기</button>
</body>
</html>