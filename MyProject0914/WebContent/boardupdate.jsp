<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function boardwrite(){
		writeform.submit();
	}
</script>
</head>
<body>
	<form action="boardupdateprocess" method="post" enctype="multipart/form-data" name="writeform">
	<input type="hidden" name="bnumber" value="${bupdate.bnumber}">
	제목<input type="text" name="btitle" id="btitle" value="${bupdate.btitle}"><br>
	내용<textarea cols="30" rows="10" name="bcontents" id="bcontents">${bupdate.bcontents}</textarea><br>
	파일첨부<input type="file" name="bfile" id="bfile" value="${bupdate.bfile}"><br>
	</form>
	<button onclick="boardwrite()">글수정</button>

</body>
</html>