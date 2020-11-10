<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

img{
width:400px;height:400px
}
</style>
<script>
function boardwrite(){
	writeform.submit();
}
</script>
</head>
<body>
	<form action="boardwrite" method="post" enctype="multipart/form-data" name="writeform">
	작성자 <input type="text" name="bwriter" id="bwriter" readonly value="${sessionScope.loginid}"><br>
	제목<input type="text" name="btitle" id="btitle"><br>
	내용<br>
	<textarea cols="30" rows="10" name="bcontents" id="bcontents"></textarea><br>
	파일첨부<input type="file" name="bfile" id="image" accept="image/*" onchange="setThumbnail(event);"><br>
	<div id="image_container">
	</div> 

	<c:if test="${sessionScope.loginid eq 'admin'}">
		<input type="radio" name="bnotice" value="0">일반글<br>
		<input type="radio" name="bnotice" value="1">공지사항<br>
	</c:if>
	</form>
	<button onclick="boardwrite()">글작성</button><br>
<script> function setThumbnail(event) 
{ var reader = new FileReader(); 
reader.onload = function(event) { var img = document.createElement("img"); 
img.setAttribute("src", event.target.result); 
document.querySelector("div#image_container").appendChild(img); };
reader.readAsDataURL(event.target.files[0]); } 
</script>

</body>
</html>