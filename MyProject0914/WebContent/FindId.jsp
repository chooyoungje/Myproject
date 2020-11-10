<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="maintool.jsp" flush="false"/>
<script>
function fid(){
	findidform.submit();
}
</script>
</head>
<body>
<div style="margin-left:auto;margin-right:auto;width:60%">
	<form action="findid" method="post" name="findidform">
		이름<input type="text" name="mname"><br>
		생년월일 <input type="date" name="mbirth"><br>
	</form>
	<button onclick="fid()">ID 찾기</button>
</div>	

</body>
</html>