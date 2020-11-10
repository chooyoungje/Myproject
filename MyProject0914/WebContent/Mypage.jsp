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

<div style="margin-left:auto;margin-right:auto; width:80%;height:100%">
	<div style="">
		<fieldset>
		<legend>회원정보</legend>
		<div>
		<table border=1>
			<tr>
				<th>아이디</th><th>이름</th><th>생년월일</th><th>주소</th><th>휴대폰 번호</th><th>회원수정</th>
			</tr>
			<tr>
				<td>${mdto.mid}</td>
				<td>${mdto.mname}</td>
				<td>${mdto.mbirth}</td>
				<td>${mdto.maddress}</td>
				<td>${mdto.mphone}</td>
				<td><button onclick="location.href='memberupdate'">회원수정</button></td>
			</tr>
		
		</table>
		</div>
		</fieldset><br>
	</div>
	
	<script>

	
	</script>
	
	<div>
		<fieldset>
		<legend>장바구니</legend>
		<div>
		<table border=1>
			<tr>
				<th>상품번호</th><th>상품이름</th><th>상품가격</th><th>상품수량</th>
			</tr>
			<c:forEach var="baslist" items="${baslist}">
			<tr>
				<td>${baslist.bpnumber} </td>
				<td>${baslist.bpname} </td>
				<td>${baslist.bpprice} </td>
				<td>${baslist.pbamount} </td>
				<td><button onclick="location.href='basketdelete?bpnumber='+${baslist.bpnumber}">장바구니 삭제</button></td>
			</tr>
			</c:forEach>
		
		</table>
		</div>
		</fieldset><br>
	</div>
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
				<td>${blist.bdate}</td>
				<td>${blist.bhits}</td>
				<td><button onclick="location.href='boardupdate?bnumber='+${blist.bnumber}">글 수정</button></td>
				<td><button onclick="location.href='boarddelete?bnumber='+${blist.bnumber}">글 삭제</button></td>
			</tr>
			</c:forEach>
		
		</table>
		</div>
		</fieldset>
	</div>
</div>	

		






</body>
</html>