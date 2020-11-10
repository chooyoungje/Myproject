<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="maintool.jsp" flush="false"/>
<div style="width:80%;height:80%; margin-right:auto; margin-left:auto;">
	<table border="1" >
		<tr>
			<td>회원ID</td>
			<td>회원PW</td>
			<td>이름</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>생년월일</td>
			<td>회원삭제</td>
			
		</tr>
		<c:forEach var="board" items="${boardList}" >
			<tr>
				<td>${board.mid}</td>
				<td>${board.mpassword}</td>
				<td>${board.mname}</td>
				<td>${board.maddress}</td>
				<td>${board.mphone}</td>
				<td>${board.mbirth}</td>
				<td><button onclick="location.href='memberdelete'+${board.mid}">회원삭제</button></td>
				
				
			</tr>
		</c:forEach>
		<tr>
		</tr>
	</table>
	
	
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	<!--&nbsp : 공백  -->
	<!--버튼 활성화 안함  -->
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="memberlistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	
		<c:choose>  
		
			<c:when test="${i eq paging.page}">  
			${i}
			</c:when>
			
			<c:otherwise> 
				<a href="memberlistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	
		
	</c:forEach>

	<c:if test="${paging.page>=paging.maxPage}">
		[다음]
	</c:if>
	<!--버튼 활성화 안함  -->
	
	<c:if test="${paging.page<paging.maxPage}">
		<a href="memberlistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>
</div>
</body>
</html>