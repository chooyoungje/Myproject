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
	<div style="width:80%;">
		<form style="float:left;" action="boardsearch" method="post" name="bsearchform">
			<input type="text" name="bsearch">
		</form>
		<button style="float:left;" onclick="bsearch()">게시판 검색</button>
	</div>

	<table border="1" style="float:left;">
		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>글제목</td>
			<td>작성일자</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="board" items="${boardList}" >
		
		<c:choose>  
			<c:when test="${1 eq board.bnotice}" >  
			<tr id="t1"> 
				<td style="color:red">${board.bnumber}</td>
				<td style="color:red">${board.bwriter}</td>
				<td style="color:red"><a
					href="boardview?bnumber=${board.bnumber}&page=${paging.page}">${board.btitle}</a></td>
				<td style="color:red">${board.bdate}</td>
				<td style="color:red">${board.bhits}</td>
				<c:if test="${sessionScope eq 'admin'}">
				<td style="color:red"><button onclick="location.href='boarddeleteadmin?bnumber='${board.bnumber}">글삭제</button></td>
				</c:if>
			</tr>
			</c:when>
			
			<c:otherwise> 
				<tr id="t1"> 
				<td>${board.bnumber}</td>
				<td>${board.bwriter}</td>
				<td><a
					href="boardview?bnumber=${board.bnumber}&page=${paging.page}">${board.btitle}</a></td>
				<td>${board.bdate}</td>
				<td>${board.bhits}</td>
				<c:if test="${sessionScope eq 'admin'}">
				<td><button onclick="location.href='boarddeleteadmin?bnumber='${board.bnumber}">글삭제</button></td>
				</c:if>
			</tr>
			</c:otherwise>
		</c:choose>
	
			
		</c:forEach>
		<tr>
			<td colspan="5"><button onclick="location.href='boardwrite.jsp'">글쓰기</button> </td>
		</tr>
	</table>

	
	
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	<!--&nbsp : 공백  -->
	<!--버튼 활성화 안함  -->
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="boardlistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
	
		<c:choose>  
		
			<c:when test="${i eq paging.page}">  
			${i}
			</c:when>
			
			<c:otherwise> 
				<a href="boardlistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	
		
	</c:forEach>

	<c:if test="${paging.page>=paging.maxPage}">
		[다음]
	</c:if>
	<!--버튼 활성화 안함  -->
	
	<c:if test="${paging.page<paging.maxPage}">
		<a href="boardlistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>
</div>
</body>
</html>