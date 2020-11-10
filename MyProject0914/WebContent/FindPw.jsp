<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="maintool.jsp" flush="false"/>
<script>
function fpw(){
	findpwform.submit();
}
</script>
</head>
<body>
<div style="margin-left:auto;margin-right:auto;width:60%">
	<form action="findpw" method="post" name="findpwform">
		아이디<input type="text" name="mid"><br>
		생년월일 <input type="date" name="mbirth"><br>
	</form>
	<button onclick="fpw()">비밀번호 찾기</button>
</div>
</body>
</html>